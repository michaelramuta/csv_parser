require 'csv'

class Controller
  attr_accessor :data, :people
  def initialize(file)
    @data = CSV.read(file, headers: true)
    @people = @data.map{ |person| person.to_hash}
  end

end