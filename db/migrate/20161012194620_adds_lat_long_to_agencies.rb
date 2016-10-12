class AddsLatLongToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :latitude, :string
    add_column :agencies, :longitude, :string
  end
end
