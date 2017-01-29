#! /bin/sh
#
# Currently, it only works in macOS
# This script has some steps that needed to be executed before running the playbooks

if [ -f ~/.ssh/id_rsa ]
then
  echo "You already have a ssh key!"
else
  # Generate ssh-key
  ssh-keygen -t rsa -b 4096
fi

echo "Now, you'll need to add the generated key in your GitHub account - unfortunately, this can't be automated (yet?)"
echo "Please execute the following command:"
echo "cat ~/.ssh/id_rsa.pub | pbcopy"
echo "\n"
echo "Then go to your GitHub account and add it!"
echo "If you need any help, you can follow the steps from this wiki: https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/" 
