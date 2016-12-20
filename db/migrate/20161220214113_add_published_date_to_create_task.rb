class AddPublishedDateToCreateTask < ActiveRecord::Migration
  def change
    word_press = Api.find_by(name: 'WordPress REST API')
    if word_press
      create_post_task = word_press.tasks.find_by(title: "Publish a Post")
      if create_post_task
        create_post_task.update_attributes!(description:  "Use the #{word_press.name} to publish a new post with title 'a random post', content 'lorem ipsum' and published date of 'January 1, 2016' on the blog at http://wp.spyrest.com")
      end
    end
  end
end
