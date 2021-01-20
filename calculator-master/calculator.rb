def calculate(first_number, second_number, operator)
  # compute and return result
  # if/elsif statement
  # a method always returns something, here it's the result
  # if operator == "+"
  #   first_number + second_number
  # elsif operator == "-"
  #   first_number - second_number
  # elsif operator == "/"
  #   first_number / second_number
  # elsif perator == "*"
  #   first_number * second_number
  # else
  #   "Type an operator that exists"
  # end
  case operator
  when "+"
    first_number + second_number
  when "-"
    first_number - second_number
  when "/"
    first_number / second_number
  when "*"
    first_number * second_number
  else
    "Type an operator that exists"
  end
end
