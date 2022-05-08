class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :video
  belongs_to :profile

  with_options presence: true do
    validates :value, :text
  end
end