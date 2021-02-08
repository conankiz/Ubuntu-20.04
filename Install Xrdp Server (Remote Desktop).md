## How to Install Xrdp Server (Remote Desktop) on Ubuntu 20.04
### Table of contents

[I. Introducton](#modau)

[II. Getting Start](#batdau)
- [1. Step 1: Installing Xrdp](#step1)
- [2. Step 2: Xrdp Configuration](#step2)
- [3. Step 3: Configuring Firewall ](#step3)
- [4. Step 4](#step4)
- [5. Step 5](#step5)
- [6. Step 6](#step6)
- [7. Step 7](#step7)

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

<a name="step3"></a>
## Step 3: Configuring Firewall 

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
