class TasksView # the role of the view class is to puts to the user and get info from the user

  # behavior /instance methods
  # puts stuff to the user
  def display(tasks)
    tasks.each_with_index do |task, index|
      if task.is_it_done?
        status = "[X]"
      else
        status = "[]"
      end
      puts "#{index + 1}.#{status} - #{task.name}"
    end
  end

  # ask the user for infos
  def ask_for_name
    puts "what s the name of the task you want to create?"
    name = gets.chomp
  end

end
