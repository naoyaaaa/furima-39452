class CreatePurchaseLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_logs do |t|
      t.references :item, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    
    end
  end
end
