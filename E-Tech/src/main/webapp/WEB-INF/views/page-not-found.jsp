<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page isErrorPage="true"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>PAGE NOT FOUND</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/logo3.png" sizes="48x48">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/errorpage.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"/>     
    </head>
    <body>
        <div class="container-error">
            <h2>OOPS! Page not found.</h2>
            <h1>404</h1>
            <p>We Can't find the page you're looking for</p>
            <a href="${pageContext.request.contextPath}/products">Go Back Home</a>
        </div>
        <jsp:include page="./templates/footer.jsp" flush="true"/>
    </body>
</html>