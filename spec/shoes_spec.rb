require 'rspec'
require 'pg'
require './lib/shoes'

DB = PG.connect({:dbname => 'shoes_app_test'})

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
		shoes = Shoes.new('Adidas')
		shoes.save
		expect(Shoes.all).to eq [brand]
	end

	# it 'is the same shoes if it has the same brand' do
	# 	shoes1 = Shoes.new('Adidas')
	# 	shoes2 = Shoes.new('Adidas')
	# 	expect(shoes1).to eq shoes2
	# end
end