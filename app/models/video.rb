class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  belongs_to :profile
  has_many :orders

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :prefecture

  with_options presence: true do
    validates :video, :title, :introduction
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid. Price is out of setting range' }
  end

  validates :genre_id, :prefecture_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
