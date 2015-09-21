require_relative 'parser'

describe "Parser" do
  let(:controller) { Controller.new('sample_data.csv') }
  it 'correctly reads the data' do
    expect(controller.data.count).to be(3)
  end
end