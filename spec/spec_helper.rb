ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment", __FILE__)
require "support/generator_spec_setup"
require "support/view_definition_helpers"

RSpec.configure do |config|
  config.order = "random"
  config.include ViewDefinitionHelpers

  if defined? ActiveSupport::Testing::Stream
    config.include ActiveSupport::Testing::Stream
  end
end
