# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Poll.delete_all
Poll.create!( id: 1, category_id: 1, genderdep: 0, explicit: "false", question: "Für wie viel Geld würdest du deine Religion aufgeben?", flag: 0)
Poll.create!( id: 2, category_id: 1, genderdep: 0, explicit: "false", question: "Für wie viel Geld würdest du dein Haustier verkaufen?", flag: 0)
Poll.create!( id: 3, category_id: 1, genderdep: 0, explicit: "false", question: "Für wie viel Geld würdest du dich sterilisieren/kastrieren lassen?", flag: 0)
Poll.create!( id: 4, category_id: 2, genderdep: 0, explicit: "false", question: "Für wie viel Geld würdest du eine Niere verkaufen?", flag: 0)
Poll.create!( id: 5, category_id: 2, genderdep: 0, explicit: "false", question: "Für wie viel Geld würdest du einen Tag im Gefängnis verbringen?", flag: 0)
Poll.create!( id: 6, category_id: 3, genderdep: 0, explicit: "false", question: "Für wie viel Geld würdest du für immer auswandern?", flag: 0)

Category.delete_all
Category.create!( id: 1, name: "Standard" )
Category.create!( id: 2, name: "Ethic" )
Category.create!( id: 3, name: "Ugly" )
Category.create!( id: 4, name: "Scary" )