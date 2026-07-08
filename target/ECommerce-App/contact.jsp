<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Contact Us | Jewelry World</title>

<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.contact-page{

    width:90%;
    max-width:1200px;
    margin:50px auto;

}

.contact-page h1{

    text-align:center;
    color:#6B3F00;
    font-size:48px;
    margin-bottom:15px;

}

.contact-page p{

    text-align:center;
    color:#666;
    margin-bottom:40px;
    font-size:18px;

}

.contact-container{

    display:grid;
    grid-template-columns:1fr 1fr;
    gap:40px;

}

.contact-info{

    background:white;
    padding:35px;
    border-radius:20px;
    box-shadow:0 10px 25px rgba(0,0,0,.12);

}

.contact-info h2{

    color:#6B3F00;
    margin-bottom:25px;

}

.contact-item{

    display:flex;
    align-items:center;
    margin-bottom:25px;

}

.contact-item i{

    width:50px;
    height:50px;
    background:#6B3F00;
    color:white;
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    margin-right:15px;
    font-size:20px;

}

.contact-form{

    background:white;
    padding:35px;
    border-radius:20px;
    box-shadow:0 10px 25px rgba(0,0,0,.12);

}

.contact-form input,
.contact-form textarea{

    width:100%;
    padding:14px;
    margin-bottom:18px;
    border:1px solid #ddd;
    border-radius:10px;
    font-size:16px;

}

.contact-form textarea{

    resize:none;
    height:150px;

}

.contact-form button{

    background:#6B3F00;
    color:white;
    border:none;
    padding:14px 35px;
    border-radius:30px;
    cursor:pointer;
    font-size:17px;

}

.contact-form button:hover{

    background:#B8860B;

}

.map{

    margin-top:50px;

}

.map iframe{

    width:100%;
    height:400px;
    border:none;
    border-radius:20px;

}

@media(max-width:900px){

.contact-container{

grid-template-columns:1fr;

}

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

<section class="contact-page">

<h1>Contact Us</h1>

<p>We'd love to hear from you.</p>

<div class="contact-container">

<div class="contact-info">

<h2>Get In Touch</h2>

<div class="contact-item">

<i class="fa-solid fa-location-dot"></i>

<div>

<h3>Address</h3>

<p>123 Jewelry Street, Dallas, Texas</p>

</div>

</div>

<div class="contact-item">

<i class="fa-solid fa-phone"></i>

<div>

<h3>Phone</h3>

<p>+1 (555) 123-4567</p>

</div>

</div>

<div class="contact-item">

<i class="fa-solid fa-envelope"></i>

<div>

<h3>Email</h3>

<p>support@jewelryworld.com</p>

</div>

</div>

<div class="contact-item">

<i class="fa-solid fa-clock"></i>

<div>

<h3>Working Hours</h3>

<p>Mon - Sat : 9:00 AM - 7:00 PM</p>

</div>

</div>

</div>

<div class="contact-form">

<h2>Send Message</h2>

<form>

<input type="text" placeholder="Your Name" required>

<input type="email" placeholder="Your Email" required>

<input type="text" placeholder="Subject">

<textarea placeholder="Your Message"></textarea>

<button type="submit">

Send Message

</button>

</form>

</div>

</div>

<div class="map">

<iframe
src="https://www.google.com/maps?q=Dallas,Texas&output=embed"
loading="lazy">
</iframe>

</div>

</section>

<footer>

<p>&copy; 2022 Jewelry World</p>

</footer>

</body>

</html>