class User < ApplicationRecord
  has_secure_password

  has_many :org_memberships
  has_many :memberships, through: :org_memberships, source: :organization

  def full_name
   "#{first_name} #{last_name}"
  end
  
end
