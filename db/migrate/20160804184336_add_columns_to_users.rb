class AddColumnsToUsers < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :zip
      t.integer :district
      t.integer :region
      t.string :country,  default: 'Україна'
      t.integer :phone
      t.string :logo
      t.text :description
      t.text :treatments
    end
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :photo, :string
    add_column :users, :is_freelancer,:boolean, default: false
  end
end
