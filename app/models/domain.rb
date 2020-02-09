class Domain < ApplicationRecord
  include AASM

  validates :name, presence: true, uniqueness: true
  after_create :init_aasm_state

  aasm do
    state :ok
    state :error

    event :failure do
      transitions from: [:ok, :error], to: :error
    end

    event :success do
      transitions from: [:ok, :error], to: :ok
    end
  end

  def init_aasm_state
    # TODO: certificate verificatio service
  end
end
