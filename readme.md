WPchangePath
============

If you're using wordpress CMS for a while, you are perfectly used to the default admin URL :
- http://www.mysite.com/wp-admin/

which can also be accessed via :
- http://www.mysite.com/wp-login.php

Most of the time, in order to compromise a WORDPRESS website, the bad guy has to access the wp-admin management console.

The purpose of this script is "Security through obscurity". The idea is to change the default admin URL so that you'll be protected from transversal attacks.

It will not protect you from dictionary attacks so try to avoid such names as : ``admin``, ``management`` ...

Instead, try to chose better names like : ``My_Site_Adm``

Obviously, it won't protect you from bruteforce attacks but those kind of attacks can be easily blocked by specific tools (ie:fail2ban)

In order to get it work, simply customize the two variables in the scripts to match your configuration :

    newname="mypersonaladminplace" # new admin path
    wpath="/var/www/wordpress" # wordpress location
