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
        <title>Product</title>
        <link rel="stylesheet" href="./css/product.css" />
        <link rel="stylesheet" href="./css/slider.css" /> 
        <link rel="stylesheet" href="./css/notifications.css"> 
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <script type="text/javascript" src="./js/rating.js" defer></script>
        <script type="text/javascript" src="./js/rating2.js" defer></script>
    </head>
    <body>   
        <jsp:include page="./templates/header.jsp" flush="true"/>
        <div id="sticky-nav">
            <ul id="small-nav">
                <li><a class="active" href="#product">Product</a></li>
                <li><a href="#comment-title">Comments</a></li>
                <li><a href="#rating-title">Rating</a></li>
            </ul>
        </div>
        <div class="container">
            <div>

            </div>
            <div class="images">
                <div class="slideshow-container">
                    <c:forEach items="${productImages}" var="productImage">
                        <div class="mySlides fade">
                            <div class="image-div">
                                <img src="${productImage.url}" alt="productimg"/>
                            </div>
                        </div>    
                    </c:forEach>
                </div>
                <br><br>
                <div style="text-align: center">
                    <c:forEach items="${productImages}" var="productImage" varStatus="theCount">
                        <span class="dot" onclick="currentSlide(${theCount.count})"></span>     
                    </c:forEach>
                </div>
            </div>
            <div id="product">
                <h2>
                    <c:if test="${product.newArrival == true}"><span id="new-arrival">NEW</span>&nbsp;</c:if>${product.name}
                    <c:if test="${sessionScope.user != null}">
                        <c:if test="${!empty favourite}">
                            <c:set value="red-heart" var="cssClass"></c:set>
                        </c:if> 
                    </c:if>
                    <c:if test="${sessionScope.user == null || sessionScope.user.role == 'ROLE_USER'}">
                        <span class="${cssClass}" id="heart"><i class="fas fa-heart"></i></span>
                        </c:if> 
                </h2>
                <div class="description">
                    <c:choose> 
                        <c:when test="${product.categoryId.id == '1' || product.categoryId.id == '2' || product.categoryId.id == '3'}">
                            Χαρακτηριστικά:
                            <br />
                            <ul>
                                <c:forEach var="descriptionItem" items="${fn:split(product.description,',')}">
                                    <li>${descriptionItem}</li>   
                                    </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            Περιγραφή:
                            <br />
                            <p style="padding-left: 18px;">
                                ${product.description}
                            </p>
                        </c:otherwise>
                    </c:choose>
                    <br /><br />
                </div>
                <c:choose> 
                    <c:when test="${!empty rating}">
                        <c:set value="${rating}" var="avgRating"></c:set>
                    </c:when>
                    <c:otherwise>
                        <c:set value="0" var="avgRating"></c:set>
                    </c:otherwise>
                </c:choose>
                <div class="rating-price">
                    <div style="float: left"><input class="rating2" value="<c:out value="${avgRating}"/>" /></div>
                        <c:choose>
                            <c:when test="${!empty product.endDate}">
                                <fmt:formatDate var="promotion_end_date" value="${product.endDate}" pattern="yyyy-MM-dd"/>
                                <c:set var="today_date" value="<%=new java.util.Date()%>"/>
                                <fmt:formatDate var="today_formated_date" value="${today_date}" pattern="yyyy-MM-dd"/>
                                <c:choose>
                                    <c:when test="${promotion_end_date ge today_formated_date}">                                           
                                        <c:set var="discount"><fmt:formatNumber groupingUsed="false"  type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price-product.price*product.discount/100}" /></c:set>
                                        <c:set var="price"><fmt:formatNumber groupingUsed="false"  type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price}" /></c:set>
                                    <div class="price" style="float: right;">Price <span class="euros" style="text-decoration: line-through;">${fn:replace(price, '.', ',')} </span> € <br>
                                        <span id="after-discount" class="euros" style="color: red; font-size: 1.2em; padding-left: 32px;">${fn:replace(discount, '.', ',')}</span> <span style="color: red; font-size: 1.2em;">€</span>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="price"><fmt:formatNumber groupingUsed="false"  type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price}" /></c:set>
                                    <div class="price" style="float: right;">Price <span class="euros">${fn:replace(price, '.', ',')} </span> €</div>
                                </c:otherwise>
                            </c:choose>   
                        </c:when>
                        <c:otherwise>
                            <c:set var="price"><fmt:formatNumber groupingUsed="false"  type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price}" /></c:set>
                            <div class="price" style="float: right;">Price <span class="euros">${fn:replace(price, '.', ',')} </span> €</div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <br /><br /><br /><br />
                <div>
                    <c:if test="${sessionScope.user == null || sessionScope.user.role == 'ROLE_USER'}">
                        <c:choose>
                            <c:when test="${product.stock == 0}">
                                <button class="cart-btn" onload="document.getElementById('cart-btn').disabled = true;" style="opacity: 0.4;">Out Of Stock&nbsp;&nbsp;<i class="fas fa-shopping-cart"></i></button>
                                </c:when>
                                <c:otherwise>
                                <button id="${product.id}" class="cart-btn"  onclick="addToCartProduct(${product.id})">Add To Cart&nbsp;&nbsp;<i class="fas fa-shopping-cart"></i></button>
                                </c:otherwise>    
                            </c:choose>  
                        </c:if>     
                </div>
            </div>
            <div>
            </div>
        </div>
        <div id="comment-title">
            <h2>Comments&nbsp;&nbsp;<i class="fas fa-comment"></i></h2>
        </div>   
        <div class="comments-container"> 
            <div>
            </div>
            <div style="margin-top: 70px; margin-bottom: 70px;">
                <c:choose> 
                    <c:when test="${empty product.commentList}"> 
                        <h2 style="font-weight: lighter; text-align: center;">
                            There Are No Comments For This Product At The Moment. <br>Be The First To Write One. 
                        </h2>
                        <button id="add-comment" style="margin-right: 39%;">Add Comment</button>
                        <br /><br />
                        <ul id="text-form">        
                            <form id="comment-form" action="/product-page/saveComment" method="POST">
                                <strong>Write A Comment</strong>
                                <textarea class="textarea" name="text" required></textarea>
                                <input type="hidden" id="prodId" name="productId" value="${product.id}">
                                <input id="submit-comment" type="submit" value="Submit" />
                            </form>
                        </ul>
                        <br /><br />
                    </c:when>
                    <c:otherwise>
                        <button id="add-comment">Add Comment</button>
                        <br /><br />
                        <ul id="text-form">    
                            <form id="comment-form" action="/product-page/saveComment" method="POST">
                                <strong>Write A Comment</strong>
                                <textarea class="textarea" name="text" required></textarea>
                                <input type="hidden" id="prodId" name="productId" value="${product.id}">
                                <input id="submit-comment" type="submit" value="Submit" />
                            </form>
                        </ul>
                        <br /><br />
                        <ul>
                            <c:forEach items="${comments}" var="comment">                                 
                                <li class="comments">
                                    <c:if test="${sessionScope.user.role == 'ROLE_ADMIN'}">
                                        <span id="${comment.id}" class="delete-comment"><i class="fas fa-trash"></i></span>
                                        </c:if>
                                    <div>
                                        <h3>
                                            <c:choose>
                                                <c:when test="${comment.userId.roleList[0].roleName == 'ROLE_ADMIN'}">
                                                    E-Tech&nbsp;&nbsp;&nbsp;&nbsp;
                                                </c:when>
                                                <c:otherwise>
                                                    ${comment.userId.firstName} ${comment.userId.lastName}&nbsp;&nbsp;&nbsp;&nbsp;
                                                </c:otherwise>
                                            </c:choose>
                                            <span class="date">
                                                <fmt:formatDate type = "date" dateStyle = "short" timeStyle = "short" value = "${comment.comdate}" />
                                            </span>
                                        </h3>
                                        <c:if test="${comment.userId.roleList[0].roleName != 'ROLE_ADMIN'}">
                                            <c:forEach items="${comment.userId.ratingList}" var="rating">   
                                                <c:if test="${rating.product.id == product.id}">
                                                    <input class="rating2" value="${rating.ratingNum}" />
                                                </c:if>
                                            </c:forEach>    
                                        </c:if>
                                    </div>
                                    <p>
                                        ${comment.commentText}
                                    </p>
                                </li>
                            </c:forEach>   
                        </ul>
                    </c:otherwise>
                </c:choose>
                <br /><br />
            </div>
            <div></div>
        </div>
        <div id="rating-title">
            <h2>Rate Product&nbsp;&nbsp;<i class="fas fa-star"></i></h2>  
        </div>
        <div id="rating-form">
            <c:choose>
                <c:when test="${sessionScope.user != null && !empty userRating}">
                    <div id="edit-rating-div">
                        <h2 style="font-weight: lighter; margin-top: 70px;">Your Rating For This Product Is </h2>
                        <input class="rating2" value="${userRating}" />
                        <button id="add-rating" class="edit-rating-btn">Edit Rating</button>
                    </div>  
                </c:when>
                <c:otherwise>
                    <c:set value="show-rate-comment" var="showRate"></c:set>
                </c:otherwise>    
            </c:choose>
            <div id="rate-comment" class="${showRate}">
                <h2 style="font-weight: lighter; margin-top: 70px;">Rate The Present Product From 1 To 5 Stars </h2>
                <form action="/product-page/saveRating" onsubmit="return checkRatingValid()" method="POST">
                    <input id="rating_value" class="rating" name="rating"/>
                    <input type="hidden" id="product-id" name="productId" value="${product.id}">
                    <button id="add-rating" type="submit">Rate Product</button>
                </form>
            </div>
        </div>   
        <jsp:include page="./templates/footer.jsp" flush="true"/>
        <script type="text/javascript" src="./js/slider.js"></script>    
        <script type="text/javascript" src="./js/notifications.js"></script> 
        <script type="text/javascript" src="./js/product.js"></script>

    </body>
</html>