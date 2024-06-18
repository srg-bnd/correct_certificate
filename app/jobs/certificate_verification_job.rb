require 'sidekiq-scheduler'

class CertificateVerificationJob < ApplicationJob
  def perform
    Domain.find_each do |domain|
      result = CertificateVerificationService.new(domain).call
      result.success? ? domain.success! : domain.failure!
    end
  end
end
