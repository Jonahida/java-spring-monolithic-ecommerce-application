# Java Spring Monolithic E-commerce Application

This project demonstrates an e-commerce application built using Java Spring Boot in a monolithic architecture. It provides a hands-on implementation of REST APIs and database management (PostgreSQL), and containerization with Docker.

---

## Key Features

### Monolithic Architecture
- User Management: Handles user authentication and profiles.
- Product Catalog: Manages product inventory.
- Order Processing: Manages customer orders and transactions.
- Single Database: Uses PostgreSQL for storing relational data (users, orders, payments).


### Database Management
- **PostgreSQL**: Stores relational data (users, orders, payments).

### REST APIs
Each module exposes APIs for communication. It uses Spring Boot + Spring Web to build RESTful services.

### Containerization & Orchestration
- **Docker**: Containerizes the monolithic application.
- **Docker Compose**: Manages the single-container setup.

---

## Architecture Overview

The project is structured as a monolithic application that handles user management, product catalog, and order processing in a single codebase.


### Monolithic Architecture

```txt
+----------------------+
User Management
Product Catalog
Order Processing
Single Database
+----------------------+
```

---

## Requirements

This project requires the following technologies:

- Docker & Docker Compose

---

## Setup and Installation

### Clone the Repository

```sh
$ git clone https://github.com/Jonahida/java-spring-monolithic-ecommerce-application
$ cd java-spring-monolithic-ecommerce-application
```

### Run the Project Using Docker Compose (PostgreSQL Database):

To easily run the monolithic project, use the following command to start the container:

```bash
$ cd ecommerce-monolith
$ docker-compose up --build
```

Or run the project inside your IDE and start PostgreSQL in a container manually:

```bash
$ docker run --name ecommerce-postgres -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=mysecretpassword -e POSTGRES_DB=ecommerce_db -p 5432:5432 -d postgres
```

Then run the Monolithic Application:

```bash
$ cd ecommerce-monolith
$ mvn spring-boot:run
```

---

## API Endpoints

### 1. Create Automatically Users, Products or Orders (POST)

Run the Bash Script to generate random users, products, and orders. The script prompts you to choose the type of data to generate and sends the required POST requests.

Run the script by executing:

```bash
$ ./generate_data.sh
```

### 2. Get All Users (GET /users)

```bash
$ curl -X GET http://localhost:8080/users
```

### 3. Create a User (POST /users)

```bash
$ curl -X POST http://localhost:8080/users \
  -H "Content-Type: application/json" \
  -d '{
        "username": "john_doe",
        "email": "john@example.com",
        "password": "password123"
      }'
```

### 4. Get All Products (GET /products)

```bash
$ curl -X GET http://localhost:8080/products
```

### 5. Create a Product (POST /products)

```bash
$ curl -X POST http://localhost:8080/products \
  -H "Content-Type: application/json" \
  -d '{
        "name": "Laptop",
        "price": 999.99,
        "description": "High-performance laptop"
      }'
```

### 6. Get All Orders (GET /orders)

```bash
$ curl -X GET http://localhost:8080/orders
```

### 7. Create an Order (POST /orders)

```bash
$ curl -X POST http://localhost:8080/orders \
  -H "Content-Type: application/json" \
  -d '{
        "user": {"id": 1},
        "product": {"id": 1},
        "quantity": 2,
        "totalPrice": 1999.98
      }'
```

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.