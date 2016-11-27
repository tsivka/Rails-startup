class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :treatment_id
      t.text :prices
      t.decimal :price_min
      t.decimal :discount
      t.boolean :show
      t.integer :position
      t.text :description
      t.timestamps null: false
    end
  end
end
