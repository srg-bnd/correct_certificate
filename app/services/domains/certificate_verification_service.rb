class Domains::CertificateVerificationService < Service
  ERRORS = ErrorCodes::Domains::CertificateVerificationErrors
  HAS_EXPIRED = 'certificate has expired'
  UNABLE_CERT = 'unable to get local issuer certificate'

  def initialize(domain)
    @domain = domain
  end

  def call
    error_code_verification = certificate_verification(domain_name)
    return error_code(error_code_verification) if error_code_verification

    success(nil)
  end

  private

  def domain_name
    @domain&.name
  end

  def certificate_verification(domain_name)
    result = SSL::CertificateVerification.new(domain_name).check
  rescue OpenSSL::SSL::SSLError => e
    return ERRORS::EXPIRED if e.message.include?(HAS_EXPIRED)
    return ERRORS::CONNECTION_FAILED if e.message.include?(UNABLE_CERT)

    ErrorCodes::ERROR
  rescue StandardError => _e
    ErrorCodes::ERROR
  else
    checking_params(result)
  end

  def checking_params(result)
    weeks = weeks(result[:cert][:valid_until])
    if weeks < 1.week
      ERRORS::EXPIRES_IN_LESS_THAN_1_WEEK
    elsif weeks < 2.weeks
      ERRORS::EXPIRES_IN_LESS_THAN_2_WEEK
    elsif !result[:verify_certificate_identity]
      ERRORS::ERROR_SSL
    end
  end

  def organization(issuer)
    issuer.select { |name, _data, _type| name == 'O' }.first[1]
  end

  def weeks(time)
    (time - Time.zone.now).weeks
  end
end
