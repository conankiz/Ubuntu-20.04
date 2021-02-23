## Join an Ubuntu Desktop 20.04 to Active Directory domain
### Table of contents

[I. Introducton](#modau)

[II. Getting Start](#batdau)
- [1. Step 1: set hostname](#step1)
- [2. Step 2: Confirm DNS ia configured correctly](#step2)
- [3. Step 3](#step3)
- [4. Step 4](#step4)
- [5. Step 5](#step5)
- [6. Step 6](#step6)
- [7. Step 7](#step7)

[III. Summary](#Tongket)

===========================

<a name="Modau"></a>
## I. Introduction

<a name="batdau"></a>
## II. Getting Start:

<a name="step1"></a>
## Step 1: Set hostname
 An important aspect of your machine represents the hostname. Setup a proper machine name before joining the domain with the help of hostnamectl command or by manually editing /etc/hostname file.
```
$ sudo vi /etc/hostname
```
<img src="https://i.imgur.com/ht8PsTt.png">

<a name="step2"></a>
## Step 2: Update system and install fping
```
$ sudo apt update
$ sudo apt-get install fping
$ sudo reboot
```
<a name="step3"></a>
## Step 3: - Check your Ubuntu Desktop machine has access to the Active Directory domain controller,  run the following command :
```
$ dig -t SRV _ldap._tcp.htu.local | grep -A2 "ANSWER SECTION"
```
```
;; ANSWER SECTION:
_ldap._tcp.htu.local. 900 IN SRV 0 100 389 dc1.htu.local.
```
<a name="step4"></a>
## Step 4: Ping Active Directory domain Domain Controllers:
```
$ ping htu.local
$ ping dc1.htu.local
```
also
```
$ fping dc1.htu.local
dc1.htu.local is alive
```
<a name="step5"></a>
## Step 5: Install all necessary packages:

```
$ sudo apt-get -y install realmd sssd sssd-tools samba-common krb5-user packagekit samba-common-bin samba-libs adcli ntp
```
after ask type local domain :TEST.LAB
then OK

<img src="https://i.imgur.com/jDHPVft.png">

<a name="step6"></a>
## Step 6: Config your NTP service to point to your domain nameservers, run the following command 

```
$ sudo vi /etc/ntp.conf
```
Add a new line:

pdc.test.lab

- Restart your ntp service:
```
$ sudo systemctl restart ntp
```
<a name="step7"></a>
## Step 7: Setting up realmd:
```
$ sudo vi /etc/realmd.conf
```
```
[users]
default-home = /home/%D/%U
default-shell = /bin/bash
[active-directory]
default-client = sssd
os-name = Ubuntu Desktop Linux
os-version = 14.04
[service]
automatic-install = no
[htu.local]
fully-qualified-names = no
automatic-id-mapping = yes
user-principal = yes
manage-system = no
```
<a name="step8"></a>
## Step 8: Join the Ubuntu machine on the AD domain:
```
$ sudo kinit administrator@HTU.LOCAL
```
<a name="step9"></a>
## Step 9: Add the Ubuntu machine in the domain:
```
$ sudo realm --verbose join htu.local \
--user-principal=ubuntu02/administrator@HTU.LOCAL --unattended
```
<img src="https://i.imgur.com/1u42Byu.png">

<a name="step10"></a>
## Step 10:Config sssd

```
$ sudo vi /etc/sssd/sssd.conf
```
Modify the: access_provider = simple 
to
access_provider = ad
<img src="https://i.imgur.com/JWh6jrh.png">
- Restart the sssd service:
```
$ sudo service sssd restart
```
<a name="step11"></a>
## Step 11:  Config homedir auto-creation for new users

```
$ sudo vi /etc/pam.d/common-session
```
Insert : 
```
session required pam_unix.so
session optional pam_winbind.so
session optional pam_sss.so
session optional pam_systemd.so
session required pam_mkhomedir.so skel=/etc/skel/ umask=0077
```
<img src="https://i.imgur.com/Gfc5ZQv.png">

<a name="step12"></a>
## Step 12: Check Active Directory users name resolution
```
$ id domainuser
```
<img src="https://i.imgur.com/6nfInqy.png">
<a name="step13"></a>
## Step 13:  Reboot ubuntu desktop and Login with domain user:

<a name="tongket"></a>
## III. Summary:

Watch Video here: 

- [How to Install and configure Samba on Ubuntu 20.04 Part 1:  Public folder](https://youtu.be/2o5zgA8ml38)
- [How to configure and Install Samba on Ubuntu 20.04 Part2: Private Share](https://youtu.be/6s9ZEp3xS94)

**Contact me:**
- Email: manhhungbl@gmail.com
- Skype: spyerx3
- Youtube Channel: youtube.com/howtoused

Thank you very much!
