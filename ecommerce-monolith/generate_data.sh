#!/bin/bash

# Function to create random users
create_users() {
    read -p "How many users would you like to create? " num_users
    for ((i=1; i<=num_users; i++))
    do
        username="user$i"
        email="user$i@example.com"
        password="password$i"
        curl -X POST http://localhost:8080/users \
            -H "Content-Type: application/json" \
            -d '{"username": "'"$username"'", "email": "'"$email"'", "password": "'"$password"'"}'
        echo "User $i created"
    done
}

# Function to create random products
create_products() {
    read -p "How many products would you like to create? " num_products
    for ((i=1; i<=num_products; i++))
    do
        name="Product$i"
        description="Description for Product$i"
        price=$((RANDOM % 100 + 1))  # Random price between 1 and 100
        curl -X POST http://localhost:8080/products \
            -H "Content-Type: application/json" \
            -d '{"name": "'"$name"'", "description": "'"$description"'", "price": '"$price"'}'
        echo "Product $i created"
    done
}

# Function to create random orders
create_orders() {
    read -p "How many orders would you like to create? " num_orders
    for ((i=1; i<=num_orders; i++))
    do
        user_id=$((RANDOM % 10 + 1))  # Random user ID between 1 and 10
        product_id=$((RANDOM % 10 + 1))  # Random product ID between 1 and 10
        quantity=$((RANDOM % 5 + 1))  # Random quantity between 1 and 5
        total_price=$((RANDOM % 100 + 1))  # Random price between 1 and 100
        curl -X POST http://localhost:8080/orders \
            -H "Content-Type: application/json" \
            -d '{"user": {"id": '"$user_id"'}, "product": {"id": '"$product_id"'}, "quantity": '"$quantity"', "totalPrice": '"$total_price"'}'
        echo "Order $i created"
    done
}

# Main menu
echo "Select the type of data you want to generate:"
echo "1. Users"
echo "2. Products"
echo "3. Orders"
read -p "Enter your choice (1/2/3): " choice

case $choice in
    1)
        create_users
        ;;
    2)
        create_products
        ;;
    3)
        create_orders
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

