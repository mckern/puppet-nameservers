## Nameserver_Facts: facts about your resolver settings
### Riddle Me This! What is a module that isn't a module?

Answer: a convenient way to distribute custom facts. Specifically, this module
exposes information from Ruby's `Resolv::DNS` class as custom facts that can
be used in your puppet manifests. Super handy if you're using DHCP for networking
and not explicitly specifying resolution settings in Puppet already.

### Requirements

Nameserver_Facts has no explicit requirements beyond Facter >= 2.0 and
Puppet >= 3.5.0 with `pluginsync` enabled. Installing the module will
automatically make the custom facts available in your manifests.

### Usage

```bash
# It's just this easy!
mckern@stompbox ~ $ facter -p nameservers
["10.11.11.1"]
```

### Caveats

Nameserver_Facts will expose the resolver settings on each agent as facts, not the resolver settings
from your Puppet server. The use-case for this module was specifically that `resolver`
has to be set for NGINX due to their use of their own non-blocking resolver (that is
explicitly left ignorant of the system resolver configuration).

### License

Nameserver_Facts is licensed under the Apache License, Version 2.0. Fork it, modify it, submit
pull requests with features because there's a bunch of stuff you want to see in it. Go nuts.
