Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    credentials = false
    resource '*',
             :headers     => :any,
             :methods     => [:get, :post, :delete, :put],
             :credentials => credentials,
             :max_age     => 0
  end
end
