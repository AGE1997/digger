FactoryBot.define do
  factory :order do
    prefecture_id { '38' }
    token         {"tok_abcdefghijk00000000000000000"}
    association :user
    association :profile
    association :video
  end
end
