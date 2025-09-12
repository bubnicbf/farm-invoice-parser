# frozen_string_literal: true

require 'rspec'
require 'dotenv/load'

# Load the initializer (so RubyLLM defaults apply in tests)
require_relative '../config/initializers/ruby_llm'

RSpec.configure do |config|
  config.order = :random
  config.color = true
  config.formatter = :documentation

  # Fail fast on first error if running with `RSPEC_FAIL_FAST=1`
  config.fail_fast = ENV['RSPEC_FAIL_FAST'] == '1'
end
