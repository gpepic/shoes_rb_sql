require 'pg'
require './lib/shoes'

DB = PG.connect(:dbname => 'shoes_app')

def welcome
	puts "Welcome to the Shoe Store!"
	menu
end