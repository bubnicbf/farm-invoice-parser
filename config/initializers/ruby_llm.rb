# frozen_string_literal: true

require 'ruby_llm'

RubyLLM.configure do |config|
  # Provider API keys
  config.openai_api_key     = ENV['OPENAI_API_KEY']
  config.anthropic_api_key  = ENV['ANTHROPIC_API_KEY']
  config.gemini_api_key     = ENV['GEMINI_API_KEY']

  # Optional debugging
  # require 'logger'
  # config.logger = Logger.new($stdout)
end
