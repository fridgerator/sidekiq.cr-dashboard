require "sidekiq/web"

# Basic authentication:
#
require "kemal-basic-auth"

if (username = ENV["BASIC_AUTH_USERNAME"]?) && (password = ENV["BASIC_AUTH_PASSWORD"]?)
  basic_auth username, password
end

Kemal.config do |config|
  # To enable SSL termination:
  # ./web --ssl --ssl-key-file your_key_file --ssl-cert-file your_cert_file
  #
  # For more options, including changing the listening port:
  # ./web --help
end

Kemal::Session.config do |config|
  config.secret = ENV["DASHBOARD_SECRET"]
end

# Exact same configuration for the Client API as above
Sidekiq::Client.default_context = Sidekiq::Client::Context.new

Kemal.run
