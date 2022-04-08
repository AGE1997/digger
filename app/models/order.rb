class Order < ApplicationRecord
  belongs_to :user
  belongs_to :video
  belongs_to :profile

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end