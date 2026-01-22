# send alerts to mail

1. install
sudo apt update
sudo apt install mailutils

- mailutils helps in using the mail commands 

2. mail -s command

echo "Warning! disk usage exceeding. current usage: $usage" | mail -s "priyaarul1107@gmail.com"

- mail -s "recepient(mailid)" helps in sending the mail