ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'support/test_password_helper'
require 'capybara/rails'


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include TestPasswordHelper

  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def sign_in_as(user, password)
    post login_path, params: { session: {email: user.email, password: password } }
  end
  # Add more helper methods to be used by all tests here...
end