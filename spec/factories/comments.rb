FactoryBot.define do
  factory :comment do
    value   { '4.5' }
    text    { 'ๆ้ซใงใ!' }
    association :user
    association :profile
    association :video
  end
end
