# Install Samba on Ubuntu 20.04 
### Table of contents

[I. Introducton](#modau)

[II. Getting Start](#batdau)
- [1. Step 1](#step1)
- [2. Step 2](#step2)
- [3. Step 3](#step3)
- [4. Step 4](#step4)
- [5. Step 5](#step5)
- [6. Step 6](#step6)
- [7. Step 7](#step7)

[III. Summary](#Tongket)

===========================

<a name="Modau"></a>
## I. Introduction
This brief tutorial shows students and new users how to install and configure Samba on Ubuntu 20.04 | 18.04.
Samba is an open source implementation of SMB/CIFS protocol that allows users to access shared files printers and other network resources.
Samba enables Linux systems, including Ubuntu to share files with Windows systems, including Windows 10 and other operating systems.
For this tutorial to work, you may want to configure both the Windows and Ubuntu machines on the same subnet. This means they should be able to communicate over the network.
For this tutorial, we’re going to be using a 192.168.255.0/24 network.
The Windows machine will have IP address 192.168.1.2 and the Linux machine 192.168.1.3
Both machine will also be in the same local workgroup. You can name the workgroup whatever you want, but for this post, our workgroup will be the default Windows workgroup called WORKGROUP.

Windows IP address =========================> 192.168.255.135
Ubuntu IP address ==========================> 192.168.255.201
Workgroup Name ===========================> WORKGROUP

Both the Windows and Ubuntu machines will be member of the local domain or workgroup called WORKGROUP.
<a name="batdau"></a>
## II. Getting Start:

<a name="step1"></a>
## Step 1: Identify Windows Workgroup
To find out which Workgroup Windows machine belongs, open the command prompts and type the commands below

net config workstation

When you run the commands above, you should see your current Workstation domain name for the computer, usually called WORKGROUP.

<a name="step2"></a>
## Step 2: Add Ubuntu to Windows Host File.
If you don’t have a DNS system in place and you want to reference each system by their names, you’ll want to add their names in the local host file on each machine..

For Windows system, open the commands prompt as administrator and run the commands below.

> notepad C:\\Windows\System32\drivers\etc\hosts

Then add the local entry for the Ubuntu machine to be referenced by the named ubuntu16.04

> 192.168.1.3            ubuntu2004.localhost           ubuntu2004

Save your changes and you’re done.

To add Windows system name to Ubuntu host file, press Ctrl + Alt + T on your keyboard to open the command terminal.

Then run the commands below:

> $ sudo nano /etc/hosts

Next, type the IP with hostname for Windows machine, save the file and exit.

<a name="step3"></a>
## STEP 3: Enable File Sharing
To make file sharing possible, that feature must be enabled on Windows systems. To enable it, run the commands prompt as administrator and run the commands below

Then run the commands below to enable filesharing and network discovery.

> $ sudo netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes

> $ sudo netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes

File sharing should be enabled on Windows machine after running the commands above.

<a name="step4"></a>
## Step 4: Install Samba on Ubuntu
At this point, Windows and Ubuntu systems should be member of the same workgroup and both systems have entries in their local host file to reference the other by name.

Next, logon on to the Ubuntu machine to install Samba. To install Samba, run the commands below.

> $ sudo apt update
> $ sudo apt install samba

After installing Samba, go and config Samba.

To verify if Samba services are running, run the commands below:

> $ sudo systemctl status smbd

It should output similar lines as below:
``` sh
mbd.service - Samba SMB Daemon
     Loaded: loaded (/lib/systemd/system/smbd.service; enabled; vendor preset: >
     Active: active (running) since Wed 2020-05-06 18:23:55 CDT; 4min 27s ago
       Docs: man:smbd(8)
             man:samba(7)
             man:smb.conf(5)
    Process: 2026 ExecStartPre=/usr/share/samba/update-apparmor-samba-profile (>
   Main PID: 2039 (smbd)
     Status: "smbd: ready to serve connections..."
      Tasks: 4 (limit: 4657)
     Memory: 14.9M
     CGroup: /system.slice/smbd.service
             ├─2039 /usr/sbin/smbd --foreground --no-process-group
```
<a name="step5"></a>
## Step 5: Configure Samba Public share
Now that Samba is installed, run the commands below to backup its default configuration file.
> $ sudo cp /etc/samba/smb.conf{,.backup}

Next, open Samba configuration file by running the commands below.
> $ sudo nano /etc/samba/smb.conf

Then make sure you setup the highlighted lines to match the ones below.
``` sh
======================= Global Settings =======================
[global]
## Browsing/Identification ###
# Change this to the workgroup/NT-domain name your Samba server will part of
   workgroup = WORKGROUP
   netbios name = htuserver
   security = user
   proxy = no
   map to guest = bad user
#### Networking ####
# The specific set of interfaces / networks to bind to
# This can be either the interface name or an IP address/netmask;
# interface names are normally preferred
   interfaces = 127.0.0.0/8 ens33

# Only bind to the named interfaces and/or networks; you must use the
# 'interfaces' option above to use this.
bind interfaces only = yes

#Most people will want "standalone server" or "member server".
#Running as "active directory domain controller" will require first

server role = standalone server
obey pam restrictions = yes

#This boolean parameter controls whether Samba attempts to sync the Unix
[public]
   path = /samba/public
   browseable = yes
   guest ok = yes
   guest only = yes
   read only = no
   force user = nobody
   force create mode = 0777
   force directory mode = 0777
```
Once done, save your changes. Then run the testparm utility to check the Samba configuration file for errors.

- Restart Samba services.
> $ sudo systemctl restart smbd

<a name="step6"></a>
## Step 6: Create the public folder
Next, create the public folder where everyone should have access to as defined in Samba configuration above…
> sudo mkdir -p /samba/public

Set the permissions so that everyone can read and write to it.
> $ sudo chown -R nobody:nogroup /samba/public

> $ sudo chmod -R 0775 /samba/public

> $ sudo chgrp sambashare /samba/public

Restart Samba and open Windows File Explorer to view the shared location on Ubuntu
> $ sudo systemctl restart smbd

> $ sudo systemctl restart nmbd

Now go to your Windows machine and you should see the shared public folder on Ubuntu from when you browse File Manager as shown below.
Everyone should have access there.
<a name="step7"></a>
## Step 7: Configure Samba Private Share
Now you know how to create Samba public shares, let’s go and create private and protected shares. Only users that are member of the approved group will be able to access the secure location with passwords.

First create a samba group called smbgroup for the share.. only members will have access. To create a groups in Ubuntu, run the commands below.

- Create group:

> $ sudo groupadd AdminTeam
> $ sudo groupadd TechTeam
> $ sudo groupadd SaleTeam
> $ cat /etc/group

- Add user:

> $ sudo useradd -s /usr/sbin/nologin admin1
> $ sudo useradd -s /usr/sbin/nologin tech1
> $ sudo useradd -s /usr/sbin/nologin tech2
> $ sudo useradd -s /usr/sbin/nologin saler1
> $ sudo useradd -s /usr/sbin/nologin saler2

- Add user to Group:

> $ sudo usermod -aG AdminTeam,TechTeam,SaleTeam admin1
> $ sudo usermod -aG TechTeam tech1
> $ sudo usermod -aG TechTeam tech2
> $ sudo usermod -aG SaleTeam saler1
> $ sudo usermod -aG SaleTeam saler2

- Finally, all users who need to access a protected samba share will need to type a password. To add a user to samba password database, run the commands below for each user:
The user will be prompted to enter and confirm a password. This password will be used to access the protected samba shares.

> $ sudo smbpasswd -a admin01
> $ sudo smbpasswd -e admin01

> $ sudo smbpasswd -a tech01
> $ sudo smbpasswd -e tech01

> $ sudo smbpasswd -a saler01
> $ sudo smbpasswd -e saler02

- Show user and group:

> $ sudo cat /etc/password
> $ sudo cat /et/group

- Next, go and create Admin, Techical, Sale folder share in the /data directory.

> $ sudo mkdir -p /data/Admin
> $ sudo mkdir -p /data/Tecnical
> $ sudo mkdir -p /data/Sale

- Then give only root and members group access to this share.

> $ sudo cd /data/
> $ sudo chown -R root:AdminTeam Admin
> $ sudo chmod -R 2770 Admin

> $ sudo chown -R root:TechTeam Tecnical
> $ sudo chmod -R 2770 Tecnical

> $ sudo chown -R root:saleTeam Sale
> $ sudo chmod -R 2770 Sale

- When you’re done creating the folder share, go and share it in the smb.conf file.

> $ sudo nano /etc/samba/smb.conf

Then add configuration block below into smb.conf file just below the one above
``` sh
[Admin]
    comment = Everyone in the AdminTeam
    path = /data/Admin
    browseable = yes
    read only = no
    force create mode = 0660
    force directory mode = 2770
    valid users = @AdminTeam

[Technical]
    comment = Everyone in the TechTeam and admin1
    path = /data/Technical
    browseable = yes
    read only = no
    force create mode = 0660
    force directory mode = 2770
    valid users = @TechTeam

[Sale]
    comment = Everyone in the SaleTeam and admin1
    path = /data/Sale
    browseable = yes
    read only = no
    force create mode = 0660
    force directory mode = 2770
    valid users = @SaleTeam

[Accountant]
	comment = Everyon in the AccTeam full and admin1 only read
	path = /data/Accountant
	browseable = yes
	read only = yes
	force create mode = 0665
    force directory mode = 2775
	valid users = @AccTeam @AdminTeam
	write list = @AccTeam

```
Save your changes and you’re done.

Restart Samba and test your changes.
> $ sudo systemctl restart smbd
> $ sudo systemctl restart nmbd

You should now see two folders… one is protected

Many more shares can be defined using the format above.

Only member of the smbgroup will be able to access the Protected area…

You could map the drive in Windows for easy access….

That’s it!
<a name="tongket"></a>
## III. Summary:
This post showed you how to install Samba on Ubuntu to allow file sharing. If you find any error above, please use the comment form below to report.

Watch Video here: 

- [How to Install and configure Samba on Ubuntu 20.04 Part 1:  Public folder](https://youtu.be/2o5zgA8ml38)
- [How to configure and Install Samba on Ubuntu 20.04 Part2: Private Share](https://youtu.be/6s9ZEp3xS94)

Contact me:
- Email: manhhungbl@gmail.com
- Skype: spyerx3
- Youtube Channel: youtube.com/howtoused

Thank you very much!
