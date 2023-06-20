class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_image, presence: true
  validates :item_name, presence: true
  validates :item_detail, presence: true
  validates :price, presence: true
  


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
    validates :title, :text, presence: true
    validates :Category_id, numericality: { other_than: 1 , message: "can't be blank"} 
    validates :Condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
    validates :Cost_id, numericality: { other_than: 1 , message: "can't be blank"} 
    validates :Region_id, numericality: { other_than: 1 , message: "can't be blank"} 
    validates :Howmanydays_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
