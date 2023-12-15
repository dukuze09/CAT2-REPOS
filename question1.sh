#!/bin/bash

# Check if there is exactly one command line argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <positive_integer>"
    exit 1
fi

# Check if the command line argument is a positive integer
if ! [[ "$1" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Please provide a positive integer."
    exit 1
fi

# Function to calculate the sum of digits
get_sum_of_digits() {
    local num=$1
    local sum=0

    while [ "$num" -gt 0 ]; do
        sum=$((sum + num % 10))
        num=$((num / 10))
    done

    echo "$sum"
}

# Function to calculate the product of digits
get_product_of_digits() {
    local num=$1
    local product=1

    while [ "$num" -gt 0 ]; do
        product=$((product * (num % 10)))
        num=$((num / 10))
    done

    echo "$product"
}

# Function to check if the number is a palindrome
is_palindrome() {
    local num=$1
    local reversed=0
    local original=$num

    while [ "$num" -gt 0 ]; do
        reversed=$((reversed * 10 + num % 10))
        num=$((num / 10))
    done

    [ "$original" -eq "$reversed" ]
}

# Function to check if the number is prime
is_prime() {
    local num=$1

    if [ "$num" -eq 1 ]; then
        echo "Not Prime"
        return
    fi

    for ((i = 2; i <= num / 2; i++)); do
        if [ "$((num % i))" -eq 0 ]; then
            echo "Not Prime"
            return
        fi
    done

    echo "Prime"
}

# Main logic based on user's choice
echo "Choose an operation:"
echo "1. Display the sum and the product of the digits"
echo "2. Display whether the number is a palindrome or not"
echo "3. Display whether the number is prime or not"

read -p "Enter your choice (1/2/3): " choice

case "$choice" in
    1)
        sum=$(get_sum_of_digits "$1")
        product=$(get_product_of_digits "$1")
        echo "Sum of digits: $sum"
        echo "Product of digits: $product"
        ;;
    2)
        if is_palindrome "$1"; then
            echo "The number is a palindrome."
        else
            echo "The number is not a palindrome."
        fi
        ;;
    3)
        is_prime_result=$(is_prime "$1")
        echo "The number is $is_prime_result."
        ;;
    *)
        echo "Invalid choice. Please choose 1, 2, or 3."
        exit 1
        ;;
esac

