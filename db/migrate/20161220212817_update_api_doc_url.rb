class UpdateApiDocUrl < ActiveRecord::Migration
  def change
    word_press = Api.find_by(name: 'WordPress REST API')
    if word_press
      word_press.update_attributes!(doc_url: "http://v2.wp-api.org/reference/posts/")
    end
  end
end
