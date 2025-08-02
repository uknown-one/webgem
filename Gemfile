# Gemfile
source "https://rubygems.org"

ruby ">= 2.7"

# Use the gemspec for the core specification (name/version/dependencies)
gemspec

# Runtime helpers (optional, you can add as needed)
# Example: for pretty CLI output, you might include:
# gem "tty-table"
# gem "pastel"

group :development do
  gem "rake", "~> 13.0"         # task runner
  gem "bundler", "~> 2.4"      # ensure modern bundler
  gem "pry", "~> 0.14"          # debugging / REPL
  gem "rubocop", "~> 1.30", require: false  # style linting
  gem "reek", "~> 6.0", require: false      # code smell detector
end

group :test do
  gem "rspec", "~> 4.0"
  gem "simplecov", "~> 1.0"     # coverage reporting
  gem "fakefs", "~> 1.3"         # for isolated filesystem tests if needed
end

# Optional: enable you to run examples in isolation
group :examples do
  # e.g., if you want to include a small DSL demonstration dependency
end
