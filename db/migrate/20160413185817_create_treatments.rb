class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.string :name
      t.json :category, default:  {}
      t.boolean :show, default:  true

      t.timestamps null: false
    end
  end
end
