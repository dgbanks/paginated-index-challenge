# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

users = []
20.times do |i|
  name = Faker::Name.name
  email = name.split(" ").last + "@email.com"
  users << User.create!(name: name, email: email)
end

100.times do |i|
  reporter = users.sample
  assignee = users.sample
  while reporter == assignee
    assignee = users.sample
  end
  summary = Faker::Lorem.paragraph
  status = ["active", "inactive"].sample
  Issue.create!(
    summary: summary,
    status: status,
    reporter_id: reporter.id,
    assignee_id: assignee.id
  )
end
