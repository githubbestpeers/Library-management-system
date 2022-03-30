require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LibraryManagement
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.action_mailer.default_url_options = { host: "example.com" }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
# development:
#   paypal_client_id  :AYbK8OavdjZSCpZXb0kTIfiM4ZZosgZpbnRbbXAOS0fmd1iUcbQudIYoi4DEikODllbDaeZGrjES964x
#   paypal_client_sec :EBUF8FiBehcOQnJFr-uCn3BUOgsH8ZgiGHv121GAOgd8kdNoJD-UbrNre3mmDNxRvJuCJbNuuqXL9CNh

# test:
#   paypal_client_id  :AYbK8OavdjZSCpZXb0kTIfiM4ZZosgZpbnRbbXAOS0fmd1iUcbQudIYoi4DEikODllbDaeZGrjES964x
#   paypal_client_sec :EBUF8FiBehcOQnJFr-uCn3BUOgsH8ZgiGHv121GAOgd8kdNoJD-UbrNre3mmDNxRvJuCJbNuuqXL9CNh
  config_file = Rails.application.config_for(:application)
config_file.each do |key,value|
  ENV[key] = value
end unless config_file.nil?
  end
end
