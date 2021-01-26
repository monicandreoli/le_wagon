class Recipe
  attr_reader :name, :description

  # order dependcy
  # def initialize(name, description)
  #   @name = name
  #   @description = description
  # end

  # with no order dependency
  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @done = attributes[:done] || false
  end

  def done? #more elegant, it is the reader of @done.
    @done
  end

  # attr_writer by defaukt
  # def done
  #   @done = true
  # end

  def mark_as_done # a writer, i overwrote the one by default
    @done = true
  end
end

# order dependency
# Recipe.new(name, prep_time, done, description, property_ 100000)

# no order dependency
# hash of attributes

# p Recipe.new

# p Recipe.new({name: 'apple pie', description: 'good'})

# p Recipe.new({description: 'good', name: 'apple pie',})

# p Recipe.new(name: 'fab', description: 'good')
