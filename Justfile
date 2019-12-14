_help:
    just --list

# Build gem
build:
    bundle exec rake build

# Remove built gems
clean:
    rm --force --verbose pkg/*

# Build and install the gem globally to the system
install:
    bundle exec rake install

# Deploy the gem to rubygems.org
release:
    bundle exec rake release

# Run tests
test:
    bundle exec rspec
