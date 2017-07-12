class Organization < ApplicationRecord
  has_secure_password

  has_many :org_memberships, dependent: :destroy
  has_many :members, through: :org_memberships, source: :user
  has_many :reviews, dependent: :destroy

  mount_uploaders :pictures, PictureUploader


  # to search through the organization names
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }

  has_one :event

  geocoded_by :address
  after_validation :geocode

end
