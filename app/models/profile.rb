class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  has_many :videos
  has_many :orders
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :genre
  belongs_to :prefecture

  with_options presence: true do
    validates :image, :nickname
  end
end
