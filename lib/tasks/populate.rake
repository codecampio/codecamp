namespace :db do
  desc "Generate users"
  task populate: :environment do
    # Generate fixed users Yitao and Ed
  	yitao = User.create(name: "Yitao", email: "yitao@example.com")
  	ed = User.create(name: "Ed", email: "ed@example.com")

    # Generate 98 additional random users
  	users = [ yitao, ed ]
    users += 98.times.collect do
      name = Faker::Name.first_name
      email = "#{name}@example.com"
      password = Faker::Internet.password
      user = User.create!(name: name, email: email, password: password, password_confirmation: password)
    end

    # Randomize user created_at flat
    users.each { |user| user.update(created_at: Date.today - rand(30)) }
  end
end