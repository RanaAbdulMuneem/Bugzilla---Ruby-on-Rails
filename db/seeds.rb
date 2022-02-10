# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Project.destroy_all

user = User.create(email: 'a@abc.com', password: 'aaaaaa')
3.times do |p|
  user.projects.create(title: "Project ##{p}")
end
