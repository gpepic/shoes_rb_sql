require 'rspec'
require './lib/shoes'

describe :shoes do

	it 'is initialized with a brand' do
		shoes = Shoes.new('Converse')
		expect(shoes).to be_an_instance_of(Shoes)
	end

	it 'tells you its brand' do
		shoes = Shoes.new('Nike')
		expect(shoes.brand).to eq('Nike')
	end

	it 'starts with no shoes' do
		expect(Shoes.all).to eq []
	end

	it 'lets you save shoes into the database' do
		test_shoes = Shoes.new('Adidas')
		shoes.save
		expect(test_shoes.all).to eq [brand]
	end
end