class AddBusinessTypeIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :business_type, index: true, foreign_key: true
  end
end
