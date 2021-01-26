require_relative 'patient'

class Room
  attr_reader :patients
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 1 # Integer
    @patients = attributes[:patients] || [] # Array of Patient objects
  end

  def full?
    @capacity <= @patients.length
  end

  def admit(patient)
    raise StandardError, "Room is over capacity" if full?
    
    patient.room = self
    @patients << patient
  end
end