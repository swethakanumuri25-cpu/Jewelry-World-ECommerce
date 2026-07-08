# Jewelry World – Full Stack E-Commerce Web Application

Jewelry World is a full-stack e-commerce web application developed using Java, JSP, Servlets, JDBC, and MySQL following the Model-View-Controller (MVC) architecture. The application enables customers to browse jewelry products, manage shopping carts and wishlists, submit product reviews, place orders, and manage user accounts through a responsive web interface. An administrator portal provides comprehensive product and order management functionality.

The project demonstrates full-stack Java web development, relational database design, CRUD operations, session management, and deployment of a cloud-hosted application.

**Live Application**

https://jewelry-world-ecommerce.onrender.com

---

## Features

### Customer Module

- User registration and authentication
- Secure login and logout
- Session management
- Browse products by category
- Product search
- Product details
- Shopping cart
- Wishlist
- Place orders
- Order history
- Product ratings and reviews
- User profile management

### Administrator Module

- Administrator login
- Product management
- Add products
- Update products
- Delete products
- Order management
- Customer management

---

## Technology Stack

### Backend

- Java
- Jakarta Servlets
- JSP
- JDBC
- Apache Tomcat 10
- Maven

### Frontend

- HTML5
- CSS3
- JavaScript
- Bootstrap

### Database

- MySQL
- Aiven Cloud Database

### Deployment

- Render
- GitHub

### Development Tools

- Eclipse IDE
- MySQL Workbench
- Git

---

## Application Architecture

```
Client Browser
       │
       ▼
JSP Pages
       │
       ▼
Servlet Layer
       │
       ▼
DAO Layer
       │
       ▼
JDBC
       │
       ▼
MySQL Database
```

---

## Project Structure

```
Jewelry-World-ECommerce
│
├── src
│   └── main
│       ├── java
│       │   ├── dao
│       │   ├── model
│       │   ├── servlet
│       │   └── util
│       │
│       └── webapp
│           ├── css
│           ├── images
│           ├── js
│           ├── WEB-INF
│           └── *.jsp
│
├── pom.xml
└── README.md
```

---

## Database

The application uses a relational MySQL database with the following core tables:

- Users
- Products
- Orders
- Cart
- Wishlist
- Reviews
- Admin

Database credentials are securely managed using environment variables during deployment.

---

## Installation

Clone the repository.

```bash
git clone https://github.com/swethakanumuri25-cpu/Jewelry-World-ECommerce.git
```

Open the project using Eclipse IDE or IntelliJ IDEA.

Configure the database connection.

Deploy the application on Apache Tomcat 10 or later.

---

## Deployment

Application Hosting

- Render

Database Hosting

- Aiven Cloud MySQL

Environment Variables

```
DB_PASSWORD
```

---

## Security

- Prepared Statements for SQL Injection prevention
- Session-based authentication
- Environment variables for database credentials
- MVC architecture
- Server-side validation

---

## Future Improvements

- BCrypt password hashing
- Payment gateway integration
- Email verification
- Password reset
- Order tracking
- Admin analytics dashboard
- REST API
- Docker support
- Unit and integration testing

---

## Screenshots

Include screenshots of:

- Home Page
- Products Page
- Product Details
- Shopping Cart
- Wishlist
- Login
- User Profile
- Orders
- Admin Dashboard

---

## Author

Swetha Kanumuri

GitHub

https://github.com/swethakanumuri25-cpu

LinkedIn

https://www.linkedin.com/in/swetha-kanumuri-63964819a/

---

## License

This project is intended for educational and portfolio purposes.
