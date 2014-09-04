require 'rspec'
require './lib/shoes'

describe :shoes do

	it 'is initialized with a brand' do
		shoes = Shoes.new('Nike')
		expect(shoes).to be_an_instance_of(Shoes)
	end
	
end