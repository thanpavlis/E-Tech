<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Welcome</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/logo3.png" sizes="48x48">
        <link rel="stylesheet" href="./css/index.css" />
        <link rel="stylesheet" href="./css/navbar.css" />
        <link rel="stylesheet" href="./css/footer.css" />   
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"/>
    </head>

    <body>

        <div class="container">
            <a href="${pageContext.request.contextPath}/products" id="logo"><img src="./images/logo3.png" alt="logo" class="logo" style="height: 100px; width: 100px;"/></a>
            <div class="row">
                <div class="col">
                    <div class="banner-btn">
                        <a href="${pageContext.request.contextPath}/products">
                            <img
                                src="./images/enter.png"
                                alt="logo"
                                style="height: 160px"
                                class="animate__animated animate__bounce"
                                />
                        </a>
                    </div>
                    <h1>Welcome To E-Tech</h1>
                    <br />
                    <p>
                        Lorem ipsum dolor sit amet consectetur <br />
                        adipisicing elit. Eveniet, cupiditate porro. <br />
                        Repudiandae architecto animi sint totam <br />
                        dolore maxime illo enim magnam nulla <br />
                        quisquam dolor vitae explicabo, vero <br />
                        repellendus suscipit perspiciatis.
                    </p>
                </div>

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

                <div class="col">
                    <a href="${desktops}">
                        <div class="card card1">
                            <h5>PC Desktops</h5>
                        </div>
                    </a>
                    <a href="${laptops}">
                        <div class="card card2">
                            <h5>Laptops</h5>
                        </div>
                    </a>
                    <a href="${phones}">
                        <div class="card card3">
                            <h5>Mobile Phones</h5>
                        </div>
                    </a>
                    <a href="${gadgets}">
                        <div class="card card4">
                            <h5>Gadgets</h5>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <jsp:include page="./templates/footer.jsp" flush="true"/>  

    </body>
</html>


