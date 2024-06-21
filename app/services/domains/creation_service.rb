class Domains::CreationService < Service
  def call(params)
    domain = Domain.new(params)

    ApplicationRecord.transaction do
      return form_error(domain) unless domain.save

      init_state(domain)
    end

    success(domain)
  end

  private

  def init_state(domain)
    result = ::Domains::CertificateVerificationService.new(domain).call

    result.success? ? domain.success! : domain.failure!
  end
end
