# OOP = STATE/DATA + BEHAVIOR
# -----------------------------------
# Object Oriented Programming -> Everything in Ruby is an object!
# state: the instance variables (what is the state of the object? e.g. color)
# behavior: the instance methods (what can we do with the object?)

my_instance = NameOfTheClass.new # => create a new instance of this class
# -> calls the initialize method

# Class Methods
# -> not specific for one object
def self.name_of_class_method
end
NameOfTheClass.name_of_class_method

# Instance Methods
# -> called on one instance created from the class
my_instance = NameOfTheClass.new
my_instance.name_of_instance_method





















# Model View Controller : MVC
# -----------------------------------
            +---------+
User -----> |    R    |
            +---------+
                 |
                 |
    +------------|------------+
    |       +---------+       |
    |       |    C    |       |
    |       +---------+       |
    |          /  \           |
    |         /    \          |
    |        /      \         |
    |       /        \        |
    |      /          \       |
    | +---------+ +---------+ | +------------+
    | |    V    | |    M    |-|-| Repository | # (future: DB)
    | +---------+ +---------+ | +------------+
    +-------------------------+

# Model:
# ---------------------------------------------
# - holds all the information of one object
# - can have class methods & instance methods

# (Repository):
# ---------------------------------------------
# - repository will disappear
# - repo stores the instances of the model
# - repo does the CSV handling, which now functions as our DB
# - repo will be replaced by DB. Then the model will directly query the DB

# View:
# ---------------------------------------------
# - responsible for puts & gets
# - does not need an initialize method because we don't pass arguments and doesn't need instance variables
# - we need methods to ask for information, display information, etc.
# - when we have webapps -> VIEW -> HTML

# Controller:
# ---------------------------------------------
# - USER ACTIONS
# - add / list / update / delete / mark / etc.
# - gets information from the DB (now: Repo (csv) & Model) - (later: Model)
# - forwards information to the View to display to the user

# Router:
# ---------------------------------------------
# - to get user intent and send it to the correct controller & action
# - will be handled by rails in the future
