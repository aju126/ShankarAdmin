# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## customer data
1.upto(500) do |i|
  Customer.create(first_name: "User #{i}", mobile:78967890+i, email:"bb#{i}@bbcd.com")
end