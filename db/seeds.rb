if Api.find_by(name: 'WordPress REST API').nil?
  Api.create!(name: 'WordPress REST API', doc_url: "http://v2.wp-api.org/", root: 'http://wp.spyrest.com/wp-json/wp/v2/')
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