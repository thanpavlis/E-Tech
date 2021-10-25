<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<head>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/logo3.png" sizes="48x48">
    <link rel="stylesheet" href="./css/navbar.css"> 
    <link rel="stylesheet" href="./css/modal.css"> 
    <link rel="stylesheet" href="./css/cart.css">
</head>
<header>
    <nav class="main-nav">
        <c:url var="desktops" value="/products" >
            <c:param name="category" value="1"/>
        </c:url>
        <c:url var="laptops" value="/products" >
            <c:param name="category" value="2"/>
        </c:url>
        <c:url var="phones" value="/products" >
            <c:param name="category" value="3"/>
        </c:url>
        <c:url var="mouses" value="/products" >
            <c:param name="category" value="4"/>
        </c:url>
        <c:url var="keyboards" value="/products" >
            <c:param name="category" value="5"/>
        </c:url>
        <c:url var="headphones" value="/products" >
            <c:param name="category" value="6"/>
        </c:url>
        <c:url var="favourites" value="/products" >
            <c:param name="favourites" value="true"/>
        </c:url>     
        <ul>
            <li><a href="${pageContext.request.contextPath}/products" class="logo"><img src="./images/logo3.png" alt="logo" /></a></li>      
                    <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            <c:if test="${sessionScope.user.role == 'ROLE_USER'}">
                        <li><a href="${favourites}" id="favs">Favourites &nbsp;&nbsp;&nbsp;<i class="fas fa-heart"></i></a></li>
                            </c:if>
                            <c:if test="${sessionScope.user.role == 'ROLE_ADMIN'}">
                        <li><a href="${pageContext.request.contextPath}/orders" id="orders">Orders &nbsp;&nbsp;&nbsp;<i class="fas fa-shipping-fast"></i></a></li>
                        <li><a href="${pageContext.request.contextPath}/stock" id="allProducts">Stock &nbsp;&nbsp;&nbsp;<i class="fas fa-warehouse"></i></a></li>
                            </c:if>
                    <li><a href="${pageContext.request.contextPath}/logout" id="logout">Logout &nbsp;&nbsp;&nbsp;<i class="fas fa-power-off"></i></a></li>
                        </c:when>
                        <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/login" id="login">Login &nbsp;&nbsp;&nbsp;<i class="fas fa-user"></i></a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${sessionScope.user == null || sessionScope.user.role == 'ROLE_USER'}">
                <li id="cart-icon">
                    <a href="#">
                        Cart &nbsp;&nbsp;&nbsp;<i class="fas fa-shopping-cart"></i>
                        <span id='label-cart-counter' class='badge badge-warning'></span>
                    </a>
                </li>       
            </c:if>         
        </ul>
    </nav>
    <nav class="second-nav">
        <ul>
            <li><a href="${phones}">Mobiles &nbsp;&nbsp;&nbsp;<i class="fas fa-mobile-alt"></i></a></li>
            <li><a href="${desktops}">PC &nbsp;&nbsp;&nbsp;<i class="fas fa-desktop"></i></a></li>
            <li><a href="${laptops}">Laptops &nbsp;&nbsp;&nbsp;<i class="fas fa-laptop"></i></a></li>
            <li class="dropdown-li">
                <div class="my-dropdown">
                    <a class="dropbtn">Gadgets&nbsp;&nbsp;<i class="fas fa-mouse"></i>&nbsp;&nbsp;<i class="fa fa-caret-down"></i></a>
                    <div class="dropdown-content">
                        <a href="${keyboards}">Keyboards &nbsp;&nbsp;<i class="fas fa-keyboard"></i> </a>
                        <a href="${mouses}">Mouses &nbsp;&nbsp;<i class="fas fa-mouse"></i></a>
                        <a href="${headphones}">Headphones &nbsp;&nbsp;<i class="fas fa-headphones"></i></a>
                    </div>
                </div>
            </li>
            <li class="dropdown-hidden" style="display: none;">
                <a href="${keyboards}">Keyboards &nbsp;&nbsp;<i class="fas fa-keyboard"></i> </a>  
            </li>
            <li class="dropdown-hidden" style="display: none;">
                <a href="${mouses}">Mouses &nbsp;&nbsp;<i class="fas fa-mouse"></i></a> 
            </li>
            <li class="dropdown-hidden" style="display: none;">
                <a href="${headphones}">Headphones &nbsp;&nbsp;<i class="fas fa-headphones"></i></a> 
            </li>

            <li><a href="${pageContext.request.contextPath}/customer-service">Customer Service &nbsp;&nbsp;&nbsp;<i class="far fa-comment-dots"></i></a></li>
        </ul>
        <label for="" id="icon">
            <i class="fas fa-bars"></i>
        </label>
    </nav>
</header>
<c:if test="${sessionScope.user == null || sessionScope.user.role == 'ROLE_USER'}">
    <input id="modal" type="checkbox" style="display: none;">
    <label for="modal" class="example-label" style="display: none;"></label>
    <label for="modal" class="modal-background"></label>
    <div class="modal">
        <div class="modal-header">
            <h3>Cart</h3>
            <label for="modal">
                <img style="padding-top:5px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAdVBMVEUAAABNTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU0N3NIOAAAAJnRSTlMAAQIDBAUGBwgRFRYZGiEjQ3l7hYaqtLm8vsDFx87a4uvv8fP1+bbY9ZEAAAB8SURBVBhXXY5LFoJAAMOCIP4VBRXEv5j7H9HFDOizu2TRFljedgCQHeocWHVaAWStXnKyl2oVWI+kd1XLvFV1D7Ng3qrWKYMZ+MdEhk3gbhw59KvlH0eTnf2mgiRwvQ7NW6aqNmncukKhnvo/zzlQ2PR/HgsAJkncH6XwAcr0FUY5BVeFAAAAAElFTkSuQmCC" width="16" height="16" alt="">
            </label>
        </div>         
        <div id="cartContent"></div>
        <div id="stockNotify"></div>
    </div>
    <script type="text/javascript" src="./js/cart.js"></script>
    <script>
        updateCart();
    </script>
</c:if>        
<script type="text/javascript" src="./js/navbar.js"></script> 