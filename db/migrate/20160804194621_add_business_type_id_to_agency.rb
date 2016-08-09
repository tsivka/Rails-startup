class AddBusinessTypeIdToAgency < ActiveRecord::Migration
  def change
    add_reference :agencies, :business_type, index: true, foreign_key: true
    add_reference :users, :agency, index: true, foreign_key: true
  end
end
