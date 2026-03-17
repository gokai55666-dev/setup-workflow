#!/usr/bin/env bats

load 'libs/assert'

@test "true is true" {
  run true
  assert_success
}

@test "list contains something" {
  run ls .
  assert_output --partial "README.md"
}
