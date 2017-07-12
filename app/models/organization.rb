class Organization < ApplicationRecord
  has_secure_password

  has_many :org_memberships, dependent: :destroy
  has_many :members, through: :org_memberships, source: :user
  has_many :reviews, dependent: :destroy
  has_many :events

  mount_uploaders :pictures, PictureUploader
  serialize :pictures, JSON

  accepts_nested_attributes_for :events,
                                reject_if: :all_blank,
                                allow_destroy: true

  # to search through the organization names
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }


  geocoded_by :address
  after_validation :geocode

  include AASM

  aasm whiney_transitions: false do
    state :pending, intial: true
    state :approved, :rejected

    event :approve do
      transitions from: :pending, to: :approved
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end

  end


end
