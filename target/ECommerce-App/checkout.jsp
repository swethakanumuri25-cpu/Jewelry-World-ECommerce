<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Checkout</title>

<link rel="stylesheet" href="css/style.css">

</head>

<body>

<header>

<a href="index.jsp" class="logo">
Jewelry World
</a>

</header>

<div class="login-container">

<div class="login-box">

<h2>Checkout</h2>

<form action="payment.jsp" method="post">

<input type="text"
name="fullname"
placeholder="Full Name"
required>

<input type="email"
name="email"
placeholder="Email"
required>

<input type="text"
name="address"
placeholder="Address"
required>

<input type="text"
name="city"
placeholder="City"
required>

<input type="text"
name="state"
placeholder="State"
required>

<input type="text"
name="zipcode"
placeholder="Zip Code"
required>

<button type="submit">

Place Order

</button>

</form>

</div>

</div>

</body>

</html>