
## Add AD Domain user to sudoers on Ubuntu 20.04

- On local admin user:
- First check aduser using command id
$ id <AD user>( #id domain\\aduser01 )

- Edit /etc/sudoers: with the following entries
$ sudo nano /etc/sudoer

- Add The group domain admins allow run sudo translate to the following line in /etc/sudoer
%domain\ admins ALL=(ALL:ALL) ALL

- Add The group domain users allow run sudo:
