<%@ page import="java.sql.*" %>
<%@ page import="com.swetha.ecommerce.util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>My Cart</title>

<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

<body>

<header>

<a href="index.jsp" class="logo">Jewelry World</a>

<nav>

<a href="index.jsp">Home</a>

<a href="products.jsp">Products</a>

</nav>

</header>

<section class="cart-page">

<h1>
    <i class="fa-solid fa-cart-shopping"></i>
    My Shopping Cart
</h1>

<%

String email=(String)session.getAttribute("user");

double grandTotal=0;

Connection con=DBConnection.getConnection();

String sql="SELECT cart.id,products.*,"
+"cart.quantity "
+"FROM cart INNER JOIN products "
+"ON cart.product_id=products.id "
+"WHERE cart.email=?";

PreparedStatement ps=con.prepareStatement(sql);

ps.setString(1,email);

ResultSet rs=ps.executeQuery();

while(rs.next()){

double subtotal=
rs.getDouble("price")*
rs.getInt("quantity");

grandTotal+=subtotal;

%>

<div class="cart-card">

<div class="cart-image">

<img src="images/<%=rs.getString("image")%>">

</div>

<div class="cart-details">

<h2><%=rs.getString("name")%></h2>

<p><%=rs.getString("description")%></p>

<h3>$<%=rs.getDouble("price")%></h3>

<p>

Quantity :
<b><%=rs.getInt("quantity")%></b>

</p>

<h3>

Subtotal : $<%=subtotal%>

</h3>

<a class="remove-btn"
href="RemoveCartServlet?id=<%=rs.getInt("id")%>">

Remove

</a>

</div>

</div>

<%

}

%>

<div class="cart-total">

<h2>

Grand Total :
$<%=grandTotal%>

</h2>

<br>

<a href="products.jsp"
class="btn">

Continue Shopping

</a>

<a href="checkout.jsp"
class="btn">

Checkout

</a>

</div>

</section>

</body>

</html>