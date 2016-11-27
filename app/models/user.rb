class User < ActiveRecord::Base
  enum role: [:guest, :admin, :individual, :agency, :moderator]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :agency, :class_name => 'Agency', :foreign_key => 'agency_id'
  # attr_accessible :agency_attributes
  accepts_nested_attributes_for :agency
  mount_uploader :photo, AvatarUploader
  validates_acceptance_of :terms

  has_many :items

  after_create :create_and_associate_company, on: :create

  private
      def create_and_associate_company
        company = self.build_agency
        company.save
      end
end
