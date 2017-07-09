class Organization < ApplicationRecord

  has_many :org_memberships, dependent: :destroy
  has_many :members, through: :org_memberships, source: :user

end
