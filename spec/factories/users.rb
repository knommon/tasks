FactoryGirl.define do
	factory :user do
		#name 'Test User'
		#email 'test@user.com'
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "p#{n}@example.com" }
		password 'password'
		password_confirmation 'password'

		# required if Devise Confirmable is used
    confirmed_at Time.now
	end
end

