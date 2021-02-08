## Advanced Disk Shares
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

<a name="batdau"></a>
## II. Getting Start:

<a name="step1"></a>
## Step 1:

<a name="step2"></a>
## Step 2:


** Hiding and Vetoing Files
- Hiding file (ẩn file có đuôi .java)
```bash
[data]
    hide files = /*.java/*README*/
```
- Vetoing (Ngăn chặn chép file có đuôi quy định)
[data]
    veto files = /*.java/*README*/
    delete veto files = yes       # cho phep xoa

- Creation Masks
create mask to have an effect. For example:
```bash
[homes]
    create mask = 664
```
This is equivalent to a Unix umask of 113. If the user creates the Wordpad document as before, it will show up as:
```bash
$ ls -l file.doc
-rw-rw-r--    1 jay      jay             0 Sep 22 16:38 file.doc
```

- The directory mask option works similarly, masking permissions for newly created directories. The following example will allow the permissions of a newly created directory to be, at most, 755:

[data]
    directory mask = 755
- In the same spirit, if you wish to set explicitly the Unix user and group attributes of a file created on the Windows side, you can use the force user and force group options. For example:
```bash
[data]
    create mask = 744
    directory mask = 755
    force user = joe
    force group = accounting
```
- delete a read-only file from a writable directory (delete file read only trong folder write
```bash
[data]
    delete readonly = yes
```
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
