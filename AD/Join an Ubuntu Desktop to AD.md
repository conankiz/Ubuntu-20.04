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
$ ping test.lab
$ ping pdc.test.lab
```
also
```
$ fping pdc.test.lab
pdc.test.lab is alive
```
<a name="step5"></a>
## Step 5: Install all necessary packages:
```
$ sudo apt-get -y install realmd sssd sssd-tools samba-common krb5-user packagekit samba-common-bin samba-libs adcli ntp
```
<img src="https://i.imgur.com/jDHPVft.png">
<a name="step6"></a>
## Step 6:
<a name="step7"></a>
## Step 7:
<a name="step8"></a>
## Step 8:
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
