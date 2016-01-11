# Systemd Dependencies

Systemd is basically a service dependency tree manager.  This repo is
setup to show examples of various examples of the setups possible with systemd.

## Setup

We use ansible to lay down the service files for one or more fake
services.  Any systemd system can be used as the base, just create an
inventory file containing a single host and the credentials needed.

``` INI
my-host ansible_ssh_user=myself ansible_ssh_pass=secret
```

Then call the correct playbook with the example you want.

``` bash
$ ansible-playbook -i inventory.yml example.yml
```

At this point simply log into the host and play around with the
services that were installed to see how everything works.

## Fake Daemon

The daemon that each service runs is based on the same template:

1. Prints name + "started"
1. Prints name + "stopped", if told to stop
1. Loop indefinitely
1. Sleep 10s
1. Print name

## Examples

Each example has a corresponding playbook and instructions.

### Dependent Client

In this style there is a primary service (like a database) which is
running on the machine, and a client service which needs it.  The
primary service is off-the-shelf software so its service files has no
knowledge of the dependent client service.

Install: `asnible-playbook -i inventory.yml dependent-client.yml`

Behaviors:

1. If the primary service is started then the client is as well.
1. If the client service is started the primary is as as well.
1. If the primary service is restarted then the client is as well.
1. If the primary service dies then the client service does as well.
  1. `sudo service stop primary-service` or
  1. `sudo killall primary-service.sh`
