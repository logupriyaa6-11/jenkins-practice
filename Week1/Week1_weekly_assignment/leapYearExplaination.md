## 3. Leap year or not
Enter a year: 2024 stores in $userInputYear = "2024"

input validation
if (-not ($userInputYear -match '^\d+$'))

('^\d+$') - checks for the input is number or not 
^-start of string
\d -integers (0-9)
+ - multiple numbers
$ - end of string

why not used type casting?
Sometimes, type casting with [int] causes runtime error 
eg., [int]abc -> invalid

function call 
inside the function there are few conditions to be satisfied 
2024 % 400 = 24   
2024 % 4   = 0
2024 % 100 = 24  

function returns true

**output:**
The year is a Leap Year.