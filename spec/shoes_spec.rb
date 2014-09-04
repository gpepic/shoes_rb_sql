require 'rspec'
require './lib/shoes'

describe :shoes do

	it 'is initialized with a brand' do
		shoes = Shoes.new('Nike')
		expect(shoes).to be_an_instance_of(Shoes)
	end

	it 'tells you its brand' do
		shoes = Shoes.new('Nike')
		expect(shoes.brand).to eq('Nike')
	end

	it 'starts with no shoes' do
		expect(Shoes.all).to eq []
	end

end