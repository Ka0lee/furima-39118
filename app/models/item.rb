class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name, presence: true

  with_options presence: true do
    validates :price, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  validates :info, presence: true
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, presence: true, numericality: { other_than: 1, message: "は---以外を選択してください"}

  belongs_to :sales_status
  validates :sales_status_id, presence: true, numericality: { other_than: 1, message: "は---以外を選択してください"}

  belongs_to :shipping_fee_status
  validates :shipping_fee_status_id, presence: true, numericality: { other_than: 1, message: "は---以外を選択してください"}

  belongs_to :prefecture
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "は---以外を選択してください"}

  belongs_to :scheduled_delivery
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1 , message: "は---以外を選択してください"}


end
