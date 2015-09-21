require_relative 'parser'

describe "Parser" do
  let(:controller) { Controller.new('sample_data.csv') }
  it 'correctly reads the data' do
    expect(controller.data.count).to be(3)
  end

  it 'can convert the data to an array of hashes' do
    expect(controller.people[0]['email']).to eq('steve.johnson@gmail.com')
  end
end