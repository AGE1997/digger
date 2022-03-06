class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image

  validates :nickname, presence: true

end
