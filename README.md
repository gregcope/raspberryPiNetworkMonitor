raspberryPiNetworkMonitor
=================================

Thanks
================================
This is mostly a copy of a work repo - thanks to the team; "Imitation is the sincerest form of flattery."

Intro
=================================
A project to setup Network monitoring using RaspBerry Pis' as network clients.  The aim is to use Model 3 as;
1. Have ethernet
2. Have WIFI
3. Can be POE powered with cheap adaptors
4. Resonably small (Zero W would be better)
5. Simple install / config
6. Installed in a simple box to distribute around locations

How it works
=================================
- `ansible` controls a simple install of `colletd`
- `colletd` executes certain network related actions like `ping` to monitor
    - Response time (analogus to speed)
    - Packet Loss (analogus to errors)
- `collecrd` also runs `curl` against some standard websites
- An iterstion may automagically `ping` the first few hops in routes to the internet to help debug

Why not the Zero W
================================
These are only avaliable in single order quantity

Install
================================
- `configPi.sh` reconfigures the pi enough to run the ansible playbook
- `ansible` managed
- installs the playbook
- install the `gpg` key to check the sig of the playbook
- `Patches all the things` and later on enables unattended upgrades
- Installs some packages to get `collectd` working
- Installs and registers Amazon SSM
- Installs a new `ssh` config that dis-ables password auth
- Installs a crong job to redownload and run the playbook hourly

Login
==================================
- Raise a pull request adding you ssh public key to `ansible/roles/general/files/ssh.keys`
- Do a build (see How to make a change)

How to make a change
==================================
1. Make a pull request
2. A job will then change and sign the build
3. At the top of the hour, the hosts will download, check the sig, and re-run the playbook
