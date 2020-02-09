# `openssl s_client -connect example.com:443`
module SSL
  class CertificateVerification
    DEFAULT_PORT = 443

    attr_reader :host, :result

    def initialize(domain_name)
      @host = domain_name
    end

    def check
      @tcp_client = init_tcp_client
      @cert_store = init_cert_store
      @ssl_client = init_ssl_client
      @ssl_client.hostname = host
      @ssl_client.connect

      @cert = init_cert
      @result = init_result

      close_connect
      @result
    end

    private

    def init_tcp_client
      TCPSocket.new(host, DEFAULT_PORT)
    end

    def init_ssl_client
      OpenSSL::SSL::SSLSocket.new(@tcp_client, init_ssl_context)
    end

    def init_cert_store
      OpenSSL::X509::Store.new.tap(&:set_default_paths)
    end

    def init_ssl_context
      OpenSSL::SSL::SSLContext.new.tap do |ssl_context|
        ssl_context.verify_mode = OpenSSL::SSL::VERIFY_PEER
        ssl_context.cert_store = @cert_store
      end
    end

    def init_cert
      OpenSSL::X509::Certificate.new(@ssl_client.peer_cert)
    end

    def init_result
      {
        cert: {
          valid_on: @cert.not_before,
          valid_until: @cert.not_after,
          issuer: @cert.issuer.to_a
        },
        ssl_client: {
          verify_result: @ssl_client.verify_result,
          valid: @ssl_client.verify_result.zero?
        },
        # store: {
        #   verify: @cert_store.verify(@cert),
        #   error_string: @cert_store.error_string,
        #   error: @cert_store.error
        # },
        verify_certificate_identity: verify_certificate_identity,
        peer_cert_chain: @ssl_client.peer_cert_chain.count
      }
    end

    def verify_certificate_identity
      OpenSSL::SSL.verify_certificate_identity(@cert, host)
    end

    def close_connect
      @ssl_client.sysclose
      @tcp_client.close
    end
  end
end
