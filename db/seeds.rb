if Api.find_by(name: 'WordPress REST API').nil?
  Api.create!(name: 'WordPress REST API', doc_url: "http://v2.wp-api.org/reference/posts/", root: 'http://wp.spyrest.com/wp-json/wp/v2/')
end

word_press = Api.find_by(name: 'WordPress REST API')

list_posts_task = word_press.tasks.find_by(title: "List all Posts")
unless list_posts_task
  list_posts_task = Task.create!(
    title: "List all Posts",
    description: "Use the #{word_press.name} to get a list of all the blog posts from the blog at http://wp.spyrest.com",
    practice: true
  )
end

word_press.tasks << list_posts_task

if list_posts_task.answers.default.none?
  list_posts_task.answers.create!(
    path: 'posts',
    default:  true,
    method: 'GET'
  )
end

find_by_author_task = word_press.tasks.find_by(title: "Find all posts by author Spyrest")
unless find_by_author_task
  find_by_author_task = Task.create!(
    title: "Find all posts by author Spyrest",
    description: "Use the #{word_press.name} find a list of all the blog posts by author Spyrest from the blog at http://wp.spyrest.com",
    practice: false
  )
end

word_press.tasks << find_by_author_task

exclude_posts_by_ids_task = word_press.tasks.find_by(title: "List all Posts excluding ids 1 and 4")
unless exclude_posts_by_ids_task
  exclude_posts_by_ids_task = Task.create!(
    title: "List all Posts excluding ids 1 and 4",
    description: "Use the #{word_press.name} find a list of all the blog posts where the post id is not 1 or 4 from the blog at http://wp.spyrest.com",
    practice: false
  )
end

word_press.tasks << exclude_posts_by_ids_task

total_number_of_posts_task = word_press.tasks.find_by(title: "Find the total number of Posts")
unless total_number_of_posts_task
  total_number_of_posts_task = Task.create!(
    title: "Find the total number of Posts",
    description: "Use the #{word_press.name} find the total number of blog posts from the blog at http://wp.spyrest.com",
    practice: false
  )
end

word_press.tasks << total_number_of_posts_task


create_post_task = word_press.tasks.find_by(title: "Publish a Post")
unless create_post_task
  create_post_task = Task.create!(
    title: "Publish a Post",
    description: "Use the #{word_press.name} to publish a new post with title 'a random post', content 'lorem ipsum' and published date of 'January 1, 2016' on the blog at http://wp.spyrest.com",
    practice: false
  )
end

word_press.tasks << create_post_task

if create_post_task.answers.default.none?
  create_post_task.answers.create!(
    default:  true,
    request_headers: "Authorization: Basic #{ENV['WP_AUTH_HEADER']}"
  )
end


update_post_task = word_press.tasks.find_by(title: "Update the excerpt of the Post you published to 'My new excerpt'")
unless update_post_task
  update_post_task = Task.create!(
    title: "Update the excerpt of the Post you published to 'My new excerpt'",
    description: "Use the #{word_press.name} to update the excerpt for the post you created from the blog at http://wp.spyrest.com.",
    practice: false
  )
end

word_press.tasks << update_post_task

if update_post_task.answers.default.none?
  update_post_task.answers.create!(
    default:  true,
    request_headers: "Authorization: Basic #{ENV['WP_AUTH_HEADER']}"
  )
end





