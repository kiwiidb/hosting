# Lightsail Plausible: installation instructions

- Paste the following script as an entrypoint:
```
sudo yum install -y git
git clone https://github.com/kiwiidb/plausible-hosting 2>/dev/null
cd plausible-hosting
chmod +x install.sh
chmod +x start.sh
export ADMIN_USER_EMAIL=<your email>
export ADMIN_USER_NAME=<your name>
export ADMIN_USER_PWD=<your secure password>
export HOST=<your host>
./install.sh
```
# Plausible Analytics setup examples

This repository acts as a a template to get up and running with [Plausible Analytics](https://github.com/plausible/analytics).

### How to use

Find instructions on how to run Plausible Analytics Self Hosted [in our docs](https://docs.plausible.io/self-hosting).

### Contributing

We are always looking to expand on the options and setups provided here. Feel free to open an issue or PR if you feel
something could be improved.
