class AddStreetToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :street, :string
  end
end
