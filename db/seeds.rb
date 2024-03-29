puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :first_name => ENV['ADMIN_FIRST_NAME'].dup, :last_name => ENV['ADMIN_LAST_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.first_name
user.add_role :admin

roneil = User.find_or_create_by_email :first_name => ENV['ADMIN_FIRST_NAME'].dup, :last_name => ENV['ADMIN_LAST_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'roneil: ' << roneil.first_name
roneil.add_role :admin

user2 = User.find_or_create_by_email :first_name => 'Second', :last_name => 'User', :email => 'user2@example.com', :password => 'changeme', :password_confirmation => 'changeme'
puts 'user: ' << user2.first_name
user2.add_role :silver
user2 = User.find_or_create_by_email :first_name => 'Apple', :last_name => 'John', :email => 'user3@example.com', :password => 'changeme', :password_confirmation => 'changeme'
puts 'user: ' << user2.first_name
user2.add_role :gold
user2 = User.find_or_create_by_email :first_name => 'Pear', :last_name => 'Dog', :email => 'user4@example.com', :password => 'changeme', :password_confirmation => 'changeme'
puts 'user: ' << user2.first_name
user2.add_role :platinum