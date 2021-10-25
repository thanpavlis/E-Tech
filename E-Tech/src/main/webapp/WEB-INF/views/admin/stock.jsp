<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stock</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"/>
        <link rel="stylesheet" type="text/css" href="./css/stock.css"/>
        <link rel="stylesheet" type="text/css" href="./css/notifications.css"/>
    </head>
    <body>
        <jsp:include page="../templates/header.jsp" flush="true"/>
        <c:if test="${!(empty transaction)}">
            <label id="transaction" style="display:none">${transaction}</label>  
        </c:if>
        <h2 style="text-align: center; font-weight: lighter;">STOCK</h2>
        <table id="products" class="display cell-border hover stripe">
            <thead>
            <td>Image</td>
            <td>Name</td>
            <td>Category</td>
            <td>Stock</td>
            <td>Price &nbsp;&nbsp;€</td>
            <td>New Arrival</td>
            <td>Delete</td>
        </thead>
        <tbody>
            <c:forEach items="${products}" var="product">  
                <c:url var="editProduct" value="/edit-product">
                    <c:param name="id" value="${product.id}"/>
                </c:url>
                <c:url var="deleteProduct" value="/delete-product">
                    <c:param name="id" value="${product.id}"/>
                </c:url>
                <tr>
                    <td style="max-width: fit-content"><img src="${product.imageList[0].url}" alt="productimg" /></td>
                    <td><a href="${editProduct}">${product.name}</a></td>
                    <td>${product.categoryId.categoryName}</td>
                    <td>${product.stock}</td>
                    <c:set var="price"><fmt:formatNumber groupingUsed="false"  type="number" minFractionDigits="2" value="${product.price}" /></c:set>
                    <td><span class="euros">${fn:replace(price, '.', ',')}</span></td>
                        <c:choose>
                            <c:when test="${product.newArrival}">
                            <td><input type="checkbox" checked onclick="return false;"><p style="display: none;">${product.newArrival}</p></td>    
                            </c:when>
                            <c:otherwise>
                            <td><input type="checkbox" onclick="return false;"><p style="display: none;">${product.newArrival}</p></td>
                            </c:otherwise>
                        </c:choose>                       
                    <td>
                        <button class="delete-product-btn" onclick="window.location.href = '${deleteProduct}';
                                return false;">
                            <i class="fas fa-trash"></i>
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>        
    <jsp:include page="../templates/footer.jsp" flush="true"/>
    <script type="text/javascript" src="./js/stock.js"></script>
    <script type="text/javascript" src="./js/notifications.js"></script>
    <script>
                            $(document).ready(function () {
                                $(".delete-product-btn").click(function () {
                                    let id = $(this).attr('id');
                                    $('#approveDelete').attr('delete-link', id);
                                    $("#delete-product-modal").modal("show");
                                });
                                checkTransaction();
                            });
    </script>
</body>
</html>
