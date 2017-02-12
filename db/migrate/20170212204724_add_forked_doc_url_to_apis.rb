class AddForkedDocUrlToApis < ActiveRecord::Migration
  def change
    add_column :apis, :forked_doc_url, :string

    if api = Api.find_by(name: 'WordPress REST API', forked_doc_url: nil)
      api.forked_doc_url = 'https://spyrest.github.io/docs-v2/reference/posts/'
      api.save!
    end
  end
end
