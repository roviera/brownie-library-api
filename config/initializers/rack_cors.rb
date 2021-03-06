module App
  class Application < Rails::Application
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options, :put, :delete],
                      expose: ['access-token', 'uid', 'client', 'expiry']
      end
    end
  end
end
