<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>About Us | Jewelry World</title>

<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.about{

    width:90%;
    max-width:1200px;
    margin:60px auto;
    display:flex;
    align-items:center;
    gap:50px;
    flex-wrap:wrap;

}

.about-image{

    flex:1;

}

.about-image img{

    width:100%;
    border-radius:20px;
    box-shadow:0 10px 25px rgba(0,0,0,.15);

}

.about-content{

    flex:1;

}

.about-content h1{

    color:#6B3F00;
    font-size:48px;
    margin-bottom:20px;

}

.about-content p{

    color:#555;
    line-height:1.8;
    font-size:18px;
    margin-bottom:20px;

}

.features{

    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:20px;
    margin-top:30px;

}

.feature{

    background:white;
    padding:20px;
    border-radius:15px;
    text-align:center;
    box-shadow:0 8px 20px rgba(0,0,0,.1);

}

.feature i{

    font-size:35px;
    color:#B8860B;
    margin-bottom:12px;

}

.feature h3{

    color:#6B3F00;
    margin-bottom:8px;

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

<a href="products.jsp">Products</a>

<a href="collections.jsp">Collections</a>

<a href="about.jsp">About</a>

<a href="contact.jsp">Contact</a>

</nav>

</header>

<section class="about">

<div class="about-image">

<img src="images/necklace.jpg">

</div>

<div class="about-content">

<h1>About Jewelry World</h1>

<p>

Jewelry World is your trusted destination for elegant,
premium-quality jewelry crafted with timeless beauty.
Our collections are designed for every special occasion,
combining luxury, craftsmanship, and affordability.

</p>

<p>

Whether you're looking for engagement rings,
stylish bracelets, elegant necklaces, or everyday accessories,
we ensure every piece reflects sophistication and excellence.

</p>

<div class="features">

<div class="feature">

<i class="fa-solid fa-gem"></i>

<h3>Premium Quality</h3>

<p>Finest handcrafted jewelry.</p>

</div>

<div class="feature">

<i class="fa-solid fa-truck-fast"></i>

<h3>Fast Delivery</h3>

<p>Quick and secure shipping.</p>

</div>

<div class="feature">

<i class="fa-solid fa-award"></i>

<h3>Certified Products</h3>

<p>Authentic and trusted quality.</p>

</div>

<div class="feature">

<i class="fa-solid fa-heart"></i>

<h3>Customer Satisfaction</h3>

<p>Thousands of happy customers.</p>

</div>

</div>

</div>

</section>

<footer>

<p>&copy; 2022 Jewelry World</p>

</footer>

</body>

</html>