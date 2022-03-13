FactoryBot.define do
  factory :profile do
    nickname          { 'AG' }
    sex_id            { '2' }
    genre_id          { '7' }
    prefecture_id     { '38' }
    birthday          { '1997-3-31' }
    biography         { 'NEW JACK styleです。' }
    association :user

    after(:build) do |profile|
      profile.image.attach(io: File.open('public/images/test_digger_image.png'), filename: 'test_digger_image.png')
    end
  end
end
