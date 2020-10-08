#! /bin/bash
#----------------------------------
#sshfs share management tool
#Version 0.1
#use s-sshfs-attach to mount the sshfs shares home of ant, cent and horsehead
#use s-sshfs-detach to unmount the sshfs shares home of ant, cent and horsehead#
#
# todo : unify unders signle command with tool flag input from command line
#
#
##

printf "chose an option to mount(1), unmount(2), or list (3) the shares?"
printf "input your answer 1 2 or 3 :\n  #: "
read answer
printf "\n"
if [ "$answer" = "1" ]; then 
    ### for workstation
     #share on ant
    echo "attaching  ant"
    sudo sshfs -o reconnect,allow_other,idmap=user,uid=0,gid=0,cache=no,noauto_cache,entry_timeout=0,IdentityFile=/home/kradsmit/.ssh/id_rsa kradsmit@ant:/home/ /home/backup/ant
    # share on horsehead
    echo "attaching horsehead"
    sudo sshfs -o reconnect,allow_other,idmap=user,uid=0,gid=0,cache=no,noauto_cache,entry_timeout=0,IdentityFile=/home/kradsmit/.ssh/id_rsa kradsmit@horsehead:/home/ /home/backup/horsehead
    #share on cent
    echo "attaching cent"
    sudo sshfs -o reconnect,allow_other,idmap=user,uid=0,gid=0,cache=no,noauto_cache,entry_timeout=0,IdentityFile=/home/kradsmit/.ssh/id_rsa kradsmit@cent:/home/ /home/backup/cent
    ls -h /home/backup/*
fi
if [ "$answer" = "3" ]; then
    ls -h /home/backup/* --color
fi
###  for servers
#share on ant
#sudo sshfs -o reconnect,nonempty,allow_other,idmap=user,uid=0,gid=0,cache=no,noauto_cache,entry_timeout=0,IdentityFile=/home/kradsmit/.ssh/id_rsa kradsmit@ant:/home/backup/ant /home/backup/ant
# share on horsehead
#sudo sshfs -o reconnect,nonempty,allow_other,idmap=user,uid=0,gid=0,cache=no,noauto_cache,entry_timeout=0,IdentityFile=/home/kradsmit/.ssh/id_rsa kradsmit@horsehead:/home/backup/horsehead /home/backup/horsehead
#share on cent
#sudo sshfs -o reconnect,nonempty,allow_other,idmap=user,uid=0,gid=0,cache=no,noauto_cache,entry_timeout=0,IdentityFile=/home/kradsmit/.ssh/id_rsa kradsmit@cent:/home/backup/cent /home/backup/cent

if [ "$answer" = "2" ]; then
    ### detach
    echo "detaching  ant"
    sudo umount /home/backup/ant
    # share on horsehead
    echo "detaching horsehead"
    sudo umount /home/backup/horsehead
    #share on cent
    echo "detaching cent"
    sudo umount /home/backup/cent
    ls -h /home/backup/*
fi 
