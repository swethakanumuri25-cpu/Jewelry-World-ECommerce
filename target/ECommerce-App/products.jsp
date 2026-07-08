<%@ page import="java.util.List"%>
<%@ page import="com.swetha.ecommerce.dao.ProductDAO"%>
<%@ page import="com.swetha.ecommerce.model.Product"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Jewelry World | Products</title>

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

<a href="collections.jsp">Collections</a>

<a href="about.jsp">About</a>

<a href="contact.jsp">Contact</a>

</nav>

<div class="nav-icons">

<form action="products.jsp" method="get">

<input
type="text"
name="search"
placeholder="Search Jewelry..."
value="<%=request.getParameter("search")==null?"":request.getParameter("search")%>">

<button type="submit">

<i class="fa-solid fa-magnifying-glass"></i>

</button>

</form>

<a href="wishlist.jsp">
<i class="fa-regular fa-heart"></i>
</a>

<a href="cart.jsp">
<i class="fa-solid fa-cart-shopping"></i>
</a>

<%
String user=(String)session.getAttribute("fullname");

if(user!=null){
%>

<div class="account-menu">

<a href="#" class="account-btn">
<i class="fa-regular fa-user"></i>
</a>

<div class="dropdown-content">

<div class="user-name">

Welcome,<br>

<strong><%=user%></strong>

</div>

<a href="profile.jsp">My Profile</a>

<a href="wishlist.jsp">Wishlist</a>

<a href="orders.jsp">My Orders</a>

<a href="LogoutServlet">Logout</a>

</div>

</div>

<%
}else{
%>

<a href="login.jsp">
<i class="fa-regular fa-user"></i>
</a>

<%
}
%>

</div>

</header>

<section class="products">

<h2>Our Jewelry Collection</h2>

<div class="category-buttons">

<a href="products.jsp">All</a>

<a href="products.jsp?category=Ring">Rings</a>

<a href="products.jsp?category=Necklace">Necklaces</a>

<a href="products.jsp?category=Bracelet">Bracelets</a>

<a href="products.jsp?category=Earrings">Earrings</a>

</div>

<div class="product-grid">

<%

ProductDAO dao = new ProductDAO();

String search = request.getParameter("search");
String category = request.getParameter("category");

List<Product> list;

if(search != null && !search.trim().isEmpty()){

    list = dao.searchProducts(search);

}
else if(category != null && !category.trim().isEmpty()){

    list = dao.getProductsByCategory(category);

}
else{

    list = dao.getAllProducts();

}

if(list.isEmpty()){

%>

<h2 style="text-align:center;color:#777;margin:60px auto;">
No products found.
</h2>

<%

}

for(Product p : list){

%>

<div class="product-card">

<img src="images/<%=p.getImage()%>" alt="<%=p.getName()%>">

<h3><%=p.getName()%></h3>

<div class="rating">

    <i class="fa-solid fa-star"></i>
    <span><%=p.getRating()%></span>
    
</div>

<p>$<%=p.getPrice()%></p>

<a href="productDetails.jsp?id=<%=p.getId()%>">

<button>View Details</button>

</a>

<a href="AddWishlistServlet?id=<%=p.getId()%>" class="wishlist-btn">

<i class="fa-regular fa-heart"></i>

</a>

<br><br>

<a href="AddToCartServlet?id=<%=p.getId()%>">

<button>Add to Cart</button>

</a>

</div>

<%

}

%>

</div>

</section>

<footer>

<p>&copy; 2022 Jewelry World</p>

</footer>

</body>

</html>