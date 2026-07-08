<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Jewelry World | Register</title>

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

        <a href="#"><i class="fa-regular fa-heart"></i></a>
        <a href="#"><i class="fa-solid fa-cart-shopping"></i></a>
        <a href="login.jsp"><i class="fa-regular fa-user"></i></a>

    </div>

</header>

<section class="login-container">

    <div class="login-box">

        <h2>Create Account</h2>

        <form action="RegisterServlet" method="post">

            <input
                type="text"
                name="fullname"
                placeholder="Full Name"
                required>

            <input
                type="email"
                name="email"
                placeholder="Email"
                required>

            <input
                type="password"
                name="password"
                placeholder="Password"
                required>

            <button type="submit">
                Register
            </button>

        </form>

        <p>
            Already have an account?
            <a href="login.jsp">Login Here</a>
        </p>

    </div>

</section>

<footer>

<p>&copy; 2022 Jewelry World</p>

</footer>

</body>
</html>