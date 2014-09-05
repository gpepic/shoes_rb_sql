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

	end
end