class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  has_one :order

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :name
    validates :description
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :price, presence: true

  validates :price,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9_999_999
            }, allow_blank: true

  validate :image_attached

  private

  def image_attached
    errors.add(:image, 'を添付してください') unless image.attached?
  end
end
