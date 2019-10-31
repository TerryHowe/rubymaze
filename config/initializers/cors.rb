# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ''
    resource '*',
             headers: :any,
             methods: :any,
             expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
             credentials: true,
             max_age: 0
  end
end
