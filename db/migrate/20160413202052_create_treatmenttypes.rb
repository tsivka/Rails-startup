class CreateTreatmenttypes < ActiveRecord::Migration
  def change
    create_table :treatmenttypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
