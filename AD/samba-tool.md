
# Samba-tool

## User Management

```
$ samba user -h
```
Available subcommands:

  add            - Create a new user.
  create         - Create a new user.
  delete         - Delete a user.
  disable        - Disable a user.
  edit           - Modify User AD object.
  enable         - Enable a user.
  getpassword    - Get the password fields of a user/computer account.
  list           - List all users.
  move           - Move a user to an organizational unit/container.
  password       - Change password for a user account (the one provided in authentication).
  sensitive      - Set/unset or show UF_NOT_DELEGATED for an account.
  setexpiry      - Set the expiration of a user account.
  setpassword    - Set or reset the password of a user account.
  show           - Display a user AD object.
  syncpasswords  - Sync the password of user accounts.

- List all samba AD domain user:
```
$ sudo samba-tool user list
```
- Create a user on AD:
```
$ sudo samba-tool user add your_domain_user --given-name=your_name --surname=your_username --mail-address=your_domain_user@tecmint.lan --login-shell=/bin/bash
```
```
$ sudo samba-tool user create ceo01 abc@123 --given-name="ceo" --surname=01 --userou='ou=CEO,ou=HTUGROUPS'
```
- Delete a samba AD domain user:
```
$ sudo samba-tool delete your_domain_user
```
- Reset a samba domain user password:
```
$ sudo samba-tool user setpassword your_domain_user
```
- In order to disable or enable an samba AD User account:
```
$ sudo samba-tool user disable your_domain_user
$ sudo samba-tool user enable your_domain_user
```
##  Group Management 

- List all samba group:
```
$ sudo samba-tool group list
```
- To list all the samba domain members:
```
$ sudo samba-tool group listmembers "groupname"
```
- Add group:
```
$ sudo samba-tool group add your_domain_group
$ sudo samba-tool group add Gsale --groupou='ou=SALE,ou=TEST'
```
- Delete a samba domain group:
```
$ sudo samba-tool group delete your_domain_group
```
- Adding/Removing a member from a samba domain group:
```
$ sudo samba-tool group addmembers your_domain_group your_domain_user
$ sudo samba-tool group remove members your_domain_group your_domain_user
```
Examples:
```
$ sudo samba-tool group addmembers Gceo ceo01 
$ sudo samba-tool group addmembers Gceo ceo02,ceo03
```
- To review your samba domain password settings:
```
$ sudo samba-tool domain passwordsettings show
$ sudo samba-tool domain passwordsettings set --complexity=off
$ sudo samba-tool domain passwordsettings set --history-length=0
$ sudo samba-tool domain passwordsettings set --min-pwd-age=0
$ sudo samba-tool domain passwordsettings set --max-pwd-age=0
```
## Organizational Units (OU) management

```
$ samba-tool ou -h
```
---
  create       - Create an organizational unit.
  delete       - Delete an organizational unit.
  list         - List all organizational units.
  listobjects  - List all objects in an organizational unit.
  move         - Move an organizational unit.
  rename       - Rename an organizational unit.
---
Examples:
```
$ sudo samba-tool ou create 'ou=HTUGROUPS,dc=htu,dc=local'
$ sudo samba-tool ou create 'ou=ADMINS,ou=HTUGROUPS,dc=htu,dc=local'
$ sudo samba-tool ou create 'OU=SubOU,OU=OrgUnit,DC=samdom,DC=example,DC=com'
```
- Review your samba domain password settings use the below command:
```
$ sudo samba-tool domain passwordsettings show
```
- Modify samba domain password policy, such as the password complexity level, password ageing, length, how many old password to remember and other security features required for a Domain Controller use the below screenshot as a guide.
```
$ sudo samba-tool domain passwordsettings -h 

$ sudo samba-tool domain passwordsettings set --complexity=off
$ sudo samba-tool domain passwordsettings set --history-length=0
$ sudo samba-tool domain passwordsettings set --min-pwd-age=0
$ sudo samba-tool domain passwordsettings set --max-pwd-age=0
$ sudo samba-tool domain passwordsettings set --min-pwd-length=4
$ sudo samba-tool domain passwordsettings show
```
## Computer manager
$ sudo samba-tool computer
Available subcommands:
  create  - Create a new computer.
  delete  - Delete a computer.
  edit    - Modify Computer AD object.
  list    - List all computers.
  move    - Move a computer to an organizational unit/container.
  show    - Display a computer AD object.
- List all computer:
```
$ sudo samba-tool computer list
```
- Delete a computer
```
$ sudo samba-tool computer delete UBUNTU01$
```
=========
ldbsearch -H ldap://127.0.0.1 -s base -b "" defaultNamingContext

==== EDIT A USER DOMAIN =====
1. run command
samba-tool user edit username
2. press i to insert 
scriptPath: liendtx.bat

3. :w

=================
1. change pass at next login
samba-tool user setpassword test --newpassword=abc@123 --must-change-at-next-login

2. set pass
samba-tool user setpassword TestUser1 --newpassword=passw0rd

## ==== GPO =====
- 1. sysvol reset
samba-tool ntacl sysvolreset

- 2. list all GPO:
 $ samba-tool gpo listall
sysvol reset

- 3. show gpo
samba-tool gpo show {378788FB-807A-4C77-98DB-6E18BAFBE875}

- 4. gpo listcontainers
samba-tool gpo listcontainers 378788FB-807A-4C77-98DB-6E18BAFBE87


## == LDBSEARCH ===

- 1. list all Computer:
$ ldbsearch -a -H /usr/local/samba/private/sam.ldb 'dNSHostName=*' | grep dNSHostName


############
#### EX ####

homeDrive: O:
homeDirectory: \\192.168.11.250\users\myttt
scriptPath: myttt.bat

