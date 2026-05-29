mod release

set quiet := true
set shell := ["bash", "-cu", "-o", "pipefail"]

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
    echo 'Nothing to format'
