require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"

task = Task.find(2)
puts "#{task.title} - #{task.description}"
# => "Complete Livecode|Implement CRUD on Task"

task = Task.find(42)
p task # => nil


task = Task.new(title: 'push code to github', description: 'do it!!!')
p task.id
task.save
p task.id

task = Task.find(2)
task.done = true
task.save

task = Task.find(2)
p "Task is done: #{task.done}"

tasks = Task.all
tasks.each do |task|
  p task.title
end

task = Task.find(2)
task.destroy
task = Task.find(2)
p task
