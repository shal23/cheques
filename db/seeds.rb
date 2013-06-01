# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.confirm!
user.add_role :admin


Cheque.create(drawer: 'Frank Jameson', payee: 'Mike Alansworth', amount: 1000.00)
Cheque.create(drawer: 'Susy Berrybush', payee: 'Sam Theman', amount: 200.00)
Cheque.create(drawer: 'Billy Wilkinson', payee: 'Bob Dole', amount: 10000.10)
Cheque.create(drawer: 'James Davidson', payee: 'Simon Rocksbury', amount: 125320.00)
Cheque.create(drawer: 'Jim Smith', payee: 'Sarah Smithinson', amount: 3000010.00)
Cheque.create(drawer: 'Alex Dayle', payee: 'Paul Sutherland', amount: 101.52)
Cheque.create(drawer: 'Billy Wilkinson', payee: 'Paul Sutherland', amount: 1001.81)
Cheque.create(drawer: 'Mr Smith', payee: 'Mrs Smith', amount: 2.00)
Cheque.create(drawer: 'Frank Jameson', payee: 'Sarah Smithinson', amount: 1111.11)
Cheque.create(drawer: 'Alex Dayle', payee: 'Sarah Smithinson', amount: 2031.01)
Cheque.create(drawer: 'Billy Wilkinson', payee: 'Frank Jameson', amount: 2200.18)