require_relative 'parser'

describe "Parser" do
  let(:controller) { Controller.new('sample_data.csv') }
  it 'correctly reads the data' do
    controller.read_file(controller.filename)
    expect(controller.data.count).to be(3)
  end

  it 'can convert the data to an array of hashes' do
    controller.read_file(controller.filename)
    controller.convert_file_to_hash(controller.data)
    expect(controller.people[0]['email']).to eq('steve.johnson@gmail.com')
  end

  it 'can filter uniquely by email' do
    controller.read_file(controller.filename)
    controller.convert_file_to_hash(controller.data)
    expect(controller.filter_by_email(controller.people).count).to be(2)
  end

  it 'can sort by last name' do
    controller.read_file(controller.filename)
    controller.convert_file_to_hash(controller.data)
    expect(controller.sort_by_last_name(controller.people)[0]['last_name']).to eq('Appleseed')
  end
end