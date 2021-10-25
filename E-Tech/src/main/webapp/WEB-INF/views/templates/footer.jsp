<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<head>
    <link rel="stylesheet" href="./css/footer.css"> 
</head>
<div class="footer-container">
    <div class="footer">
        <div class="footer-heading footer-1">
            <c:url var="desktops" value="/products" >
                <c:param name="category" value="1"/>
            </c:url>
            <c:url var="laptops" value="/products" >
                <c:param name="category" value="2"/>
            </c:url>
            <c:url var="phones" value="/products" >
                <c:param name="category" value="3"/>
            </c:url>
            <c:url var="gadgets" value="/products" >
                <c:param name="category" value="7"/>
            </c:url>
            <ul>
                <u><h2>Categories</h2></u>  
                <li>
                    <a href="${phones}">&nbsp;<i class="fas fa-mobile-alt"></i> &nbsp;&nbsp;&nbsp;Mobile Phones</a>
                </li>
                <br />
                <li>
                    <a href="${desktops}"><i class="fas fa-desktop"></i> &nbsp;&nbsp;Pc Desktops</a>
                </li>
                <br />
                <li>
                    <a href="${laptops}"><i class="fas fa-laptop"></i> &nbsp;&nbsp;Laptops</a>
                </li>
                <br />
                <li>
                    <a href="${gadgets}">&nbsp;<i class="fas fa-mouse"></i> &nbsp;&nbsp;&nbsp;Gadgets</a>
                </li>
                <br />
            </ul>
        </div>
        <div class="footer-heading footer-2">
            <ul>
                <u><h2>Social Media</h2></u>
                <li>
                    <a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-square"></i> &nbsp;&nbsp;Facebook</a>
                </li>
                <br />
                <li>
                    <a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i> &nbsp;&nbsp;Instagram</a>
                </li>
                <br />
                <li>
                    <a href="https://twitter.com/?lang=el" target="_blank"><i class="fab fa-twitter"></i> &nbsp;&nbsp;Twitter</a>
                </li>
                <br />
            </ul>
        </div>
        <div class="footer-heading footer-3">
            <ul>
                <u><h2>Contact Us</h2></u>
                <li>
                    <a href="javascript: void(0)"><i class="fas fa-building"></i> &nbsp;&nbsp;&nbsp;Athens</a>
                </li>
                <br />
                <li>
                    <a href="javascript: void(0)"><i class="fas fa-map-marker-alt"></i> &nbsp;&nbsp;&nbsp;Omonoia 39</a>
                </li>
                <br />
                <li>
                    <a href="javascript: void(0)"><i class="fas fa-phone"></i> &nbsp;&nbsp;210-1234567</a>
                </li>
                <br />
                <li>
                    <a href="javascript: void(0)"><i class="fas fa-envelope"></i> &nbsp;&nbsp;infoetech13@gmail.com</a>
                </li>
                <br />
            </ul>
        </div>
        <div class="footer-email-form">
            <ul>
                <u id="find-us"><h2>Find Us</h2></u>
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5444.0124210011845!2d23.728058474425957!3d37.97999415260424!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14a1bd1d0537ed91%3A0xd71dcf7d2b435255!2sPeopleCert!5e0!3m2!1sel!2sgr!4v1627984036467!5m2!1sel!2sgr"
                    width="600"
                    height="340"
                    style="border: 0"
                    allowfullscreen=""
                    loading="lazy"
                    ></iframe>
            </ul>
        </div>
    </div>
</div>
<div class="footer-copyright">
    Copyright © 2011-2021 E-Tech inc. All Right Reserved.
</div>