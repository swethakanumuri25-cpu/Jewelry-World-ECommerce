<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Jewelry World | Login</title>

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

        <a href="#">Collections</a>

        <a href="#">About</a>

        <a href="#">Contact</a>

    </nav>

    <div class="nav-icons">

        <input type="text" placeholder="Search Jewelry">

        <a href="#" title="Wishlist">
            <i class="fa-regular fa-heart"></i>
        </a>

        <a href="#" title="Shopping Cart">
            <i class="fa-solid fa-cart-shopping"></i>
        </a>

        <a href="login.jsp" title="Login">
            <i class="fa-regular fa-user"></i>
        </a>

    </div>

</header>

<section class="login-container">

    <div class="login-box">

        <h2>Welcome Back</h2>

        <p style="margin-bottom:25px;color:#666;">
            Login to your Jewelry World account
        </p>

        <%
        if(request.getParameter("error") != null){
        %>

        <p style="color:red;text-align:center;">
            Invalid Email or Password
        </p>

        <%
        }
        %>

        <form action="LoginServlet" method="post">

            <input
                type="email"
                name="email"
                placeholder="Enter Email Address"
                required>

            <input
                type="password"
                name="password"
                placeholder="Enter Password"
                required>

            <button type="submit">
                Login
            </button>

        </form>

        <p style="margin-top:25px;">
            Don't have an account?

            <a href="register.jsp">
                Register Here
            </a>

        </p>

    </div>

</section>

<footer>

    <p>&copy; 2022 Jewelry World | Crafted with Elegance</p>

</footer>

</body>

</html>