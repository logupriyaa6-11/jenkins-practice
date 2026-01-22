# Subnet the Class C IP Address 205.11.2.0 so that you have 30 subnets. What is the subnet mask for the maximum number of hosts? How many hosts can each subnet have? What is the IP address of host 3 on subnet 2? 

Given:
IP address = 205.11.2.0
No. of subnets (to create) = 30

To find: 
Subnet for maximum No. of hosts
No. of host per subnet
IP address of host 3 on subnet 2

## Subnet for maximum No. of hosts

No. of subnets = 2^n
(n->No. of bits borrowed)

we need 30, 
2^4 = 16 (16<30)
2^5 = 32 (32>30)
=> No. of bits we need to borrow = 5

usually, the class C has 24 network bits 
default subnet mask - 255.255.255.0 (network bits = 24, host bits = 8)
we add the borrowed bits to it => 24 + 5 = 29
=> subnet mask for maximum no. of host is 29 (/29)

Decimal format: 11111111.11111111.11111111.11111000
(1 - network, 0 - host)
=> IP address: 255.255.255.248/29 

## No. of host per subnet
We had 8 host bits
borrowed 5 bits
now, the remaining host bits = 3

Host = 2^h - 2
(here, h = 3)

2^3 - 2 = 8 - 2 = 6
therefore, each subnet has 6 usable host

## IP address of host 3 on subnet 2
subnet size = 256 - last subnet mask value = 256 - 248 = 8
(subnet increases by 8 means jumps by 8 value)

From given,
IP address => 205.11.2.0
(add 8 for every subnet)

Subnet list:
205.11.2.0 -> 1st subnet
205.11.2.8 -> 2nd subnet
205.11.2.16 -> 3rd subnet
.
.

we want to find the IP address of host 3 on subnet 2
IP addres of 2nd subnet => 205.11.2.8

network address = 205.11.2.8.
broadcast address = 205.11.2.15 (the address untill the next subnet)

Host list:
205.11.2.9 - host 1
205.11.2.10 - host 2
205.11.2.11 - host 3
205.11.2.12 - host 4
205.11.2.13 - host 5
205.11.2.14 - host 6

Therefore, the IP address of host 3 on subnet 2 is
=> 205.11.2.11