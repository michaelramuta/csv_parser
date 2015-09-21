require 'csv'

class Controller
  attr_accessor :data
  def initialize(file)
    @data = CSV.read(file, headers: true)
  end

end