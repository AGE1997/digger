class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :genre
  belongs_to :prefecture

  validates :nickname, presence: true

end
