
##### 1. How many states could has a process in Linux?
Running or Runnable (R)
Uninterruptible Sleep (D)
Interruptable Sleep (S)
Stopped (T)
Zombie (Z)

##### 2. Examine the pstree command. Make output (highlight) the chain (ancestors) of the current process.
![alt text](/m1/task5.2/screenshots/2.png) 


##### 3. What is a proc file system?
Proc fs is virtual file system, that presents information about processes and other system information 

##### 4. Print information about the processor (its type, supported technologies, etc.).
![alt text](/m1/task5.2/screenshots/3.png) 

##### 5. Use the ps command to get information about the process. The information should be as
##### follows: the owner of the process, the arguments with which the process was launched for
##### execution, the group owner of this process, etc.
![alt text](/m1/task5.2/screenshots/4.png) 

##### 6. How to define kernel processes and user processes?
By prices id more then 1000

##### 7. Print the list of processes to the terminal. Briefly describe the statuses of the processes.
##### What condition are they in, or can they be arriving in?
## SS Interruptible sleep (waiting for an event to complete) + is a session leader
## S Interruptible sleep (waiting for an event to complete)
## I Idle kernel thread
## R running 
## R+ running +  is in the foreground process group
![alt text](/m1/task5.2/screenshots/5.png) 
##### 8. Display only the processes of a specific user
![alt text](/m1/task5.2/screenshots/6.png) 

##### 9. What utilities can be used to analyze existing running tasks (by analyzing the help for the ps command)?
## top


##### 10. What information does top command display?
## pid,user,prioritu NICEcommand, Virt=allvirtuall memory of proces,res,SHR,S,CPU%,MEM%,TIME,COMMAND
## VIRT — total amount of virtual memory that the process is using
## RES — current RAM usage
## SHR  --  Shared Mem size
## S -state of process
## TIME — CPU usage time in seconds
## COMMAND — command that started the process.

##### 12. Display the processes of the specific user using the top command.
## top -U user

##### 12. What interactive commands can be used to control the top command? Give a couple of examples.
## shift + n sort by pid
## shift + p sort by cpu
## shift + m sort by memory usage
## shift + t sort by time usage
## shift + z change clors
 

##### 13. Sort the contents of the processes window using various parameters (for example, the
##### amount of processor time taken up, etc.)
## sort cpu 
![alt text](/m1/task5.2/screenshots/13cpu.png) 
## sort ram
![alt text](/m1/task5.2/screenshots/13mem.png) 

##### 14. Concept of priority, what commands are used to set priority?
## nice

##### 15. Can I change the priority of a process using the top command? If so, how?
## press r after type process id which you want to change prioryet and type NI NICE 

##### 16. Examine the kill command. 
##### How to send with the kill command: 
## kill pid
##### process control signal?
## ctrl + z,  
##### Give an example of commonly used signals:
## Hangup (often used before logging out)
## Interrupt (same as pressing Control+C in a terminal session)
## Kill (terminates without cleanup) 
## Term Kill (terminates gracefully after cleanup) 

##### 17. Commands jobs, fg, bg, nohup. What are they for? Use the sleep, yes command to
##### demonstrate the process control mechanism with fg, bg.

## bg - put suspended process into background
## fg - bring process into foreground
## jobs - list processes
## !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


##### Part2
##### 1. Check the implementability of the most frequently used OPENSSH commands in the MS
##### Windows operating system. (Description of the expected result of the commands +
##### screenshots: command – result should be presented)
##### 2. Implement basic SSH settings to increase the security of the client-server connection (at least
##### 3. List the options for choosing keys for encryption in SSH. Implement 3 of them.
##### rsa generate
![alt text](/m1/task5.2/screenshots/15.png) 
## add pub key to authorized_keys
![alt text](/m1/task5.2/screenshots/16.png) 
## login to server
![alt text](/m1/task5.2/screenshots/17.png) 
##### ecdsa 
##### ed25519 generate
![alt text](/m1/task5.2/screenshots/19.png) 
## dsa have problem witch conection to sever
## Change ssh port to 1715
![alt text](/m1/task5.2/screenshots/18.png) 
##### 4. Implement port forwarding for the SSH client from the host machine to the guest Linux
##### virtual machine behind NAT.
##### 5*. Intercept (capture) traffic (tcpdump, wireshark) while authorizing the remote client on the
##### server using ssh, telnet, rlogin. Analyze the result.



