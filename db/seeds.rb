# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.create!(username:  "vladimirfomene",
             email: "ashesimelton@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(username:  "Brandon Wayne Odiwuor",
             email: "brandon.odiwuor@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  username  = Faker::Name.name
  email = "example-#{n+1}@factorout.com"
  password = "password"
  User.create!(username:  username,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence
  description = Faker::Lorem.sentence(5)
  location = Faker::Address.city
  host = Faker::Name.name
  start = 2.days.ago
  end_time = Time.zone.now
  users.each { |user| user.events.create!(title: title, description: description, location: location,
    host: host, start: start, end_time: end_time) }
end
