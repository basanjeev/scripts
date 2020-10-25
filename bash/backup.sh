#!/bin/bash
killall -9 rsync
rsync -arlvptg --exclude-from='/home/sanjeev/bin/exclude.txt' /home/sanjeev/source /media/sanjeev/SAMSUNG/Documents/ > /home/sanjeev/rsync.log 2>&1
echo "Finished sources"
rsync -arlvptg --exclude-from='/home/sanjeev/bin/exclude.txt' /home/sanjeev/bin /media/sanjeev/SAMSUNG/Documents/ >> /home/sanjeev/rsync.log 2>&1
echo "Finished bin"
rsync -arlvptg  /home/sanjeev/Pictures /media/sanjeev/SAMSUNG/ >> /home/sanjeev/rsync.log 2>&1
echo "Finished Pictures"
rsync -arlvptg  /home/sanjeev/Documents /media/sanjeev/SAMSUNG/ >> /home/sanjeev/rsync.log 2>&1
echo "Finished Documents"
rsync -arlvptg  /home/sanjeev/Videos /media/sanjeev/SAMSUNG/Videos/Personal/ >> /home/sanjeev/rsync.log 2>&1
echo "Finished Videos"
rsync -arlvptg  /home/sanjeev/.thunderbird /media/sanjeev/SAMSUNG/Documents/Emails >> /home/sanjeev/rsync.log 2>&1
echo "Finished emails"
rsync -arlvptg --exclude-from='/home/sanjeev/bin/winexclude.txt' /media/sanjeev/7ABA4BACBA4B63AB/Users/sanjeev/ /media/sanjeev/SAMSUNG/Windows >> /home/sanjeev/rsync.log 2>&1
echo "Finished Windows"
rsync -arlvptg  /home/sanjeev/Documents /media/sanjeev/7ABA4BACBA4B63AB/Users/sanjeev/ >> /home/sanjeev/rsync.log 2>&1
echo "Finished Documents Sync"

echo "Backup completed at `date +%F-%X-%Z`" >> /home/sanjeev/rsync.log
