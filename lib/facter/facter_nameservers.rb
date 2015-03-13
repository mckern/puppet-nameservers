require 'resolv'

# FacterNameservers exists to make testing possible
module FacterNameservers
  def self.add_facts
    Facter.add(:nameservers) do
      setcode { Resolv::DNS::Config.default_config_hash[:nameserver] }
    end
  end
end

FacterNameservers.add_facts
