## How to Install Xrdp Server (Remote Desktop) on Ubuntu 20.04
### Table of contents

[I. Introducton](#modau)

[II. Getting Start](#batdau)
- [1. Step 1: Installing Xrdp](#step1)
- [2. Step 2: Xrdp Configuration](#step2)
- [3. Step 3: Configuring Firewall ](#step3)
- [4. Step 4: Connecting to the Xrdp Server](#step4)

[III. Summary](#Tongket)

===========================

<a name="Modau"></a>
## I. Introduction
Xrdp is an open-source implementation of the Microsoft Remote Desktop Protocol (RDP) that allows you to graphically control a remote system. With RDP, you can log in to the remote machine and create a real desktop session the same as if you had logged in to a local machine.
<a name="batdau"></a>
## II. Getting Start:

<a name="step1"></a>
## Step 1: Installing Xrdp
- Xrdp is incuded in the default Ubuntu repositories. To install it, run:
> $ sudo apt install xrdp 

- By default Xrdp uses the /etc/ssl/private/ssl-cert-snakeoil.key file that is readable only by members of the “ssl-cert” group. Run the following command to add the xrdp user to the group :
> $ sudo adduser xrdp ssl-cert

- Restart the Xrdp service for changes to take effect:
> $ sudo systemctl restart xrdp

- Once the installation is complete, the Xrdp service will automatically start. You can verify it by typing:
> $ sudo systemctl status xrdp

<a name="step2"></a>
## Step 2: Xrdp Configuration

- The Xrdp configuration files are located in the /etc/xrdp directory. For basic Xrdp connections, you do not need to make any changes to the configuration files.
- Xrdp uses the default X Window desktop environment (Gnome or XFCE).
- The main configuration file is named xrdp.ini . This file is divided into sections and allows you to set global configuration settings such as security and listening addresses and create different xrdp login sessions.
- Whenever you make any changes to the configuration file, you need to restart the Xrdp service.
- Xrdp uses startwm.sh file to launch the X session. If you want to use another X Window desktop, edit this file.

<a name="step3"></a>
## Step 3: Configuring Firewall 
- The Xrdp daemon listens on port 3389 on all interfaces. If you run a firewall on your Ubuntu server , you’ll need to open the Xrdp port.

- To allow access to the Xrdp server from a specific IP address or IP range, for example, 192.168.255.0/24, you would run the following command:
> $ sudo ufw allow from 192.168.33.0/24 to any port 3389

- If you want to allow access from anywhere (which is highly discouraged for security reasons), run:
> $ sudo ufw allow 3389

<a name="step4"></a>
## Step 4: Connecting to the Xrdp Server
- Now that you have set up your Xrdp server, it is time to open your Xrdp client and connect to the server.
- If you have a Windows PC, you can use the default RDP client. Type “remote” in the Windows search bar and click on “Remote Desktop Connection”. This will open up the RDP client. In the “Computer” field, enter the remote server IP address and click “Connect”
- On the login screen, enter your username and password and click “OK”.
- Once logged in, you should see the default Gnome or Xfce desktop. It should look something like this:
- You can now start interacting with the remote desktop from your local machine using your keyboard and mouse.
- If you are running macOS, you can install the Microsoft Remote Desktop application from the Mac App Store. Linux users can use an RDP client such as Remmina or Vinagre.

<a name="tongket"></a>
## III. Summary:

Watch Video here: 

- [How to Install and configure Samba on Ubuntu 20.04 Part 1:  Public folder](https://youtu.be/2o5zgA8ml38)
- [How to configure and Install Samba on Ubuntu 20.04 Part2: Private Share](https://youtu.be/6s9ZEp3xS94)

Contact me:
- Email: manhhungbl@gmail.com
- Skype: spyerx3
- Youtube Channel: youtube.com/howtoused

Thank you very much!
