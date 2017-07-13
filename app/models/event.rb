class Event < ApplicationRecord
  belongs_to :organization

  has_many :ev_memberships, dependent: :destroy
  has_many :attendees, through: :ev_memberships, source: :user

end
