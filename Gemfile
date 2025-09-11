# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.4.5"

gem "ruby_llm"           # abstraction over LLM providers
gem "json_schemer"       # JSON Schema validation
gem "oj"                 # fast JSON parsing
gem "dotenv"             # load .env files for API keys
gem "http"               # HTTP client (if you need one)
gem "rake"               # task runner

group :development, :test do
  gem "rspec"                     # testing
  gem "rubocop", require: false   # linting
  gem "rubocop-performance", require: false
end
