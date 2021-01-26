class TaskRepository #UpperCamelCase
  # attr_reader :tasks
  # this class is here to represent our storage for all the task instances.
  # DB in the ruby memory (database of instances)
  def initialize
    @tasks = []
  end
#behavior
  def add(task)
    # @tasks.push(task)
    @tasks << task
  end

  def all
    @tasks # my array of instances tasks
  end
end

