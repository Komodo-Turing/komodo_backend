Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redistogo:b43f8de26bfabaacb4f6e0ccb1fb6e60@crestfish.redistogo.com:11680/' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redistogo:b43f8de26bfabaacb4f6e0ccb1fb6e60@crestfish.redistogo.com:11680/' }
end

# redis://localhost:6379/0