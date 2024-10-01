set quiet := true

import? 'local.just'

[private]
help:
    just --list --unsorted

init:
    bundle install

build:
    bundle exec rake build

clean:
    rm -vf pkg/*

install:
    bundle exec rake install

test:
    bundle exec rspec

lint:
    rubocop

fix:
    rubocop -A

fmt:
    just --fmt
