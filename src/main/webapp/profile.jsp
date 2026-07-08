<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
        String name = (String) session.getAttribute("userName");
        String email = (String) session.getAttribute("userEmail");

        if(name == null){
            response.sendRedirect("login.jsp");
            return;
        }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Profile</title>

<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

<body>

<header>

    <a href="index.jsp" class="logo">
        Jewelry World
    </a>

    <nav>

        <a href="index.jsp">Home</a>

        <a href="products.jsp">Products</a>

    </nav>

</header>

<section class="login-container">

<div class="login-box">

<h2>My Profile</h2>

<br>

<h3>Welcome</h3>

<br>

<h2><%= name %></h2>

<br>

<hr>

<br>

<p>Email :</p>

<h3><%= email %></h3>

<br>

<a href="orders.jsp" class="btn">
My Orders
</a>

<br><br>

<a href="wishlist.jsp" class="btn">
Wishlist
</a>

<br><br>

<a href="LogoutServlet" class="btn">
Logout
</a>

</div>

</section>

</body>

</html>