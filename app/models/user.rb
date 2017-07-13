class User < ApplicationRecord
  has_secure_password

  has_many :org_memberships
  has_many :memberships, through: :org_memberships, source: :organization
  has_many :reviews
  has_many :ev_memberships, dependent: :destroy
  has_many :classes, through: :ev_memberships, source: :event

  mount_uploader :picture, PictureUploader

  def full_name
   "#{first_name} #{last_name}"
  end

end
