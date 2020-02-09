require 'sidekiq-scheduler'

class CertificateVerificationJob < ApplicationJob
  def perform
    Domain.all.each(&:set_aasm_state)
  end
end
