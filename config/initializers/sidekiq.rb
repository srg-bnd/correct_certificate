redis_password = ENV['REDIS_PASSWORD']
redis_host = ENV['REDIS_HOST']

redis_config = { url: "redis://#{redis_host}:6379" }
redis_config[:password] = redis_password if redis_password.present?

Sidekiq.configure_server { |config| config.redis = redis_config.dup }
Sidekiq.configure_client { |config| config.redis = redis_config.dup }
