require_relative 'patient'
require 'csv'

class PatientRepository
  attr_reader :patients
  def initialize(csv_file, room_repository)
    @csv_file =  csv_file
    @room_repository = room_repository
    @patients = []
    @next_id
    load_csv
  end

  def add(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
    save_csv
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:cured] = row[:cured] == "true"  # Convert column to boolean
      patient = Patient.new(row)
      room = @room_repository.find(row[:room_id].to_i)
      room.admit(patient)
      @patients << patient
    end
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end

  def save_csv
    #TODO implement me
  end
end
