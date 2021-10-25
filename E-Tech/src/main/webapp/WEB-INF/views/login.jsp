<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/logo3.png" sizes="48x48">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous"
              />
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"
        ></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"/>
        <link rel="stylesheet" href="./css/login.css" />
        <link rel="stylesheet" href="./css/notifications.css">
    </head>
    <body>
        <c:if test="${!(empty failureMessage)}">
            <label id="failureMessage" style="display: none;">${failureMessage}</label>
        </c:if>
        <c:if test="${!(empty reset_token)}">
            <label id="reset_token" style="display: none;">${reset_token}</label>
        </c:if>
        <c:if test="${!(empty register)}">
            <label id="register" style="display: none;">${register}</label>  
        </c:if>
        <c:if test="${!(empty verification)}">
            <label id="verification" style="display: none;">${verification}</label>  
        </c:if>
        <div class="logo">
            <a href="${pageContext.request.contextPath}/products"><img src="./images/logo3.png"/></a>
        </div>
        <div class="container" style="margin-bottom: 148px">
            <strong><u><h2>Login</h2></u></strong> 
            <form action="login" method="POST" novalidate>
                <strong>Email</strong> 
                <div class="form-group">
                    <input
                        type="email"
                        name="email"
                        class="form-control"
                        id="email"
                        placeholder="Email"
                        />
                    <span id="text-error1"></span>
                </div>
                <strong>Password</strong> 
                <div class="form-group">
                    <input
                        type="password"
                        name="password"
                        class="form-control"
                        id="password"
                        placeholder="Password"
                        />
                    <span id="text-error2"></span>
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" name="remember-me" class="form-check-input" id="check" />
                    <label class="form-check-label" for="check">Stay logged in</label>
                </div>
                <button type="submit" class="btn btn-primary btn-lg btn-block">
                    Login
                </button>
                <div class="links">
                    <a href="#" data-target="#emailModal" data-toggle="modal">Forgot your password?</a>
                    <br />
                    <hr id="seperator" />
                    <p class="register-txt">
                        Don't have an account?
                    </p>
                    <button type="button" class="btn btn-secondary btn-lg btn-block register-btn" 
                            onclick="window.location.href = '${pageContext.request.contextPath}/register'">
                        Register Now
                    </button>
                </div>
            </form>
        </div>
        <jsp:include page="./templates/forgot_password_modals.jsp" flush="true"/>
        <jsp:include page="./templates/footer.jsp" flush="true"/>

        <script type="text/javascript" src="./js/login.js"></script>
        <script type="text/javascript" src="./js/notifications.js"></script>
        <script>
                                $(document).ready(function ($) {
                                    checkNotifyRegister();
                                    checkVerification();
                                    checkAccountIsValid();
                                    if ($("#reset_token").text()) {
                                        $("#passwordModal").modal('toggle');
                                    }
                                });
        </script>  

    </body>
</html>