class CreateItems < ActiveRecord::Migration[7.0]
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
    validates :title, :text, presence: true
    validates :Category_id, numericality: { other_than: 1 } 

  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :item_detail, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :cost_id, null: false
      t.integer :region_id, null: false
      t.integer :howmanydays_id, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

  validates :cotegory_id, numericality: { other_than: 1 , message: "can't be blank"}
end



