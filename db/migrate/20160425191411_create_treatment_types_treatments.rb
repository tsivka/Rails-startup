class CreateTreatmentTypesTreatments < ActiveRecord::Migration
  def change
    create_table :treatment_types_treatments , id:false do |t|
      t.integer :treatment_type_id
      t.integer :treatment_id
    end
  end
end
