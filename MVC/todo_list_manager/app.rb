require_relative 'task_repository'
require_relative 'tasks_controller'
require_relative 'tasks_view'
require_relative 'router'

repository = TaskRepository.new
view = TasksView.new
controller = TasksController.new(repository, view)
router = Router.new(controller)

router.run
