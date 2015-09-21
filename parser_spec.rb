require_relative 'parser'

describe "Parser" do
  let(:controller) { Controller.new('sample_data.csv') }
  it 'correctly reads the data' do
    expect(controller.people.count).to be(3)
  end

  it 'can convert the data to an array of hashes' do
    expect(controller.people[0]['email']).to eq('steve.johnson@gmail.com')
  end

  it 'can filter uniquely by email' do
    expect(controller.filter_by_email(controller.people).count).to be(2)
  end

  it 'can sort by last name' do
    expect(controller.sort_by_last_name(controller.people)[0]['last_name']).to eq('Appleseed')
  end
end