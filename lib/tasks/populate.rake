namespace :db do
  desc "Generate users"
  task populate: :environment do
    # Generate fixed users Yitao and Ed
  	yitao = User.create(name: "Yitao", email: "yitao@example.com", password: "password", password_confirmation: "password")
  	ed = User.create(name: "Ed", email: "ed@example.com", password: "password", password_confirmation: "password")

    # Generate 98 additional random users
  	users = [ yitao, ed ]
    users += 98.times.collect do |i|
      name = "user_#{i}"
      email = "#{name}@example.com"
      password = Faker::Internet.password
      user = User.create(name: name, email: email, password: password, password_confirmation: password)
    end

    # Randomize user created_at timestamp
    users.each { |user| user.update(created_at: Date.today - rand(30)) }

    # Generate posts
    posts = (10*users.count).times.collect do
      users.sample.posts.create(content: Faker::Lorem.sentence)
    end

    # Generate followings
    followings = (5*users.count).times.collect do
      from = users.sample
      to = users.sample
      from.follow(to) unless from == to || from.following?(to)
    end
  end
end