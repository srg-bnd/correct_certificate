class Domain < ApplicationRecord
  include AASM

  validates :name, presence: true, uniqueness: true
  after_create :set_aasm_state

  aasm do
    state :ok
    state :bad, initial: true

    event :success do
      transitions from: [:ok, :bad], to: :ok
    end

    event :failure do
      transitions from: [:ok, :bad], to: :bad
    end
  end

  def set_aasm_state
    result = Domains::CertificateVerificationService.new(self).call
    result.success? ? success! : failure!
  end
end
