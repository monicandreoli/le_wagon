class Patient
  attr_accessor :id, :room
  attr_reader :name, :cured, :vegetarian
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @vegetarian = attributes[:vegetarian] || false
  end

  def cure
    @cured = true
  end
end
