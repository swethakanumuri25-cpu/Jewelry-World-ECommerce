<%@ page import="java.sql.*" %>
<%@ page import="com.swetha.ecommerce.util.DBConnection" %>
<%@ page import="com.swetha.ecommerce.dao.ProductDAO"%>
<%@ page import="com.swetha.ecommerce.model.Product"%>

<%
int id = Integer.parseInt(request.getParameter("id"));

ProductDAO dao = new ProductDAO();

Product p = dao.getProductById(id);
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title><%=p.getName()%></title>

<link rel="stylesheet" href="css/style.css">

<style>

.product-details{

    width:90%;

    max-width:1100px;

    margin:50px auto;

    display:flex;

    gap:50px;

    align-items:center;

}

.product-details img{

    width:420px;

    border-radius:20px;

    box-shadow:0 10px 25px rgba(0,0,0,.15);

}

.info{

    flex:1;

}

.info h1{

    color:#6B3F00;

    font-size:46px;

}

.price{

    color:#B8860B;

    font-size:34px;

    margin:20px 0;

    font-weight:bold;

}

.category{

    font-size:20px;

    margin-bottom:15px;

}

.description{

    color:#555;

    line-height:1.8;

    font-size:18px;

    margin-bottom:30px;

}

.buttons{

    display:flex;

    gap:20px;

}

.buttons a{

    text-decoration:none;

}

</style>

</head>

<body>

<header>

<a href="index.jsp" class="logo">

Jewelry World

</a>

<nav>

<a href="index.jsp">Home</a>

<a href="collections.jsp">Collections</a>

<a href="products.jsp">Products</a>

<a href="about.jsp">About</a>

<a href="contact.jsp">Contact</a>

</nav>

</header>

<section class="product-details">

<img src="images/<%=p.getImage()%>">

<div class="info">

<h1><%=p.getName()%></h1>

<div class="rating">

    <i class="fa-solid fa-star"></i>
    
    <%=String.format("%.1f",p.getRating())%>/5
    
</div>

<div class="price">

$<%=p.getPrice()%>

</div>

<div class="category">

<b>Category:</b>

<%=p.getCategory()%>

</div>

<div class="description">

<%=p.getDescription()%>

</div>

<div class="buttons">

    <a href="AddToCartServlet?id=<%=p.getId()%>">
    
    <button class="btn">
    
    Add to Cart
    
    </button>
    
    </a>
    
    <a href="checkout.jsp">
    
    <button class="btn">
    
    Buy Now
    
    </button>
    
    </a>
    
    <a href="rateProduct.jsp?id=<%=p.getId()%>">
    
    <button class="btn">
    
    Rate Product
    
    </button>
    
    </a>
    
</div>

</section>

<section class="reviews">

    <h2>
    
    Customer Reviews
    
    </h2>
    
    <%
    
    Connection con = DBConnection.getConnection();
    
    PreparedStatement ps = con.prepareStatement(
    
    "SELECT * FROM reviews WHERE product_id=? ORDER BY review_date DESC"
    
    );
    
    ps.setInt(1,p.getId());
    
    ResultSet rs = ps.executeQuery();
    
    boolean found = false;
    
    while(rs.next()){
    
    found = true;
    
    %>
    
    <div class="review-card">
    
    <h3>
    
    <%=rs.getString("name")%>
    
    </h3>
    
    <p>
    
    <b>Rating:</b>
    
    <%=rs.getInt("rating")%>/5 
    <i class="fa-solid fa-star"></i>
    
    </p>
    
    <p>
    
    <%=rs.getString("review")%>
    
    </p>
    
    <hr>
    
    </div>
    
    <%
    
    }
    
    if(!found){
    
    %>
    
    <p>
    
    No reviews yet.
    
    Be the first to review this product!
    
    </p>
    
    <%
    
    }
    
    rs.close();
    ps.close();
    con.close();
    
    %>
    
</section>

<footer class="footer">

<p>

    &copy; 2022 Jewelry World | Crafted with Elegance

</p>

</footer>

</body>

</html>