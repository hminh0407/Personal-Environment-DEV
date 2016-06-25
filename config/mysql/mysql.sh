##############################################
#########  MYSQL & PHP-MYADMIN
##############################################
DBPASSWD=

if ! command -v mysql >/dev/null 2>&1; then
    echo "INSTALL MYSQL."
    echo "Using debconf-utils to auto fill the command prompt for Mysql & phpmyadmin setup"
    echo "mysql-server mysql-server/root_password password $DBPASSWD" | debconf-set-selections
	echo "mysql-server mysql-server/root_password_again password $DBPASSWD" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/app-password-confirm password $DBPASSWD" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/mysql/admin-pass password $DBPASSWD" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/mysql/app-pass password $DBPASSWD" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | debconf-set-selections
    apt-get -y install mysql-server-5.5 phpmyadmin
fi