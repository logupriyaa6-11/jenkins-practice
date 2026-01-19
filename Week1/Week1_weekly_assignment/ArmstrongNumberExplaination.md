## 1. Armstrong number
Enter a number: 153
The input is stored in 
$InputNumber = 153

Then the program checks for positive number
if ([int]$InputNumber -lt 0)

find the length of the input and store it
$digitCount = $InputNumber.Length
$digitCount = 3

initialize sum
$armstrongSum = 0

the number is converted to char array
**1**
$digit = 1
$powerResult = 1
power calculation:
1 × 1 × 1 = 1
update sum -> $armstrongSum = 0 + 1 = 1

**2**
$digit = 5
$powerResult = 1
power calculation:
5 × 5 × 5 = 125
update sum -> $armstrongSum = 1 + 125 = 126

**3**
$digit = 3
$powerResult = 1
power calculation:
3 × 3 × 3 = 27
update sum -> $armstrongSum = 126 + 27 = 153

**final comparison**
$armstrongSum = 153
[int]$InputNumber = 153
153 -eq 153 -> True

checks whether they are equal
if (Test-ArmstrongNumber -InputNumber $userInput)

output: "The number is an Armstrong number."