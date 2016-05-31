#!/usr/bin/env bats

# http://www.ubuntu.com/usn/usn-2900-1/
# http://people.canonical.com/~ubuntu-security/cve/2015/CVE-2015-7547.html

@test "It should install a version of glibc protected against CVE-2015-7547" {
  actual_version="$(dpkg-query --showformat='${Version}' --show libc6)"
  echo "Installed libc6: $actual_version"
  echo "Desired libc6:   $LIBC_MIN"
  dpkg --compare-versions "$actual_version" "ge" "$LIBC_MIN"
}
