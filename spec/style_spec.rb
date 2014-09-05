require 'rspec'
require 'pg'
require './lib/style'

DB = PG.connect(:dbname => 'shoes_app_test')

RSpec.configure do |config|
	config.after(:each) do
		DB.exec("DELETE FROM style *;")
	end
end

describe :style do
	it 'is initialized with a name' do
		style = Style.new('Fly Low')
		expect(style).to be_an_instance_of Style
	end

	it 'tells you its name' do
		style = Style.new('Fly Low')
		expect(style.name).to eq 'Fly Low'
	end

	it 'is the same style if it has the same name' do
		style1 = Style.new('Fly Low')
		style2 = Style.new('Fly Low')
		expect(style1).to eq style2
	end

	it 'starts off with no styles' do
		expect(Style.all).to eq []
	end 

	it 'lets you save styles to the database' do
		style = Style.new('Fly Low')
		style.save
		expect(Style.all).to eq [style]
	end

	it 'sets its ID when you save it' do
		style = Style.new('Nike')
		style.save
		expect(style.id).to be_an_instance_of Fixnum
	end

	it 'can be initialized with its database ID' do	
		style = Style.new('Nike', 1)
		expect(style).to be_an_instance_of Style
	end

end