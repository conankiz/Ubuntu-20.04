** Hiding and Vetoing Files
- Hiding file (ẩn file có đuôi .java)
[data]
    hide files = /*.java/*README*/

- Vetoing (Ngăn chặn chép file có đuôi quy định)
[data]
    veto files = /*.java/*README*/
    delete veto files = yes       # cho phep xoa

- Creation Masks
create mask to have an effect. For example:

[homes]
    create mask = 664
This is equivalent to a Unix umask of 113. If the user creates the Wordpad document as before, it will show up as:

$ ls -l file.doc
-rw-rw-r--    1 jay      jay             0 Sep 22 16:38 file.doc

- The directory mask option works similarly, masking permissions for newly created directories. The following example will allow the permissions of a newly created directory to be, at most, 755:

[data]
    directory mask = 755
- In the same spirit, if you wish to set explicitly the Unix user and group attributes of a file created on the Windows side, you can use the force user and force group options. For example:

[data]
    create mask = 744
    directory mask = 755
    force user = joe
    force group = accounting
- delete a read-only file from a writable directory (delete file read only trong folder write
----
[data]
    delete readonly = yes
---
