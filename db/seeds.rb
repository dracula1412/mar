# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'csv'

puts "Importing user levels..."
UserLevel.delete_all
CSV.foreach(Rails.root.join("db/seeds/user_levels.csv"), headers: true) do |row|
  UserLevel.create! do |ul|
    ul.id = row[0]
    ul.description = row[1]
  end
end

puts "Importing maps..."
MiniMap.delete_all
CSV.foreach(Rails.root.join("db/seeds/maps.csv"), headers: true) do |row|
  MiniMap.create! do |ul|
    ul.id = row[0]
    ul.name = row[1]
    ul.description = row[2]
    ul.required = row[3]
  end
end
