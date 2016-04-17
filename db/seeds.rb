# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Goal.destroy_all
Category.destroy_all

Sam = User.create(name: "Sam", email: "sam@test.com", country: "Aus")
Jenn = User.create(name: "Jenn", email: "jenn@test.com", country: "Aus")
Dan = User.create(name: "Dan", email: "dan@test.com", country: "Aus")

Health_cat = Category.create(title: "Health")
Language_cat = Category.create(title: "Language")
Fitness_cat = Category.create(title: "Fitness")

Learn_spanish = Goal.create(title: "learn spanish", initiator: Sam)
Learn_spanish.categories << Language_cat

Learn_kungfu = Goal.create(title: "Learn Kungfu", initiator: Dan)
Learn_kungfu.categories << Health_cat
Learn_kungfu.categories << Fitness_cat

Learn_numerals = Subgoal.create(title: "learn numerals")
Learn_spanish.subgoals << Learn_numerals

Learn_spanish_order = Order.create(amount: 50)
Learn_spanish.orders << Learn_spanish_order
