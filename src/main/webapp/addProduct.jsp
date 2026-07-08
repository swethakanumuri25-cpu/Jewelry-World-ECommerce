<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Add Product</title>

<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

<body>

<header>

<a href="adminDashboard.jsp" class="logo">
Jewelry World Admin
</a>

<nav>

<a href="adminDashboard.jsp">Dashboard</a>

<a href="manageProducts.jsp">Products</a>

<a href="LogoutServlet">Logout</a>

</nav>

</header>

<section class="login-container">

<div class="login-box">

<h2>Add Product</h2>

<form action="AddProductServlet" method="post">

<input
type="text"
name="name"
placeholder="Product Name"
required>

<input
type="number"
step="0.01"
name="price"
placeholder="Price"
required>

<input
type="text"
name="image"
placeholder="Image Name (example: ring.jpg)"
required>

<input
type="text"
name="category"
placeholder="Category"
required>

<textarea
name="description"
placeholder="Description"
required></textarea>

<button type="submit">

<i class="fa-solid fa-plus"></i>

Add Product

</button>

</form>

</div>

</section>

</body>

</html>