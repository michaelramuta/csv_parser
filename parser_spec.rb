require_relative 'parser'

describe "Parser" do
  let(:controller) { Controller.new('sample_data.csv') }
  it 'correctly reads the data' do
    data = controller.read_file(controller.filename)
    expect(data.count).to be(3)
  end

  it 'can convert the data to an array of hashes' do
    data = controller.read_file(controller.filename)
    people = controller.convert_file_to_hash(data)
    expect(people[0]['email']).to eq('steve.johnson@gmail.com')
  end

  it 'can filter uniquely by email' do
    data = controller.read_file(controller.filename)
    people = controller.convert_file_to_hash(data)
    expect(controller.filter_by_email(people).count).to be(2)
  end

  it 'can sort by last name' do
    data = controller.read_file(controller.filename)
    people = controller.convert_file_to_hash(data)
    expect(controller.sort_by_last_name(people)[0]['last_name']).to eq('Appleseed')
  end
end