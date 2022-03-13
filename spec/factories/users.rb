FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    telephone_number      { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    password              { 'mh196398' }
    password_confirmation { password }
    last_name             { '松本' }
    first_name            { '人志' }
    pseudonym_last_name   { 'マツモト' }
    pseudonym_first_name  { 'ヒトシ' }
  end
end
