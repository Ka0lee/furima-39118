class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  belongs_to :sales_status_id
  validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}
end
