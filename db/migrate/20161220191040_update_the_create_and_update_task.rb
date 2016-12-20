class UpdateTheCreateAndUpdateTask < ActiveRecord::Migration
  def change
    word_press = Api.find_by(name: 'WordPress REST API')
    if word_press
      old_task = word_press.tasks.find_by(title: "Update the excerpt of the Post with id 1 to 'My new excerpt'")
      if old_task
        old_task.update_attributes(title: "Publish a Post",
        description: "Use the #{word_press.name} to publish a new post with title 'a random post' and content 'lorem ipsum' on the blog at http://wp.spyrest.com")
      end


      old_task = word_press.tasks.find_by(title: "Create a Post")
      if old_task
        old_task.update_attributes(title: "Update the excerpt of the Post you published to 'My new excerpt'",
        description: "Use the #{word_press.name} to update the excerpt for the post you created from the blog at http://wp.spyrest.com.")
      end
    end
  end
end
