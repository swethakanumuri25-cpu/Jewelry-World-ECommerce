<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.swetha.ecommerce.util.DBConnection" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Jewelry World | Home</title>

    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

<script>

    const btn = document.getElementById("accountBtn");
    const menu = document.getElementById("accountDropdown");
    
    btn.addEventListener("click", function(e){
        e.preventDefault();
        e.stopPropagation();
        menu.classList.toggle("show");
    });
    
    document.addEventListener("click", function(e){
    
        if(!menu.contains(e.target) && !btn.contains(e.target)){
            menu.classList.remove("show");
        }
    
    });
    
    </script>

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
                    placeholder="Search Jewelry...">
            
                <button type="submit">
            
                    <i class="fa-solid fa-magnifying-glass"></i>
            
                </button>
            
            </form>
    
            <a href="wishlist.jsp" title="Wishlist">
                <i class="fa-regular fa-heart"></i>
            </a>
    
            <a href="cart.jsp" title="Shopping Cart">
                <i class="fa-solid fa-cart-shopping"></i>
            </a>
    
            <%
                String user = (String) session.getAttribute("fullname");
    
                if(user != null){
            %>
    
            <div class="account-menu">

                <a href="javascript:void(0)" class="account-btn" id="accountBtn">
                    <i class="fa-regular fa-user"></i>
                </a>
            
                <div class="dropdown-content" id="accountDropdown">
            
                    <div class="user-name">
                        Welcome,<br>
                        <strong><%= user %></strong>
                    </div>
            
                    <a href="profile.jsp">My Profile</a>
                    <a href="wishlist.jsp">Wishlist</a>
                    <a href="orders.jsp">My Orders</a>
                    <a href="LogoutServlet">Logout</a>
            
                </div>
            
            </div>
    
        </div>
    
            <%
                } else {
            %>
    
            <a href="login.jsp" title="Login">
                <i class="fa-regular fa-user"></i>
            </a>
    
            <%
                }
            %>
    
        </div>
    
    </header>

<section class="hero">

    <h1>Luxury Jewelry Collection</h1>

    <p>
        Discover timeless elegance crafted with love and brilliance.
    </p>

    <a href="products.jsp" class="btn">
        Shop Collection
    </a>

</section>

<section class="categories">

    <h2>Shop By Category</h2>

    <div class="category-grid">

        <a href="products.jsp?category=Ring" class="category-card">
    
            <img src="images/ring.jpg" alt="Rings">
    
            <h3>Rings</h3>
    
        </a>
    
        <a href="products.jsp?category=Necklace" class="category-card">
    
            <img src="images/necklace.jpg" alt="Necklaces">
    
            <h3>Necklaces</h3>
    
        </a>
    
        <a href="products.jsp?category=Earrings" class="category-card">
    
            <img src="images/earrings.jpg" alt="Earrings">
    
            <h3>Earrings</h3>
    
        </a>
    
        <a href="products.jsp?category=Bracelet" class="category-card">
    
            <img src="images/bracelet.jpg" alt="Bracelets">
    
            <h3>Bracelets</h3>
    
        </a>
    
    </div>

</section>

<section class="products">

    <h2>Featured Jewelry</h2>

    <div class="product-grid">

    <%

        try{

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM products LIMIT 4");

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

    %>

        <div class="product-card">

            <img src="images/<%=rs.getString("image")%>">

            <h3><%=rs.getString("name")%></h3>

            <p>$<%=rs.getDouble("price")%></p>

            <a href="AddToCartServlet?id=<%=rs.getInt("id")%>">

                <button>Add to Cart</button>

            </a>

        </div>

    <%

            }

            con.close();

        }

        catch(Exception e){

            e.printStackTrace();

        }

    %>

    </div>

</section>

<footer>

    <p>&copy; 2022 Jewelry World | Crafted with Elegance</p>

</footer>

</body>

</html>