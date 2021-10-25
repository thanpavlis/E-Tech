<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"/>
        <link rel="stylesheet" type="text/css" href="./css/orders.css"/>
    </head>
    <body>
        <jsp:include page="../templates/header.jsp" flush="true"/>
        <h2 style="text-align: center; font-weight: lighter;">ORDERS</h2>
        <table id="orders-table" class="display cell-border hover stripe">
            <thead>
            <td>No</td>
            <td>Email</td>
            <td>Date</td>
            <td>Order Details</td>
            <td>Shipped</td>
            <td>Delete</td>
        </thead>
        <tbody>
            <c:forEach items="${orders}" var="order">
                <c:url var="deleteOrder" value="/delete-order">
                    <c:param name="id" value="${order.id}"/>
                </c:url>
                <c:set var = "orderNumber" value = "${fn:substring(order.pdfurl, 9, 33)}" />
                <tr>
                    <td>${order.id}</td>
                    <td>${order.userId.email}</td>
                    <td><fmt:formatDate type = "both" pattern = "dd/MM/yyyy HH:mm" value = "${order.orderdate}"/></td> 
                    <td>
                        <button class="show-pdf-btn"> 
                            <a href="${order.pdfurl}" target="_blank"><i class="fas fa-file-pdf"></i></a> 
                        </button>
                    </td> 
                    <c:choose>
                        <c:when test="${order.shipped}">
                            <td><input type="checkbox" checked onclick="return false;"><p style="display: none;">${order.shipped}</p></td>    
                            </c:when>
                            <c:otherwise>
                            <td><input id="${order.id}" orderNumber="${orderNumber}" customersPhone="${order.userId.phone}" class="check-shipped" type="checkbox"><p style="display: none;">${order.shipped}</p></td>
                            </c:otherwise>
                        </c:choose> 
                    <td>
                        <button class="delete-order-btn" onclick="window.location.href = '${deleteOrder}';
                                return false;">
                            <i class="fas fa-trash"></i>
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <jsp:include page="../templates/footer.jsp" flush="true"/>
    <script type="text/javascript" src="./js/orders.js"></script>
</body>
</html>
