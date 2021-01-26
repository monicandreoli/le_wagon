require_relative 'room'
require 'csv'

class RoomRepository
  attr_reader :rooms
  def initialize(csv_file)
    @csv_file =  csv_file
    @rooms = []
    @next_id
    load_csv
  end

  def add(room)
    room.id = @next_id
    @rooms << room
    @next_id += 1
    save_csv
  end

  def find(id)
    @rooms.each do |room|
      return room if room.id == id
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:capacity] = row[:capacity].to_i # Convert column to Integer
     
      @rooms << Room.new(row)
    end
    @next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
  end

  def save_csv
    #TODO implement me
  end
end


