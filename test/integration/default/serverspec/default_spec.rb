# Encoding: utf-8

require_relative 'spec_helper'

describe port(22) do
  it { should be_listening }
end

## TODO: standardize IPTables rules across operating systems
# describe iptables do
#   it { should have_rule('-p tcp -m tcp --dport 22 -m comment --comment "vagrant ssh" -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 50.56.228.0/24 -m comment --comment Support -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 50.56.230.0/24 -m comment --comment Support -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 69.20.52.192/26 -m comment --comment Monitoring -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 180.150.149.64/26 -m comment --comment Monitoring -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 78.136.44.0/26 -m comment --comment Monitoring -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 50.57.61.0/26 -m comment --comment Monitoring -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 50.56.142.128/26 -m comment --comment Monitoring -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 119.9.4.2/32 -m comment --comment Bastion -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 212.100.225.42/32 -m comment --comment Bastion -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 212.100.225.49/32 -m comment --comment Bastion -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 120.136.34.22/32 -m comment --comment Bastion -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 50.57.22.125/32 -m comment --comment Bastion -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 69.20.0.1/32 -m comment --comment Bastion -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-s 72.3.128.84/32 -m comment --comment Bastion -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-i lo -m comment --comment Loopback -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-m conntrack --ctstate RELATED,ESTABLISHED -m comment --comment "Allow establihsed" -j ACCEPT').with_chain('INPUT') }
#   it { should have_rule('-m comment --comment "Drop not allowed" -j REJECT --reject-with icmp-port-unreachable').with_chain('INPUT') }
# end

describe user('rack') do
  it { should exist }
  it { should have_home_directory '/home/rack' }
end

describe file('/home/rack/.ssh/authorized_keys') do
  it { should be_file }
  it { should contain 'ssh-rsa' }
end
