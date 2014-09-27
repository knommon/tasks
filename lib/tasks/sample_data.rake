namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		begin
		u = User.new(name: "Nick Example", 
								 email: "nick@example.com",
								 password: "foobar9",
								 password_confirmation: "foobar9")
    u.skip_confirmation!
    u.save
		rescue
		end
    make_users
    make_posts
    make_relationships
  end
end

def make_users
  99.times do |n|
    name = Faker::Name.name
    #email = Faker::Internet.email
    email = "e#{n}@example.com"
    password = "password"
    
    u = User.new(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
    u.skip_confirmation!
    u.save
  end
end

def make_posts
  users = User.limit(6)
  20.times do 
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.posts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |u| user.follow!(u) }
  followers.each      { |u| u.follow!(user) }
end
