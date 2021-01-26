
require_relative 'task'
require_relative 'task_repository'
require_relative 'tasks_view'
require_relative 'tasks_controller'

# TESTING MY TASK CLASS
my_task = Task.new('do groceries')
second_task = Task.new('enjoy a beer tonight')
# puts my_task

# my_task.mark_as_done
# puts my_task.is_it_done?


# TESTING my repository class
# create an instance of TaskRepository class
my_repo = TaskRepository.new
my_repo.add(my_task)
my_repo.add(second_task)
tasks =  my_repo.all

# p tasks

# TESTING VIEW
my_view = TasksView.new

# my_view.display(tasks)

# puts my_view.ask_for_name

# TESTING THE CONTROLLER
my_controller = TasksController.new(my_repo, my_view)
# my_controller.list

my_controller.create

my_controller.list




