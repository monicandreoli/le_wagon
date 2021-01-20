puts "What time is it?"
time = gets.chomp.to_i

is_morning = time >= 9 && time < 12
is_afternoon = time >= 14 && time > 18

if is_morning || is_afternoon
  puts "Shop is open"
else
  puts "Shop is closed"
end
