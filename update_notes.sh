#!/bin/sh
ssh_auth_sock=`find /tmp -iname "keyring*"`
export SSH_AUTH_SOCK=${ssh_auth_sock}/ssh
git status |grep "cherrytree.ctd"
if [ $? != "1" ]; then
    git pull
    git add cherrytree.ctd;
    git commit -m "update notes"; 
    git push
    echo "update notes"
else
    echo "no need update notes"
fi
