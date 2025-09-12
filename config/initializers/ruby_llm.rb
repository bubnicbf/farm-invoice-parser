# frozen_string_literal: true

require 'ruby_llm'

# Central RubyLLM configuration
RubyLLM.configure do |c|
  # Defaults (can be overridden via ENV)
  c.default_provider = (ENV['RUBYLLM_PROVIDER'] || :openai).to_sym
  c.default_model    = ENV['RUBYLLM_MODEL'] || 'gpt-4o-mini'

  # Optional logging to STDOUT (uncomment if debugging)
  # require "logger"
  # c.logger = Logger.new($stdout)
end
