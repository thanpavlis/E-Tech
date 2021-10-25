<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<head>
    <link rel="stylesheet" href="./css/carousel.css">     
</head>
<c:if test="${!(empty promotions) && empty param}">
    <section id="carousel">
        <h2>DISCOUNTS</h2>
        <div class="slideshow-container">
            <c:forEach items="${promotions}" var="promotion" varStatus="theCount">
                <c:url var="productLink" value="/product-page">
                    <c:param name="id" value="${promotion.id}"/>
                </c:url>
                <div class="mySlides fade">
                    <div class="numbertext">${theCount.count} / ${promotions.size()}</div>
                    <div>
                        <div class="image-div" onclick="window.location.href = '${productLink}'; return false;" style="cursor: pointer">
                            <img src="${promotion.imageList[0].url}" alt="productimg"/>
                            <div class="space-div"></div>
                            <div class="text">
                                <strong>${promotion.name}</strong>
                            </div>
                        </div>
                    </div>
                    <div class="discount">
                        <span class="fa-stack fa-2x">
                            <i class="fa fa-certificate fa-stack-2x"></i>
                            <i class="fa fa-tag fa-stack-1x fa-inverse"></i>
                            <strong class="fa-stack-1x discount-text" style="font-size: small;">${promotion.discount}%</strong>
                        </span>
                    </div>
                </div>     
            </c:forEach> 
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>     
        <br />
        <div style="text-align: center">
            <c:forEach items="${promotions}" var="promotion" varStatus="theCount">
                <span class="dot" onclick="currentSlide(${theCount.count})"></span>
            </c:forEach>
        </div>
    </section>
</c:if>
<script type="text/javascript" src="./js/slider.js"></script>
<script>
    setInterval(function() {
                    $(".next").click();
                }, 5000);
</script>