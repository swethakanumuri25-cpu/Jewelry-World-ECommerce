# Jewelry World – Full Stack E-Commerce Web Application

Jewelry World is a full-stack e-commerce web application developed using Java, JSP, Servlets, JDBC, and MySQL following the MVC architecture. The application enables users to browse jewelry products, manage shopping carts and wishlists, place orders, submit product reviews, and manage personal accounts. An administrator portal provides product and order management capabilities.

The application is deployed on Render with a cloud-hosted MySQL database on Aiven.

**Live Application**

https://jewelry-world-ecommerce.onrender.com

---

## Key Features

### Customer Module

- User registration and authentication
- Secure session management
- Browse products by category
- Search products
- Product details page
- Shopping cart
- Wishlist management
- Place orders
- View order history
- Product ratings and reviews
- User profile management

### Administrator Module

- Administrator authentication
- Product management
  - Add products
  - Update products
  - Delete products
- Order management
- User management dashboard

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

## Software Architecture

The application follows the Model-View-Controller (MVC) design pattern.

```
Client Browser
       │
       ▼
JSP Pages (View)
       │
       ▼
Servlets (Controller)
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
│   ├── main
│   │   ├── java
│   │   │   ├── dao
│   │   │   ├── model
│   │   │   ├── servlet
│   │   │   └── util
│   │   │
│   │   └── webapp
│   │       ├── css
│   │       ├── images
│   │       ├── js
│   │       ├── WEB-INF
│   │       └── *.jsp
│
├── pom.xml
└── README.md
```

---

## Database Design

The application uses a relational MySQL database consisting of the following tables:

- Users
- Products
- Orders
- Cart
- Wishlist
- Reviews
- Admin

Database credentials are managed securely using environment variables during deployment.

---

## Installation

### Clone the repository

```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/Jewelry-World-ECommerce.git
```

### Open the project

Import the project into Eclipse IDE or IntelliJ IDEA.

### Configure Database

Create a MySQL database and update the database connection settings.

Example:

```java
URL = jdbc:mysql://localhost:3306/jewelrydb
USER = root
PASSWORD = your_password
```

For cloud deployment, configure the following Render environment variable:

```
DB_PASSWORD
```

### Run the Application

Deploy the project on Apache Tomcat 10 or later.

Access the application at:

```
http://localhost:8080/Jewelry-World-ECommerce
```

---

## Deployment

**Application Hosting**

Render

**Database Hosting**

Aiven MySQL Cloud

---

## Security Features

- Prepared Statements to prevent SQL Injection
- Session-based authentication
- Environment variable configuration for database credentials
- MVC architecture
- Server-side input validation

---

## Future Enhancements

- BCrypt password hashing
- Payment gateway integration
- Email verification
- Password reset functionality
- Product recommendation engine
- Admin analytics dashboard
- REST API support
- Docker containerization
- Unit and integration testing

---

## Screenshots

Include screenshots of the following pages:

- Home Page
- Products Page
- Product Details
- Login
- Registration
- Shopping Cart
- Wishlist
- Orders
- Profile
- Admin Dashboard

---

## Learning Outcomes

This project demonstrates practical experience with:

- Java EE Web Development
- MVC Architecture
- Object-Oriented Programming
- JDBC Database Connectivity
- MySQL Database Design
- CRUD Operations
- Session Management
- Authentication and Authorization
- Cloud Database Integration
- Full Stack Web Development
- Git Version Control
- Application Deployment on Render

---

## Author

**Swetha Kanumuri**

Master of Science in Data Science

University of North Texas

GitHub

https://github.com/YOUR_GITHUB_USERNAME

LinkedIn

https://linkedin.com/in/YOUR_LINKEDIN_PROFILE

---

## License

This project was developed for educational purposes and portfolio demonstration.
