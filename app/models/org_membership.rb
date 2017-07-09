class OrgMembership < ApplicationRecord
  belongs_to :user
  belongs_to :organization

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
