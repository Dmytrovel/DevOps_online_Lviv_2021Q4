

##### 1) Analyze the structure of the /etc/passwd and /etc/group file, what fields are
##### present in it, what users exist on the system? Specify several pseudo-users, how to define them?
##### passwd
##### mark:x:1001:1001:mark,,,:/home/mark:/bin/bash
##### [--] - [--] [--] [-----] [--------] [--------]
##### |    |   |    |     |         |        |
##### |    |   |    |     |         |        +-> 7. Login shell
##### |    |   |    |     |         +----------> 6. Home directory
##### |    |   |    |     +--------------------> 5. GECOS
##### |    |   |    +--------------------------> 4. GID
##### |    |   +-------------------------------> 3. UID
##### |    +-----------------------------------> 2. Password
##### +----------------------------------------> 1. Username
## group
##### u2:x:1009:ubuntu
##### 1   2   3   4 
##### 1 name 2 password 3 gid 4 members
##### Specify several pseudo-users?
![alt text](/m1/task5.2/screenshots/1.png) 

##### 2) What are the uid ranges?
##### Min max unique user id
## UID 1000 + are used for user accounts. 128 bit field
.
##### What is UID ?
## unique unique digital number
##### How to define it?
## cat /etc/password

##### 3) What is GID? How to define it?
## unique unique digital number of linux group id
## cat /etc/group

##### 4) How to determine belonging of user to the specific group?
## id user1
## groups user1

##### 5) What are the commands for adding a user to the system? 
## useradd and interacted command adduser 
##### What are the basic parameters required to create a user?
## password, name

##### 6) How do I change the name (account name) of an existing user?
## usermod -l new_username user

##### 7) What is skell_dir? What is its structure?
## The /etc/skel directory contains files and directories that are automatically copied over to a new user's home directory
![alt text](/m1/task5.2/screenshots/skell.png) 
##### 8) How to remove a user from the system (including his mailbox)?
## userdel -r user2

##### 9) What commands and keys should be used to lock and unlock a user account?
## usermod -L -e 1 user2
## usermod -U -e 23:12:30  user2

##### 10) How to remove a user's password and provide him with a password-free
## login for subsequent password change?
## passwd -d n1

##### 11) Display the extended format of information about the directory, tell about
##### the information columns displayed on the terminal.

##### -rw-r--r-- 1 ubuntu ubuntu 3771 Feb 25  2020 .bashrc
##### drwx------ 2 ubuntu ubuntu 4096 Dec  6 12:02 .cache/
##### 1 2  3  4  5	6      7     8    9  10  11    12
##### 1) type:file directori, link ,evice ...
##### 2) user premission
##### 3) group permission
##### 4) other permission
##### 5) Link count
##### 6)owner of file
##### 7)group 
##### 8)file size
##### 9)date
##### 12)file or directory 

##### 12)What access rights exist and for whom (i. e., describe the main roles)?
##### Briefly describe the acronym for access rights.
## reade write execute for owner group other
## rwx-rwx-rwx
## owner group other 

##### 13) What is the sequence of defining the relationship between the file and the user?
## first check is file owner of file after chehk group of file, and check if user exist at what group

##### 14) What commands are used to change the owner of a file (directory), as well
##### as the mode of access to the file? Give examples, demonstrate on the terminal.
## chown
![alt text](/m1/task5.2/screenshots/3-------------14.png) 
##### 15) What is an example of octal representation of access rights? Describe the umask command.
## umask used assign the default file permission
## decimal r=4 w=2 x=1 chmod 421 same chmod u+rw-x,g+w-xr,o+x-wr 

##### 16) Give definitions of sticky bits and mechanism of identifier substitution. 
## A Sticky bit is a permission bit that is set on a file or a directory that lets only the owner of the file/directory or the root user to delete or rename the file
##### Give an example of files and directories with these attributes
![alt text](/m1/task5.2/screenshots/4------16.png) 

##### 7) What file attributes should be present in the command script?
## Shebang
#!/bin/bash - path to bash interpreter or #/bin/python or other


