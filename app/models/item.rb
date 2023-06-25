class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :sales_status_id
  validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :shipping_fee_status_id
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :prefeture_id
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :scheduled_derivery_id
  validates :scheduled_derivery_id, numericality: { other_than: 1 , message: "can't be blank"}



end
