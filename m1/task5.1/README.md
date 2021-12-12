## passwd change file /etc/shadow 
![alt text](/m1/task5.1/screenshots/1.png) 
## Determine the users registered in the system 
![alt text](/m1/task5.1/screenshots/2.png)
## 4) Change personal information about yourself.
![alt text](/m1/task5.1/screenshots/3.png)
##### 5) Become familiar with the Linux help system and the man and info commands.
##### Get help on the previously discussed commands, define and describe any two
##### keys for these commands. Give examples.

##  man w
![alt text](/m1/task5.1/screenshots/man.png)
##  who -a list all information
![alt text](/m1/task5.1/screenshots/who-a.png)
#####  6) Explore the more and less commands using the help system. View the contents of files .bash* using commands.
![alt text](/m1/task5.1/screenshots/654.png)
##### 7) * Describe in plans that you are working on laboratory work 1. Tip: You should
##### read the documentation for the finger command.
##### tips that  i am usent doble tap
![alt text](/m1/task5.1/screenshots/tips.png)
##### 8) * List the contents of the home directory using the ls command, define its files
##### and directories. Hint: Use the help system to familiarize yourself with the ls command
![alt text](/m1/task5.1/screenshots/d.png)
## - FIrst colum
## - = file
## d = directory
##### 1) Examine the tree command. Master the technique of applying a template, for
##### example, display all files that contain a character c, or files that contain a
##### specific sequence of characters. List subdirectories of the root directory up to
##### and including the second nesting level.
##### loking for character "bash"
![alt text](/m1/task5.1/screenshots/treebash.png)

# 2) What command can be used to determine the type of file (for example, text or
# binary)? Give an example.
![alt text](/m1/task5.1/screenshots/11file.png)

##### 3) Master the skills of navigating the file system using relative and absolute paths.
##### How can you go back to your home directory from anywhere in the filesystem?
![alt text](/m1/task5.1/screenshots/12absolute.png)

##### 4) Become familiar with the various options for the ls command. Give examples
##### of listing directories using different keys. Explain the information displayed on
##### the terminal using the -l and -a switches

## ls -l = long format -a = list hiden files
![alt text](/m1/task5.1/screenshots/ll.png)

##### 5) Perform the following sequence of operations:
##### - create a subdirectory in the home directory;
##### - in this subdirectory create a file containing information about directories
##### located in the root directory (using I/O redirection operations);
##### - view the created file;
![alt text](/m1/task5.1/screenshots/14viewthecreatedfile.png)
##### - copy the created file to your home directory using relative and absolute  addressing.
![alt text](/m1/task5.1/screenshots/15copy-the-created-file-to-your-home-directory-using-relative-and-absolute.png)
##### - delete the previously created subdirectory with the file requesting removal;
##### - delete the file copied to the home directory.
##### 6) Perform the following sequence of operations:
##### - create a subdirectory test in the home directory;
##### - copy the .bash_history file to this directory while changing its name to
##### labwork2;
##### - create a hard and soft link to the labwork2 file in the test subdirectory;
##### - how to define soft and hard link, what do these concepts;
## hard link same as original file, soft that onli link to file to determine L at start of line
##### - change the data by opening a symbolic link. What changes will happen and why 
## changes saved in original file
![alt text](/m1/task5.1/screenshots/16 change-symbolic-link-change-origine-file-beckose-how-linuix-works..png)
##### - rename the hard link file to hard_lnk_labwork2;
##### - rename the soft link file to symb_lnk_labwork2 file;
##### - then delete the labwork2. What changes have occurred and why?
## hard link save copy of original file
![alt text](/m1/task5.1/screenshots/18hard-link-save-copy-of-orign-file.png)

