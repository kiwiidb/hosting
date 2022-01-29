# Lightsail Plausible: installation instructions

1. Create a static IP address under the Networking tab of Lightsail.
2. Point your preferred domain to this IP address: eg. `analytics.yoursite.com`.
3. Create a Lightsail instance. Select Linux / OS Only / Amazon Linux 2 (the default).
4. Be aware that the Plausible stack requires quite a bit of resources so the lowest tier instances won't cut it.
$10 or $20 dollar /month instances should suffice.

7. Optionally enable snapshots or change the default ssh key.
8. Wait for the instance to come online
9. Under the networking tab of the instance, attach your static IP to the instance. Also add an HTTPS firewall rule.
10. Connect to your instance using the web ssh client.
11. Execute the following commands (fill in the custom values first):
```
sudo su
yum install -y git
cd $HOME
git clone https://github.com/kiwiidb/plausible-hosting 2>/dev/null
cd plausible-hosting
chmod +x install.sh
export ADMIN_USER_EMAIL=<your email>
export ADMIN_USER_NAME=<your name>
export ADMIN_USER_PWD=<your secure password>
export HOST=<your host>
./install.sh
```
12. After this has completed, check if everything is up and running using `docker ps`.
13. Surf to `analytics.yoursite.com` to check out your new Plausible server :).

## Known issues
Out of the box, [the smtp mailer does not seem to work](https://github.com/plausible/analytics/discussions/1537).
To enable e-mail functionality, you could try to use an external SMTP server or Postmark API. See the [docs](https://plausible.io/docs/self-hosting-configuration#mailersmtp-setup).
# Plausible Analytics setup examples

This repository acts as a a template to get up and running with [Plausible Analytics](https://github.com/plausible/analytics).

### How to use

Find instructions on how to run Plausible Analytics Self Hosted [in our docs](https://docs.plausible.io/self-hosting).

### Contributing

We are always looking to expand on the options and setups provided here. Feel free to open an issue or PR if you feel
something could be improved.
