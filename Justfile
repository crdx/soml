set quiet

import? 'internal.just'

[private]
help:
    just --list --unsorted

# build gem
build:
    bundle exec rake build

# remove built gems
clean:
    rm -vf pkg/*

# build and install the gem globally to the system
install:
    bundle exec rake install

# run tests
test:
    bundle exec rspec

# run linter
lint:
    rubocop

# fix lint errors
fix:
    rubocop -a
