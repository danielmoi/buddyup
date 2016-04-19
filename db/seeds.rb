# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Sam = User.create(name: "Sam", email: "sam@test.com", password: "chicken", country: "Aus", admin: true)
Jenn = User.create(name: "Jenn", email: "jenn@test.com", password: "chicken", country: "Aus")
Dan = User.create(name: "Dan", email: "dan@test.com", password: "chicken", country: "Aus")

Category.destroy_all
Health_cat = Category.create(title: "Health")
Language_cat = Category.create(title: "Language")
Fitness_cat = Category.create(title: "Fitness")

Goal.destroy_all
Learn_spanish = Goal.create(title: "learn spanish", initiator: Sam)
Learn_spanish.categories << Language_cat

Learn_kungfu = Goal.create(title: "Learn Kungfu", initiator: Dan)
Learn_kungfu.categories << Health_cat
Learn_kungfu.categories << Fitness_cat



Order.destroy_all
Learn_spanish_order = Order.create(amount: 50)
Learn_spanish.orders << Learn_spanish_order

Subgoal.destroy_all
sg1 = Subgoal.create(title: "learn numerals")
Learn_spanish.subgoals << sg1
sg2 = Subgoal.create(title: "Learn alphabet")
Learn_spanish.subgoals << sg2
sg3 = Subgoal.create(title: "Everyday greetings")
Learn_spanish.subgoals << sg3
sg4 = Subgoal.create(title: "Read a spanish newspaper")
Learn_spanish.subgoals << sg4
sg5 = Subgoal.create(title: "Write a poem")
Learn_spanish.subgoals << sg5

Message.destroy_all
