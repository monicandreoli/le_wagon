require 'date'
require 'YAML'


SSN_REGEX = /^(?<gender>[12]) (?<year>\d{2}) (?<month>0[1-9]|1[0-2]) (?<place>0[1-9]|[1-9]\d) \d{3} \d{3} (?<key>\d{2})/

def french_ssn_info(ssn_string)
  match_data = ssn_string.match(SSN_REGEX)
  if match_data
    # create the string from the match data
    gender = get_gender(match_data[:gender])
    month = get_month(match_data[:month].to_i)
    year = "19#{match_data[:year]}"
    place = get_place(match_data[:place])
    "a #{gender}, born in #{month}, #{year} in #{place}."
  else
    return "The number is invalid"
  end
end


def get_month(code)
  Date::MONTHNAMES[code]
end

def get_place(code)
  departments = YAML.load_file('data/french_departments.yml')
  departments[code]
end

def get_gender(code)
  code == '1' ? 'man' : 'woman'
end

