#!/usr/bin/env bats

@test "It should have Bats installed" {
  which bats
}

@test "Bats should be v0.3.1" {
  bats -v | grep '0\.3\.1'
}
