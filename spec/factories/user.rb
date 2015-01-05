FactoryGirl.define do
  factory :user do
    username 'user'
    email 'user@list.ru'
    password '00000000'
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    username 'user'
    email 'user@list.ru'
    password '00000000'
    admin true
  end
end
