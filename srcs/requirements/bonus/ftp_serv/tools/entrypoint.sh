conf_file="/etc/vsftpd/vsftpd.conf"

grep -E "local_root=" $conf_file > /dev/null 2>&1
if [ $? -eq 0 ]; then
	# add User and change his password. Declare him as owner of worpress
	# volume
	adduser $FTP_USER --disabled-password
	echo "$FTP_USER:$FTP_PWD" | chpasswd &> /dev/null

	chgrp -R $FTP_USER $FTP_ROOT
	chown -R $FTP_USER: $FTP_ROOT
	chmod -R u+w $FTP_ROOT
	echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null

	echo "" >> $conf_file
	echo "local_root=$FTP_ROOT" >> $conf_file
fi

/usr/sbin/vsftpd $conf_file
