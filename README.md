# Ip Whitelister

A very simple bash script, intended to whitelist a bunch of ips, from JSON file.
it also backup the iptables rules, and drop a line to restore these rules on boot.

all the good code is from 
[StackOverflow](https://stackoverflow.com/questions/14029212/automate-whitelisting-ip-addresses-in-iptables-via-bash)

## Installation

just clone and cd to this repo, then:

```bash
bash whitelister.sh
```

[GNU](https://choosealicense.com/licenses/gpl-3.0/)