require_relative 'task'

class TasksController #is YOUR GUY! he is the maestro, octopus who talks to veryone

  # DATA/STATE
  def initialize(repository, view)
    @repository = repository
    @view = view
  end

  # BEHAVIOR/instance methods of the controller correspond to the user actions

  # 1. Read/list all of my tasks
  def list
     # the client/user will tell the controller: hey, i d like to read all of my tasks today
     # 1. need to fetch all of the tasks instances from the repository
     puts "1. Fetching the tasks instances from the repo"
      all_my_tasks = @repository.all
     # 2. once i have the tasks instances, i need to display to the user/ i need to pass the tasks to the view.
     puts "2. passing the tasks instances to the view"
      @view.display(all_my_tasks)
  end

  # 2. Create a task
  def create
    # 1. I need to ask the user what is the name of the task he wants to create. (view responsibility)
    puts "1.asking for a name"
      name_of_task = @view.ask_for_name
    # 2. I need to create an instance of my task, because i cannot just push the string name to my repo, i need instances of tasks.
    puts "2. Creating the instance of task"
      my_new_task = Task.new(name_of_task)
    # 3. I need to pass this task to the repository by adding it in the array of instances tasks
    puts "3. storing it into the repo"
      @repository.add(my_new_task)
  end

end


# USER ACTIONS
# CRUD : most important concept in programming
# 1. Read all of my tasks
# 2. Create a task
# 3. Mark a task as done
