class AddShowToBusinesstypes < ActiveRecord::Migration
  def change
    add_column :businesstypes, :show, :boolean, default:  true
  end
end
