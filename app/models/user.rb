class User < ApplicationRecord
  has_secure_password

  has_many :org_memberships
  has_many :memberships, through: :org_memberships, source: :organization

   
end
