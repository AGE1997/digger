FactoryBot.define do
  factory :video do
    title
    intoroduction
    genre_id
    prefecture_id
    price
    association :user
  end
end
