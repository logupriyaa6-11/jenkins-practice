# Write the IP address 135.1.1.25 mask 255.255.248.0 in CIDR notation

Given:
IP address = 135.1.1.25
Subnet mask = 255.255.248.0

To find:
CIDR notation for the IP address

## Basic structure of CIDR notation
CIDR Notation -> IP address/Number 
(Number -> No. of bits available for network)

## Subnet mask in binary format

How to convert the decimals to binary?
Let's say, 255 
to get 255 = 124 + 64 + 32 + 16 + 8 + 4 + 2 + 1
we need all 8 to make 255 (so 1 for every bit)

Likewise,
255.255.248.0 => 11111111.11111111.11111000.00000000

count of 1s => network
count of 0s => host

No.of 1s = 8 + 8 + 5 + 0 = 21
Therefore, 21 bits are available for network and 11 bits are available for host

CIDR Notation => IP Address/no. of bits for network
=> 135.1.1.25/21