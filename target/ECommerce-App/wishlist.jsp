<%@ page import="java.sql.*" %>
<%@ page import="com.swetha.ecommerce.util.DBConnection" %>

<%
String user = (String)session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Wishlist</title>

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

<a href="collections.jsp">Collections</a>

<a href="wishlist.jsp">Wishlist</a>

</nav>

</header>

<section class="cart-page">

<h1>

<i class="fa-regular fa-heart"></i>

My Wishlist

</h1>

<%

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(

"SELECT wishlist.id AS wishlist_id, " +
"wishlist.product_id, " +
"products.* " +
"FROM wishlist " +
"INNER JOIN products ON wishlist.product_id = products.id " +
"WHERE wishlist.email=?"

);

ps.setString(1,user);

ResultSet rs = ps.executeQuery();

boolean hasItems = false;

while(rs.next()){

hasItems = true;

%>

<div class="cart-card">

<div class="cart-image">

<img src="images/<%=rs.getString("image")%>">

</div>

<div class="cart-details">

<h2><%=rs.getString("name")%></h2>

<p><%=rs.getString("description")%></p>

<h3>$<%=rs.getDouble("price")%></h3>

<a class="btn"

href="AddToCartServlet?id=<%=rs.getInt("product_id")%>">

Add to Cart

</a>

<a class="remove-btn"

href="RemoveWishlistServlet?id=<%=rs.getInt("product_id")%>">

Remove

</a>

</div>

</div>

<%

}

if(!hasItems){

%>

<h2 style="text-align:center;color:gray;">

<i class="fa-regular fa-heart"></i>
Your wishlist is empty

</h2>

<%

}

rs.close();
ps.close();
con.close();

%>

</section>

</body>

</html>