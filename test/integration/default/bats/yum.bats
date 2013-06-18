
# only run on rhel 
if [ -f /etc/redhat-release ] ; then
  @test "yum should work" {
    # this is a package on epel6
    yum install -y -q gzip
  }
fi
