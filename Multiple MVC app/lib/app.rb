require_relative 'room_repository'
require_relative 'patient_repository'

rooms_csv_file = 'rooms.csv'
room_repository = RoomRepository.new(rooms_csv_file)

patients_csv_file = 'patients.csv'
patient_repository = PatientRepository.new(patients_csv_file, room_repository)

p patient_repository.patients
p room_repository.rooms

