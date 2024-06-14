class Domain < ApplicationRecord
  include AASM

  validates :name, presence: true, uniqueness: true

  aasm do
    state :ok
    state :bad, initial: true

    event :success do
      transitions from: %i[ok bad], to: :ok
    end

    event :failure do
      transitions from: %i[ok bad], to: :bad
    end
  end
end
