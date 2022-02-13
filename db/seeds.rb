# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Running seed file...'
puts 'Destroying previous'
ChangeRequest.destroy_all
WorksOn.destroy_all
ReportsTo.destroy_all
Project.destroy_all
User.destroy_all
puts 'Creating users'
manager = Manager.create(email: 'man@mail.com', password: '123456', first_name: 'Shaheen', last_name: 'Afridi')
developer1 = Developer.create(email: 'dev1@mail.com', password: '123456', first_name: 'Haris', last_name: 'Rauf')
developer2 = Developer.create(email: 'dev2@mail.com', password: '123456', first_name: 'Mohammed', last_name: 'Rizwan')
qa1 = QualityAssurance.create(email: 'qa1@mail.com', password: '123456', first_name: 'Rashid', last_name: 'Khan')
qa2 = QualityAssurance.create(email: 'qa2@mail.com', password: '123456', first_name: 'Tim', last_name: 'David')
puts 'Creating projects'
projects = []
3.times do |p|
  projects[p] = manager.projects.create(title: "Project ##{p}")
end
puts 'Assigning users'
developer1.projects << projects[0]
developer1.projects << projects[2]
qa1.projects << projects[0]
qa1.projects << projects[2]

developer2.projects << projects[1]
developer2.projects << projects[2]
qa2.projects << projects[1]
qa2.projects << projects[2]
puts 'Creating change requests'
projects[0].change_requests.create(title: 'login issue', deadline: '2022-10-2', type: 'Bug', user_id: qa1.id)
projects[0].change_requests.create(title: 'remember me', deadline: '2022-10-2', type: 'Feature', user_id: qa1.id)

puts 'Seeded!'
