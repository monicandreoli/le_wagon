puts "What do you want to do?"

action = gets.chomp

# if action == 'read'
#   puts 'Entering read mode!'
# elsif action == 'write'
#   puts ' Entering write mode'
# elsif action == 'exit'
#   puts 'Goodbye!'
# else
#   puts 'Unknown command'
# end

case action
when 'read'
  puts 'Entering read mode!'
when 'write'
  puts ' Entering write mode'
when 'exit'
  puts 'Goodbye!'
else
  puts 'Unknown command'
end
