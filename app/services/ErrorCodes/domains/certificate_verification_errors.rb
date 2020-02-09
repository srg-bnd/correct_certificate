# frozen_string_literal: true

module ErrorCodes::Domains::CertificateVerificationErrors
  EXPIRES_IN_LESS_THAN_1_WEEK = :expires_in_less_than_1_week
  EXPIRES_IN_LESS_THAN_2_WEEK = :expires_in_less_than_2_week
  EXPIRED = :expired
  ERROR_SSL = :error_ssl
  CONNECTION_FAILED = :connection_failed
end
