<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Jewelry Collections</title>

<link rel="stylesheet" href="css/style.css">

<style>

.collections-page{

    width:90%;

    margin:50px auto;

}

.collections-page h1{

    text-align:center;

    color:#6B3F00;

    font-size:48px;

    margin-bottom:15px;

}

.collections-page p{

    text-align:center;

    color:#666;

    margin-bottom:40px;

    font-size:20px;

}

.collection-grid{

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(260px,1fr));

    gap:30px;

}

.collection-card{

    background:white;

    border-radius:18px;

    overflow:hidden;

    box-shadow:0 10px 25px rgba(0,0,0,.15);

    transition:.3s;

}

.collection-card:hover{

    transform:translateY(-8px);

}

.collection-card img{

    width:100%;

    height:260px;

    object-fit:cover;

}

.collection-card h2{

    text-align:center;

    margin:18px 0;

    color:#6B3F00;

}

.collection-card a{

    display:block;

    width:170px;

    margin:20px auto;

    padding:12px;

    text-align:center;

    background:#6B3F00;

    color:white;

    text-decoration:none;

    border-radius:30px;

}

.collection-card a:hover{

    background:#B8860B;

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

<section class="collections-page">

<h1>

Our Collections

</h1>

<p>

Discover timeless elegance crafted for every occasion.

</p>

<div class="collection-grid">

<div class="collection-card">

<img src="images/ring.jpg">

<h2>Rings</h2>

<a href="products.jsp?category=Ring">

Shop Now

</a>

</div>

<div class="collection-card">

<img src="images/necklace.jpg">

<h2>Necklaces</h2>

<a href="products.jsp?category=Necklace">

Shop Now

</a>

</div>

<div class="collection-card">

<img src="images/earrings.jpg">

<h2>Earrings</h2>

<a href="products.jsp?category=Earrings">

Shop Now

</a>

</div>

<div class="collection-card">

<img src="images/bracelet.jpg">

<h2>Bracelets</h2>

<a href="products.jsp?category=Bracelet">

Shop Now

</a>

</div>

</div>

</section>

<footer class="footer">

<p>

Jewelry World © 2022 | Developed by Swetha Kanumuri

</p>

</footer>

</body>

</html>