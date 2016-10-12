class Agency < ActiveRecord::Base
  has_many :users
  accepts_nested_attributes_for :users
  mount_uploader :logo, AvatarUploader
end
