class User < ActiveRecord::Base
  enum role: [:guest, :admin, :individual, :agency, :moderator]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :agency
  # accepts_nested_attributes_for :agency
  mount_uploader :photo, AvatarUploader
  # after_save :create_and_associate_company, on: :create

  # private
  #     def create_and_associate_company
  #       company = self.build_agency
  #       # Other necessary attributes assignments
  #       company.save
  #     end
end
