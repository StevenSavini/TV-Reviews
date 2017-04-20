FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    username Faker::Internet.user_name
    avatar_url Faker::Avatar.image
  end

  factory :show do
    sequence :title do |n|
      "Game of Thrones#{n}"
    end
    description Faker::Hipster.sentence(3)
    average_rating 5
  end
end
