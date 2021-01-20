empty = []
beatles = ["john", "ringo", "seb"]
#            0       1        2


# Acess a value
p beatles[1]

# Add a value
beatles << 'george'
p beatles

# Update a value

beatles[2] = 'paul'
p beatles


# Deleting a value

# Delete by index
beatles.delete_at(3)
p beatles


# Delete by value
beatles.delete('john')
p beatles


# CRUD operations
