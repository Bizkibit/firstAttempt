class Organization < ApplicationRecord
  has_secure_password

  has_many :org_memberships, dependent: :destroy
  has_many :members, through: :org_memberships, source: :user

  has_one :event


end
