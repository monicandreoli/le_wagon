## Modelling

Start with the example of an hospital.

Let's imagine we have to create an application, to keep track of patients and the rooms they are in.

Let's start with the patient, that will be our first class.

Remember what we learned about object oriented programming. An object consists of **Data** -> state and **Behavior** -> methods

We start with the **Data**:
  - name
  - cured

extra:
  - vegetarian

```
class Patient
  attr_reader :name, :cured, :vegetarian

  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @vegetarian = attributes[:vegetarian] || false
  end
end
Patient.new('Harry Potter, false, false)
Patient.new({name: 'Harry Potter', cured: false, vegetarian: false})
Patient.new(name: 'Harry Potter', cured: false, vegetarian: true)
```


__Note on attributes hash__
When you have more then a couple and even with two parameters to initialize your class.

It gets difficult to keep track of the order in which you need to pass them.
To help with this we use an attributes hash.

We can still use default values in the initializer, just not in the parameter list.

Another positive of this solution is that it makes the code more readable when you create the new object.

Curly braces optional when it is the last argument. Syntax -> Rails


Next up is behavior. We want to be able to `cure` a Patient. We can make a method `.cure` to model that behavior.

Also from a view we would want to read the name, and the cure status. So we need to create a way to do that

```
class Patient
  attr_reader :name, :cured
  #[...]
  def cure
    @cured = true
  end
end

garp = Patient.new(name: 'Garp', cured: false)

p "Patient name: #{garp.name} is #{garp.cured ? 'cured' : 'still sick' } "

garp.cure

p "Patient name: #{garp.name} is #{garp.cured ? 'cured' : 'still sick' } "
```

Introducing the second model: Room
In our hospital patients stay in rooms.
We create a new **Class**, we think about the **Data** and **Behavior** again.
Data:
  - capacity(Integer)
  - patients(Array of Patient)

```
class Room
  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 3
    @patients = attributes[:patients] || []
  end
end
```

Behavior:
  -  Are you full?
  - Admit patient to room

```
require_relative 'patient'
class Room
  #[...]

  def full?
    @capacity <= @patients.length
  end

  def admit(patient)
    @patients << patient
  end
end

private_room = Room.new(capacity: 1)
private_room.full? #false
garp = Patient.new(name: 'Garp')
private_room.admit(garp)
```

What about the patient? If we want to look up where a Patient is, we need to go through all the rooms, ask for their patients and check if our Patient is in the room.

We want to ask the patient that question.
So we want to add **data** to the patient, we want to know its room:

```
class Patient
  attr_accessor :room
  
  #[...]
end
```

When do we set this? When we admit the Patient to a room, this is where we create a relationship between the two models.


```
require_relative 'patient'
class Room
  #[...]

  def admit(patient)
    raise StandardError, "Room is full" if full?
    patient.room = self
    @patients << patient
  end
end

private_room = Room.new(capacity: 1)
private_room.full? #false
garp = Patient.new(name: 'Garp')
private_room.admit(garp)
garp.room
private_room.full? #true

jenny = Patient.new(name: 'Jenny')
private_room.admit(jenny) 
private_room.full? #BUG!!!
```

## Relationships
See drawing `patient_room_relationships.png`


## Persistence
But how do we store this, make it persistant. What can we use to model these relationships?
At then end of this week you will learn about databases, for now we keep using CSV for storage.

In the real world names are not unique, in order to uniquely identify a patient we assign them an identifier or id in short.

__Patient__
```
| id | name    | cured |
|----|---------|-------|
| 1  | Garp    | false |
| 2  | Jenny   | true  |
| 3  | Helen   | true  |
| 4  | Roberta | false |
```

For persistance we will be implementing a Repository class for each model.

Add accessors to classes: `attr_accessor :id`

And add them to the initializer:
`@id = attributes[:id]`

How would we create patients from our `patients.csv`


```
require_relative 'patient'
csv_file = 'patients.csv'
patients = []
csv_options = { headers: :first_row, header_converters: :symbol }
CSV.foreach(csv_file, csv_options) do |row|
  row[:id]    = row[:id].to_i          # Convert column to Integer
  row[:cured] = row[:cured] == "true"  # Convert column to boolean
  patients << Patient.new(row)
end

p patients
```

Let us use this to create our Patient repository:

Data:
  - patients
  - next_id

Behaviour:
  - Load from csv
  - Add new patient
    * with an id, auto-increment
    * save_csv

```
class PatientRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @patients = []
    @next_id
    load_csv
  end

  def add(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  private
  def load_csv
    # [...] -> data from csv
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end

  def save_csv
    # TO BE IMPLEMENTED
  end
end
```

Let us connect the Room with the Patient in the repository as well

Create the RoomRepository: 'rooms.csv'
__Room__
```
| id | capacity |
|----|----------|
| 1  | 2        |
| 2  | 2        |
| 3  | 1        |
```
```
class RoomRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    @next_id
    load_csv
  end

  def load_csv
   #[...] Copy implementation from Patient
  end
end
```

To build the connection as before in the drawing we need to add the room_id to the csv.
```
| id | name    | cured | room_id |
|----|---------|-------|---------|
| 1  | Garp    | false | 1       |
| 2  | Jenny   | true  | 1       |
| 3  | Helen   | true  | 2       |
| 4  | Roberta | false | 3       |
```
```
class PatientRepository
  def initialize(csv_file, room_respository)
    @room_repository = room_repository
  end

  def load_csv
    CSV.foreach(csv_file, csv_options) do |row|
      # [...]
      patient = Patient.new(row)
      room = @room_repository.find(row[:room_id].to_i)
      patients << patient
      room.admit(patient)
    end
  end
end
``` 

```
class RoomRepository
  def find(id)
    @rooms.each do |room|
      return room if room.id == id
    end
    raise StandardError, "Can't find Room for id: #{id}"
  end
end
```

So we can find the room and add the patient to it when we load the csv.

Attention: We need to pass the RoomRepository to the PatientRepository to make it work, so that means we have to intialize the RoomRepository first.

Example: app.rb
```
  rooms_csv = 'rooms.csv'
  room_repository = RoomRepository.new(rooms_csv)

  patients_csv = 'patients.csv'
  patients_repository = PatientRepository.new(patients_csv, room_repository)

  p patient_repository.patients
  p room_repository.rooms
```

## Singular vs multiple models and controllers
See drawing: `mvc_structure.png`

## Food Delivery Exercise
It will last 2 days
For each model, there is one controller and one view (but start with the model)

The “Routing logic” is not provided, do not focus on this at first, start with your models and controllers.
We will use storage by CSV again, and each model should have a repository






