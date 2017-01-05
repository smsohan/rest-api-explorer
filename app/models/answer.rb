  class Answer < ActiveRecord::Base
  METHODS = %W{GET POST PATCH DELETE PUT HEAD}
  scope :default, -> {where default: true}
  belongs_to :task
  has_one :response, dependent: :destroy
  validates :method, inclusion: {in: METHODS, allow_nil: true}
  belongs_to :participant

  def submit!
    api_response = RestClient::Request.execute(method: method.downcase.to_sym,
      url: url,
      payload: request_body,
      headers: request_headers_hash)
  rescue RestClient::Exception => exception
    api_response = exception.response
  ensure
    create_response!(headers: api_response.headers.to_json, body: api_response.body, status_code: api_response.code)
  end

  def url
    URI.join(task.api.root, path).to_s
  end

  def request_headers_hash
    return {} if request_headers.blank?

    request_headers.lines.reduce({}) do |headers, line|
      header_name, header_value = line.split(":").map(&:chomp)
      headers[header_name] = header_value if header_name
      headers
    end
  end

end
