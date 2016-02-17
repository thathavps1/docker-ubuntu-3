#!/usr/bin/env bats

@test "It should install a version of glibc protected against CVE-2015-7547" {
  # Fixed in 2.19-0ubuntu6.7: http://www.ubuntu.com/usn/usn-2900-1/
  actual_version="$(dpkg-query --showformat='${Version}' --show libc6)"
  desired_version="2.19-0ubuntu6.7"
  echo "Installed libc6: $actual_version"
  echo "Desired libc6:   $desired_version"
  dpkg --compare-versions "$actual_version" "ge" "$desired_version"
}
