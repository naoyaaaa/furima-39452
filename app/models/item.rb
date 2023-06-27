class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true
  validates :item_detail, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 ,only_integer: true }

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, class_name: 'Category'
  belongs_to :condition, class_name: 'Condition'
  belongs_to :cost, class_name: 'Cost'
  belongs_to :region, class_name: 'Region'
  belongs_to :howmanydays, class_name: 'Howmanydays'

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :howmanydays_id, numericality: { other_than: 1, message: "can't be blank" }
end
