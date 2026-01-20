#! /bin/bash

calculate () {
    num1=$1
    num2=$2
    choice=$3

    case $choice in 
        1)
            echo "Result: $num1 + $num2 = $((num1+num2))"
            ;;
        2)
            echo "Result: $num1 - $num2 = $((num1-num2))"
            ;;
        3)
            echo "Result: $num1 * $num2 = $((num1*num2))"
            ;;
        4)
            if [ $num2 -eq 0 ]; then 
                echo "Zero division error"
            else 
                echo "Result: $num1 / $num2 = $((num1/num2))"
            fi
            ;;
        5)
            echo "Result: $num1 % $num2 = $((num1%num2))"
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
}

read -p "Enter number 1: " num1
read -p "Enter number 2: " num2

echo "Choose the operation"
echo "1. Add"
echo "2. Subtract"
echo "3. Multiply"
echo "4. Divide"
echo "5. Modulus"

read -p "Enter a choice: " choice

calculate "$num1" "$num2" "$choice"