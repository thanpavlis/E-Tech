<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Register</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/logo3.png" sizes="48x48">
        <link rel="stylesheet" href=
              "https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
              integrity=
              "sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
              crossorigin="anonymous">
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
            integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
            crossorigin="anonymous"
            />
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"
        ></script>
        <link rel="stylesheet" href="./css/register.css" />
    </head>

    <body>

        <div class="container" style="margin-bottom: 79px">

            <div class="logo">
                <a href="${pageContext.request.contextPath}/products"><img src="./images/logo3.png"/></a>
            </div>
            <u><strong><h2>Register Profile</h2></strong></u>    
                        <form:form action="process-register-form" id="myForm" modelAttribute="user">
                <strong id="fname-edit">First Name</strong> 
                <strong id="lname-edit">Last Name</strong>
                <div class="form-row">

                    <div class="form-group col-md-6">
                        <div id="input_container">
                            <form:input path="firstName"
                                        type="text"
                                        class="form-control"
                                        id="fname"
                                        placeholder="First Name"
                                        /> 
                            <i style='color:grey;' id="edit-logo" class='fas '></i>
                        </div>
                        <span id="text-error"><form:errors path="firstName" cssClass="error" /></span>
                    </div> 

                    <div class="form-group col-md-6">
                        <strong id="lname-edit2">Last Name</strong>
                        <div id="input_container">
                            <form:input path="lastName"
                                        type="text"
                                        class="form-control"
                                        id="lname"
                                        placeholder="Last Name" 
                                        />
                            <i style='color:grey;' id="edit-logo" class='fas '></i></div>
                        <span id="text-error1"> <form:errors path="lastName" cssClass="error" /></span>
                    </div>
                </div>

                <strong> Phone Number </strong>
                <div class="form-group">
                    <div id="input_container">
                        <form:input path="phone"
                                    type="text"
                                    class="form-control"
                                    id="phone"
                                    placeholder="Phone Number"
                                    />
                        <i style='color:grey;' id="edit-logo" class='fas '></i></div>
                    <span id="text-error2"><form:errors path="phone" cssClass="error" /></span>
                </div> 

                <strong> Email </strong> 
                <div class="form-group">
                    <div id="input_container">
                        <form:input path="email"
                                    type="text"
                                    class="form-control"
                                    id="email"
                                    placeholder="Email"
                                    />
                        <i style='color:grey;' id="edit-logo" class='fas '></i></div>
                    <span id="text-error3">${emailExists}<form:errors path="email" cssClass="error" /></span>
                    <input type="hidden" id="emailExists" name="emailExists">
                </div>

                <strong> Password </strong>
                <div class="form-group">
                    <div id="input_container">
                        <form:input path="password"
                                    type="password"
                                    class="form-control"
                                    id="password"
                                    placeholder="Password"
                                    />

                        <i style='color:grey;' id="edit-logo" class='fas '></i></div>
                    <span id="text-error4"><form:errors path="password" cssClass="error" /></span>

                </div>
                <strong> Confirm Password </strong> 
                <div class="form-group">
                    <div id="input_container">
                        <input  name="confirmPassword"
                                type="password"
                                class="form-control"
                                id="confirmPassword"
                                placeholder="Repeat Password"
                                /> 

                        <i style='color:grey;' id="edit-logo" class='fas '></i></div>
                    <span id='message' style="color: red;">${notMatching}</span>
                </div>

                <button type="submit" id="submitBtn" class="btn btn-primary btn-lg btn-block">
                    Register
                </button>
                <hr id="seperator" />
                <div class="links">Already have an account? <a href="${pageContext.request.contextPath}/login">Sign in here</a></div>
            </form:form>
        </div>

        <jsp:include page="./templates/footer.jsp" flush="true"/>

        <script type="text/javascript" src="./js/register.js"></script>

    </body>
</html>   