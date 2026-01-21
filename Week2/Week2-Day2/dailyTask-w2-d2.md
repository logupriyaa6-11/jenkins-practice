## permissions

command: chmod <permission> <filename>

### numerical:

read->4
write->2
execute->1
no permission->0

format=> [owner][user][others]

eg.: chmod 700 file.txt
owner can read, write and execute (7)
no permission for users and others (0)

### symbols:

u->users
g->groups
o->others
a->all

r->read
w->write
x->execute

+->add the permission
- ->remove the permission
= ->assign equally (right-source; left-destination)

eg.: chmod u+x file.txt
user gets permission to execute

## grep

- used to search for specific word, phrases or patterns inside a file 
- shows matching line in the screen

syntax:
grep "word" filename

grep -i "word" file – Searches ignoring case sensitivity
grep -r "word" directory – Searches recursively in all files within a directory
grep -n "word" file – Displays matching lines with line numbers

## awk
- used for pattern scanning and processing text line by line
- works well with structured text like columns and fields

syntax:
awk 'pattern { action }' filename

awk '{print $1}' file – Prints the first column
awk '/word/ {print}' file – Prints lines matching a word
awk -F"," '{print $2}' file – Uses a comma as field separator (default space)

## sed
- used for searching, replacing, inserting, and deleting text in a file
- works as a stream editor (processes text line by line)

syntax:
sed 'command' filename

sed 's/old/new/' file – Replaces first occurrence of a word in each line
sed 's/old/new/g' file – Replaces all occurrences in each line
sed -n '5p' file – Prints only line number 5

## cut
- used to extract specific columns or sections from each line of a file
- commonly used with delimiters

syntax:
cut option filename

cut -c 1-5 file – Extracts characters from position 1 to 5
cut -d":" -f1 file – Extracts first field using : as delimiter
cut -f2 file – Extracts the second field using tab delimiter