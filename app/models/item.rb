class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
end
