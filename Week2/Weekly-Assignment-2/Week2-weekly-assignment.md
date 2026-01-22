# Address Block: 192.168.0.0/16 Subnetting need to be implemented for assigning network to 5 different projects

Given:
IP address = 192.168.0.0/16 (CIDR Notation)

To find:
We need to divide it for 5 projects

## Subnet mask length
From given we can assume that, 
Network bits = 16
Host bits = 16

## Total IP address 
No. of IPs = 2^(no. of host bits)
=>65536

## how many subnets we need?
The requirement is 5 
2^2 => 4 < 5
2^3 => 8 >= 5 (enough)

So No. of bits borrowed = 3

## New subnet masking 
Previously it was /16
After borrowing 3 => 16 + 3 = 19

So the host bits = 32 - 19 = 13
New host bits is 13

Actual requirement is 5 but we have 8 (remaining all are for spare)

## Actual subnet ranges
256 / 8 subnets = 32

## Subnets breakdown 
Project 1:
Network Address =  192.168.0.0/19
Usable IP range = 198.168.0.1 - 198.168.31.254
Broadcast = 192.168.31.255

Project 2:
Network Address =  192.168.32.0/19
Usable IP range = 198.168.32.1 - 198.168.63.254
Broadcast = 192.168.63.255

Project 3:
Network Address =  192.168.64.0/19
Usable IP range = 198.168.64.1 - 198.168.95.254
Broadcast = 192.168.95.255

Project 4:
Network Address =  192.168.96.0/19
Usable IP range = 198.168.96.1 - 198.168.127.254
Broadcast = 192.168.127.255

Project 5:
Network Address =  192.168.128.0/19
Usable IP range = 198.168.128.1 - 198.168.159.254
Broadcast = 192.168.159.255