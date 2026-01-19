# Rest API

REST APIs are a simple and common way for applications to communicate with each other over the internet. They are widely used in websites, mobile apps, and automation tools. This document is written to give basic knowledge of REST APIs using simple and easy language.

## What Is an API?
An API (Application Programming Interface) is a way for one program to talk to another program.
In simple words:
- One system asks for something
- Another system replies with the result

This helps different applications work together automatically.

## What Is a REST API?
REST stands for Representational State Transfer.

A REST API is an API that works using:
- The internet
- URLs (web addresses)
- Simple commands
REST APIs are easy to use and understand. They usually send and receive data in JSON format.

## How REST APIs Work
The basic working of a REST API is:
- A request is sent to a server
- The server processes the request
- A response is sent back
This is similar to asking a question and getting an answer.

## Main Parts of a REST API
### URL (Endpoint)
A URL is the address where the API is available.
Example:
https://api.example.com/data
This tells the server what data is needed.

### HTTP Methods (Commands)
REST APIs use standard commands called HTTP methods.
GET	- Get information
POST - Send new information
PUT	- Update existing information
PATCH - Update part of the information
DELETE - Remove information

## Explanation of REST Commands
GET
Used to read or fetch data from a server.

POST
Used to send new data to the server.

PUT
Used to update all data of an existing item.

PATCH
Used to update only some part of the data.

DELETE
Used to delete data from the server.

## Data Format Used in REST APIs
Most REST APIs use JSON format.
Example:
{
"name": "Alex",
"age": 30
}
JSON is easy to read and understand.

## REST API Responses
When a request is sent, the server responds with:
A status code
Data or a message

200	- Request successful
201	- Data created
400	- Invalid request
401	- Permission required
404	- Data not found
500	- Server error

## Why REST APIs Are Important
REST APIs are important because they:
- Allow systems to communicate
- Support automation
- Are simple and flexible
- Are widely used in real-world applications