class Task #This is the model class

  attr_reader :name #behavior: reading the value of @name, @done.
  # attr_accessor :done

  #Data/state
  def initialize(name)
    @name = name # by default they're encapsultaed, you cannot see the value of them or modify them
    @done = false
  end

  # Behavior
  #define my own writer method for @done.
  def mark_as_done  #our own writer to modify the state of the instanc variable @done.
    @done = true
  end

  # #define my own reader method for @done.
  def is_it_done? #question mark because it returns a boolean.
    @done
  end

end


