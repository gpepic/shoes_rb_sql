require 'rspec'
require 'pg'
require './lib/shoes'

DB = PG.connect(:dbname => 'shoes_app_test')

RSpec.configure do |config|
	config.after(:each) do
		DB.exec("DELETE FROM shoes *;")
	end
end

describe :shoes do

	it 'is initialized with a brand and shoe ID' do
		shoes = Shoes.new('Nike', 1)
		expect(shoes).to be_an_instance_of(Shoes)
	end

	it 'tells you its brand' do
		shoes = Shoes.new('Nike')
		expect(shoes.brand).to eq('Nike', 1)
	end

	it 'tells you its style ID' do
		brand = Shoes.new('Nike', 1)
		expect(brand.style_id). to eq 1
	end

	it 'starts with no shoes' do
		expect(Shoes.all).to eq []
	end

	it 'lets you save shoes into the database' do
		shoes = Shoes.new('Nike', 1)
		shoes.save
		expect(Shoes.all).to eq [shoes]
	end

	it 'is the same shoes if it has the same brand and style ID' do
		shoes1 = Shoes.new('Nike', 1)
		shoes2 = Shoes.new('Nike', 1)
		expect(shoes1).to eq shoes2
	end
end