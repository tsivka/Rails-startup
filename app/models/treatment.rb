class Treatment < ActiveRecord::Base
  has_and_belongs_to_many :treatment_types
  has_many :items
end
