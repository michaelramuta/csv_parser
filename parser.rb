require 'csv'

class Controller
  attr_accessor :data, :people, :filename
  def initialize(filename)
    @filename = filename
  end

  def read_file(filename)
    @data = CSV.read(filename, headers: true)
  end

  def convert_file_to_hash(data)
    @people = data.map{|person| person.to_hash}
  end

  def filter_by_email(people)
    people.uniq{|person| person["email"]}
  end

  def sort_by_last_name(people)
    people.sort{|person1, person2| person1["last_name"] <=> person2["last_name"]}
  end

  def print_list(people)
    people.each do |person|
      View.print_person(person)
    end
  end

  def run
    read_file(filename)
    convert_file_to_hash(data)
    sorted_people = sort_by_last_name(filter_by_email(people))
    print_list(sorted_people)
  end
end

class View
  def self.print_person(person)
    puts "#{person['email']},#{person['first_name']},#{person['last_name']}"
  end
end

controller = Controller.new('sample_data.csv')
controller.run
