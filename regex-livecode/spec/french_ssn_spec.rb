require_relative '../french_ssn.rb'

describe '#french_ssn_info' do
  it 'should return "The number is invalid" when given an empty string' do
    actual = french_ssn_info('')
    expected = "The number is invalid"
    expect(actual).to eq(expected)
  end

  it 'should correctly extract information from a valid security number' do
    actual = french_ssn_info("1 84 12 76 451 089 46")
    expected = "a man, born in December, 1984 in Seine-Maritime."
    expect(actual).to eq(expected)
  end
end
