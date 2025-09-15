# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.4.5'

gem 'dotenv'             # load .env files for API keys
gem 'http'               # HTTP client (if you need one)
gem 'json_schemer'       # JSON Schema validation
gem 'oj'                 # fast JSON parsing
gem 'rake'               # task runner
gem 'ruby_llm'           # abstraction over LLM providers
gem 'mini_magick'        # image pre-processing
gem 'rtesseract'         # Tesseract OCR bindings

group :development, :test do
  gem 'rspec'                     # testing
  gem 'rubocop', require: false   # linting
  gem 'rubocop-performance', require: false
end
