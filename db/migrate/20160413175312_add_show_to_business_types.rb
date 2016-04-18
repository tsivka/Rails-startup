class AddShowToBusinessTypes < ActiveRecord::Migration
  def change
    add_column :business_types, :show, :boolean, default:  true
  end
end
