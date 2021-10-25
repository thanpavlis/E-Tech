<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
        <title>Customer Service</title>
        <link rel="stylesheet" href="./css/chat.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"/>
    </head>
    <body>

        <jsp:include page="./templates/header.jsp" flush="true"/> 
        
        <div id="username-page">
            <div class="username-page-container">
                <h1 class="title">Type your username</h1>
                <form id="usernameForm" name="usernameForm">
                    <div class="form-group">
                        <input type="text" id="name" placeholder="Username" 
                               autocomplete="off" class="form-control"
                               <c:choose>
                                   <c:when test="${sessionScope.user.role == 'ROLE_ADMIN'}">
                                       value="E-Tech Support" />
                                   </c:when>
                                   <c:otherwise>
                                       value="${fn:toUpperCase(fn:substring(sessionScope.user.fname, 0, 1))}. ${fn:toUpperCase(fn:substring(sessionScope.user.lname, 0, 1))}${fn:toLowerCase(fn:substring(sessionScope.user.lname, 1,fn:length(sessionScope.user.lname)))}" />
                                   </c:otherwise>
                               </c:choose>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="accent username-submit">Start
                            Chatting</button>
                    </div>
                </form>
            </div>
        </div>

        <div id="chat-page" class="hidden" >
            <div class="chat-container">
                <div class="chat-header">
                    <h2>Customer Service &nbsp;<i class="far fa-comment-dots"></i></h2>
                </div>
                <div class="connecting">Connecting...</div>
                <ul id="messageArea">

                </ul>
                <form id="messageForm" name="messageForm" nameForm="messageForm">
                    <div class="form-group">
                        <div class="input-group clearfix">
                            <input type="text" id="message" placeholder="Type a message..."
                                   autocomplete="off" class="form-control" />
                            <button type="submit" class="primary">Send</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
                    
        <jsp:include page="./templates/footer.jsp" flush="true"/>            

        <script type="text/javascript" src="./js/chat.js"></script>
    </body>
</html>