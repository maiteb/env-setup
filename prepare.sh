#! /bin/sh
#
# Currently, it only works in macOS
#
# This script has some steps that needed to be executed before running the playbooks
# Some things will be prompted, so pay attention while running it!

# Check if homebrew is installed - if not, it will be installed!
command -v brew >/dev/null 2>&1 || { echo "Installing Homebrew..." >&2; /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

# Install git from brew, just in case
brew install git

# Install pip because Ansible needs it
sudo easy_install pip

# Install Ansible dependencies
sudo pip install paramiko PyYAML Jinja2 httplib2 six

# Using Ansible from source
pushd $HOME
git clone https://github.com/ansible/ansible.git --recursive
cd ./ansible
source ./hacking/env-setup
echo "source ./hacking/env-setup" >> ~/.bashrc
popd

# Check if the user has a ssh key - if not, it will be generated!
if [ -f ~/.ssh/id_rsa ]
then
  echo "You already have a ssh key! :)"
else
  # Generate ssh-key
  ssh-keygen -t rsa -b 4096
fi

echo "Now, you'll need to add the generated key in your GitHub account - unfortunately, this can't be automated (yet?)"
echo "Please execute the following command:"
echo "cat ~/.ssh/id_rsa.pub | pbcopy"
echo "--- --- --- --- --- ---"
echo "Then go to your GitHub account and add it!"
echo "If you need any help, you can follow the steps from this wiki: https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/"
