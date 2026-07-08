<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Payment</title>

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

<a href="cart.jsp">Cart</a>

</nav>

</header>

<section class="payment-page">

<h1>
Payment
</h1>

<div class="payment-box">

<form action="PlaceOrderServlet" method="post">
<input type="hidden" name="fullname" value="<%=request.getParameter("fullname")%>">
<input type="hidden" name="email" value="<%=request.getParameter("email")%>">
<input type="hidden" name="address" value="<%=request.getParameter("address")%>">
<input type="hidden" name="city" value="<%=request.getParameter("city")%>">
<input type="hidden" name="state" value="<%=request.getParameter("state")%>">
<input type="hidden" name="zipcode" value="<%=request.getParameter("zipcode")%>">

<h2>Select Payment Method</h2>

<label>

<input
type="radio"
name="payment"
value="Card"
checked>

Credit / Debit Card

</label>

<label>

<input
type="radio"
name="payment"
value="UPI">

UPI

</label>

<label>

<input
type="radio"
name="payment"
value="COD">

Cash On Delivery

</label>

<hr>

<input
type="text"
name="cardname"
placeholder="Card Holder Name">

<input
type="text"
name="cardnumber"
placeholder="Card Number">

<div class="payment-row">

<input
type="text"
name="expiry"
placeholder="MM/YY">

<input
type="password"
name="cvv"
placeholder="CVV">

</div>

<button class="pay-btn">

Pay & Place Order

</button>

</form>

</div>

</section>

</body>

</html>