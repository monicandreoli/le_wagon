puts "What time is it?"

time = gets.chomp.to_i

if time > 18
  puts "Good evening"
elsif time > 12
  puts "Good afternoon"
else
  puts "Good morning"
end
