# Inception


This project consists in having you set up a small infrastructure composed of different services under specific rules. The whole project has to be done in a virtual machine. You have to use docker-compose.

You then have to set up:
```
• A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
• A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
• A Docker container that contains MariaDB only without nginx.
• A volume that contains your WordPress database.
• A second volume that contains your WordPress website files.
• A docker-network that establishes the connection between your containers.
```
<img width="548" alt="Screen Shot 2022-08-11 at 11 21 17 PM" src="https://user-images.githubusercontent.com/51509223/184244443-058a65a6-5f70-4dbe-92b1-cf9619e0728c.png">


Bonus list:
```
• Set up redis cache for your WordPress website in order to properly manage the cache.
• Set up a FTP server container pointing to the volume of your WordPress website.
• Create a simple static website in the language of your choice except PHP (Yes, PHP
is excluded!). For example, a showcase site or a site for presenting your resume.
• Set up Adminer.
• Guarana
```
