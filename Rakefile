# frozen_string_literal: true

require 'rake/testtask'

# Load RSpec if available
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:test)
rescue LoadError
  desc 'Run tests'
  task :test do
    sh "echo 'RSpec not installed. Run bundle install first.'"
  end
end

# RuboCop linting
begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:lint)
rescue LoadError
  desc 'Run RuboCop'
  task :lint do
    sh "echo 'RuboCop not installed. Run bundle install first.'"
  end
end

# Default task runs both
desc 'Run lint and test'
task default: %i[lint test]

# runs OCR -> LLM parser
desc 'Parse invoice file via OCR and LLM'
task :parse_invoice, [:path, :provider, :model] do |_t, args|
  args.with_defaults(provider: :openai, model: 'gpt-4o-mini')
  sh "bin/parse_invoice #{args[:path]} --provider #{args[:provider]} --model #{args[:model]}"
end
