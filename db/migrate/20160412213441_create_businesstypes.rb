class CreateBusinesstypes < ActiveRecord::Migration
  def change
    create_table :businesstypes do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
