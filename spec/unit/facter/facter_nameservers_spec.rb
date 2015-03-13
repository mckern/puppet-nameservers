require 'resolv'
require 'spec_helper'
require 'lib/facter/facter_nameservers'

def fixture(path)
  File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "fixtures", path))
end

def dns_stub(path)
  Resolv::DNS::Config.parse_resolv_conf(fixture(path))
end

describe "FacterNameservers" do
  before :each do
    expect(Resolv::DNS::Config)
      .to receive(:default_config_hash)
      .and_return(dns_stub('resolv.conf'))
    FacterNameservers.add_facts
  end

  after :each do
    Facter.clear
    Facter.clear_messages
  end

  describe "#add_facts" do
    subject(:fact) { Facter.value(:nameservers) }

    # A regular ol' RSpec example
    it { should eql Array['192.168.1.2', '192.168.1.3'] }
  end
end
