<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>E-Shop</title> 
        <link rel="stylesheet" href="./css/products.css"> 
        <link rel="stylesheet" href="./css/notifications.css">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <script type="text/javascript" src="./js/rating.js" defer></script>
        <script type="text/javascript" src="./js/rating2.js" defer></script> 
    </head>
    <body>   
        <jsp:include page="./templates/header.jsp" flush="true"/>   
        <c:url var="newArrivals" value="/products" >
            <c:param name="newArrivals" value="true"/>
        </c:url>  
        <c:if test="${!(empty payment)}">
            <label id="payment" style="display: none;">${payment}</label>  
        </c:if>
        <c:if test="${param.favourites == true && !empty products}">
            <h2 style="text-align: center; font-weight: lighter;">FAVOURITES</h2>
        </c:if>
        <c:if test="${param.favourites == true && empty products}">
            <h2 style="text-align: center; font-weight: lighter;">NO FAVOURITES FOUND</h2>
        </c:if>
        <c:if test="${param.newArrivals == true}">
            <h2 style="text-align: center; font-weight: lighter;">NEW ARRIVALS</h2>
        </c:if>
        <jsp:include page="./templates/carousel.jsp" flush="true"/> 
        <main>
            <jsp:include page="./templates/filters.jsp" flush="true"/>
            <section id="products">
                <ul id="html-item-pagination">
                    <c:forEach items="${products}" var="product">  
                        <c:url var="productLink" value="/product-page">
                            <c:param name="id" value="${product.id}"/>
                        </c:url>
                        <li class="hip-item">
                            <div class="products">
                                <c:if test="${product.newArrival == true}">
                                    <div style="position: absolute; top: -10px; left: -10px; color: white; background-color: red; border: 9px solid red; border-radius: 0px 0px 20px 0px;">
                                        NEW
                                    </div> 
                                </c:if>
                                <c:if test="${!empty product.endDate}">
                                    <fmt:formatDate var="promotion_end_date" value="${product.endDate}" pattern="yyyy-MM-dd"/>
                                    <c:set var="today_date" value="<%=new java.util.Date()%>"/>
                                    <fmt:formatDate var="today_formated_date" value="${today_date}" pattern="yyyy-MM-dd"/>
                                    <c:if test="${promotion_end_date ge today_formated_date}">
                                        <div style="position: absolute; top: -13px; right: -13px; color: red;">
                                            <span class="fa-stack fa-2x">
                                                <i class="fa fa-certificate fa-stack-2x"></i>
                                                <i class="fa fa-tag fa-stack-1x fa-inverse"></i>
                                                <strong class="fa-stack-1x discount-text" style="font-size: x-small;">${product.discount}%</strong>
                                            </span>
                                        </div>
                                    </c:if>
                                </c:if>
                                <div class="img-zoom">
                                    <img src="${product.imageList[0].url}" alt="productimg" onclick="window.location.href = '${productLink}'; return false;"/>
                                </div>
                                <br /><br />
                                <div style="height: 110px;">
                                    <strong class="name" style="height: 35px;" onclick="window.location.href = '${productLink}'; return false;">${product.name}</strong>
                                    <p class="description">
                                        ${product.description}
                                    </p>
                                </div>
                                <c:if test="${param.favourites == true}">
                                    <button id="${product.id}" class="remove-favourite-btn" onclick="removeFavourite(${product.id})">Remove From Favs</button>
                                </c:if>
                                <br /><br />
                                <c:choose> 
                                    <c:when test="${!empty ratings[product.id]}">
                                        <c:set value="${ratings[product.id]}" var="avgRating"></c:set>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set value="0" var="avgRating"></c:set>
                                    </c:otherwise>
                                </c:choose>
                                <div class="rating-price">
                                    <div style="float: left;"><input class="rating2" value="<c:out value="${avgRating}"/>"></div>
                                        <c:choose>
                                            <c:when test="${!empty product.endDate}">
                                                <fmt:formatDate var="promotion_end_date" value="${product.endDate}" pattern="yyyy-MM-dd"/>
                                                <c:set var="today_date" value="<%=new java.util.Date()%>"/>
                                                <fmt:formatDate var="today_formated_date" value="${today_date}" pattern="yyyy-MM-dd"/>
                                                <c:choose>
                                                    <c:when test="${promotion_end_date ge today_formated_date}">                                           
                                                        <c:set var="price"><fmt:formatNumber groupingUsed="false"  type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price-product.price*product.discount/100}" /></c:set>
                                                    <div class="price" style="float: right;">Price <span class="euros">${fn:replace(price, '.', ',')} </span> €</div>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="price"><fmt:formatNumber groupingUsed="false"  type="number" minFractionDigits="2"  maxFractionDigits="2" value="${product.price}" /></c:set>
                                                    <div class="price" style="float: right;">Price <span class="euros">${fn:replace(price, '.', ',')} </span> €</div>
                                                </c:otherwise>
                                            </c:choose>   
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="price"><fmt:formatNumber groupingUsed="false"  type="number" minFractionDigits="2"  maxFractionDigits="2" value="${product.price}" /></c:set>
                                            <div class="price" style="float: right;">Price <span class="euros">${fn:replace(price, '.', ',')} </span> €</div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>                         
                            </div>
                        </li>
                    </c:forEach> 
                </ul>
            </section>  
        </main> 
        <c:if test="${!param.newArrivals == true}">
            <section id="new-arrivals">
                <div style="padding-left: 53%;">
                    <h1 id="arrivals-title">Check Out Our Latest Arrivals</h1>
                    <button id="show-new-arrivals"> 
                        <a href="${newArrivals}" style="text-decoration: none; color: white;">Show All</a>
                    </button>
                </div>
            </section>
        </c:if>    
        <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fas fa-chevron-up"></i></button>
            <jsp:include page="./templates/footer.jsp" flush="true"/>

        <script type="text/javascript" src="./js/hip.js"></script>
        <script type="text/javascript" src="./js/notifications.js"></script>
        <script type="text/javascript" src="./js/favourites.js"></script>
        <script type="text/javascript" src="./js/products.js"></script>
        <script>
            $(document).ready(function ($) {
                $("#html-item-pagination").hip({});
                $('.rating').rating();
                $('.rating2').rating2();
                checkNotifyPayment();
                scrollFunction();
                topFunction();
            });
        </script>  
    </body>
</html>