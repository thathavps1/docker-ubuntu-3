#!/usr/bin/env bats

@test "It should have Bats installed" {
  which bats
}

@test "Bats should be v0.3.1" {
  bats -v | grep '0\.3\.1'
}

@test "It should install an OpenSSL version protected from CVE-2014-0160" {
  # For details on CVE-2014-0160, see http://heartbleed.com/
  run dpkg -s openssl
  [[ "$output" =~ "1.0.1-4ubuntu5.12" ]]
}

@test "It should install a libssl version protected from CVE-2014-0160" {
  run dpkg -s libssl1.0.0
  [[ "$output" =~ "1.0.1-4ubuntu5.12" ]]
}
