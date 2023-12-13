# frozen_string_literal: true

# The connection string for Redis server.
redis_conn = ENV.fetch("REDIS_CONNECTION") { "redis://127.0.0.1:6379/12" }
sidekiq_namespace = ENV.fetch("SIDEKIQ_NAMESPACE") { "prosas" }

Sidekiq.configure_server do |config|
  config.redis = { namespace: sidekiq_namespace, url: redis_conn }
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: sidekiq_namespace, url: redis_conn }
end
