# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'csv'

puts "Importing user levels..."
CSV.foreach(Rails.root.join("db/seeds/user_levels.csv"), headers: true) do |row|
  UserLevel.create! do |ul|
    ul.id = row[0]
    ul.description = row[1]
  end
end
