# Jewelry World – E-Commerce Web Application

## Overview

Jewelry World is a full-stack Java web application developed using Java, JSP, Servlets, JDBC, MySQL, HTML, CSS, and JavaScript following the MVC architecture. The application provides customers with a complete online jewelry shopping experience, including product browsing, shopping cart management, wishlist functionality, order placement, and product reviews. An administrative portal is also included to manage products, users, orders, and business analytics.

---

## Key Features

### Customer Features

- User Registration and Login
- User Profile Management
- Browse Products
- Search Products
- Category-Based Product Filtering
- Product Details Page
- Shopping Cart
- Wishlist Management
- Buy Now
- Checkout Process
- Place Orders
- View Order History
- Cancel Orders
- Product Rating and Review System

### Administrator Features

- Secure Admin Login
- Dashboard with Business Statistics
- Product Management
- Add, Update, and Delete Products
- Order Management
- User Management
- Revenue Summary
- Order Status Tracking

---

## Technology Stack

| Category | Technologies |
|----------|--------------|
| Programming Language | Java |
| Backend | JSP, Servlets, JDBC |
| Frontend | HTML5, CSS3, JavaScript |
| Database | MySQL |
| Web Server | Apache Tomcat 10 |
| Build Tool | Maven |
| Version Control | Git, GitHub |
| Architecture | MVC (Model-View-Controller) |

---

## Project Structure

```text
Jewelry-World-ECommerce
│
├── src
│   └── main
│       ├── java
│       │   └── com.swetha.ecommerce
│       │       ├── dao
│       │       ├── model
│       │       ├── servlet
│       │       └── util
│       │
│       └── webapp
│           ├── css
│           ├── images
│           ├── WEB-INF
│           └── *.jsp
│
├── pom.xml
└── README.md
```

---

## Database

**Database Name**

```text
jewelrydb
```

### Database Tables

- users
- products
- cart
- wishlist
- orders
- reviews

---

## Application Workflow

1. User registers and logs into the application.
2. Products are retrieved from the MySQL database.
3. Users browse, search, and filter products.
4. Products can be added to the cart or wishlist.
5. Users complete checkout and place orders.
6. Orders are stored in the database and displayed in the user's order history.
7. Users can submit ratings and reviews for purchased products.
8. Administrators manage products, users, and orders through the admin dashboard.

---

## Installation Guide

### Clone the Repository

```bash
git clone https://github.com/swethakanumuri25-cpu/Jewelry-World-ECommerce.git
```

### Import the Project

Import the project into Eclipse IDE or Visual Studio Code.

### Configure the Database

Create a MySQL database named:

```text
jewelrydb
```

Import the provided SQL script.

### Configure Database Connection

Open:

```text
src/main/java/com/swetha/ecommerce/util/DBConnection.java
```

Update the following values:

- Database URL
- Username
- Password

### Run the Application

Deploy the project on Apache Tomcat 10.

Open:

```text
http://localhost:8080/ECommerce-App/
```

---

## Screenshots

Screenshots will be added for:

- Home Page
- Product Listing
- Product Details
- Shopping Cart
- Wishlist
- Checkout
- Order History
- User Profile
- Admin Dashboard
- Product Management
- Customer Reviews

---

## Future Enhancements

- Secure Online Payment Integration
- Email Notifications
- Inventory Management
- Product Recommendation System
- Discount and Coupon Management
- Order Tracking
- Sales Analytics Dashboard
- Responsive Mobile Interface

---

## Developer

**Swetha Kanumuri**

Software Developer

GitHub Profile

https://github.com/swethakanumuri25-cpu

---

## License

This project has been developed for educational and portfolio purposes.