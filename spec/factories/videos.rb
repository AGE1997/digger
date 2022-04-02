FactoryBot.define do
  factory :video do
    title             { 'Hip Hop' }
    introduction      { 'これぞHip Hop!!' }
    genre_id          { '7' }
    prefecture_id     { '34' }
    price             { '3500' }
    association :user

    after(:build) do |video|
      video.video.attach(io: File.open('public/videos/test_digger_IMG.MP4'), filename: 'test_digger_IMG.MP4')
    end
  end
end
