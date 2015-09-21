require 'csv'

class Controller
  attr_accessor :people
  def initialize(file)
    data = CSV.read(file, headers: true)
    @people = data.map{ |person| person.to_hash}
  end

  def filter_by_email(people)
    people.uniq{|person| person["email"]}
  end

  def sort_by_last_name(people)
    people.sort{|person1, person2| person1["last_name"] <=> person2["last_name"]}
  end

end