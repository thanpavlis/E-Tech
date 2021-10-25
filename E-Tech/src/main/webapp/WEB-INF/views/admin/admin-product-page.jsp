<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
            integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"/>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"
        ></script>
        <link rel="stylesheet" href="./css/admin-product-page.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/slider.css" /> 
    </head>
    <body>
        <jsp:include page="../templates/header.jsp" flush="true"/>
        <c:if test="${!(empty product.imageList.size())}">
            <label id="image-list-size" style="display: none;">${product.imageList.size()}</label>  
        </c:if>       
        <c:choose> 
            <c:when test="${!empty title}">
                <c:set value="${title}" var="title"></c:set>
            </c:when>
            <c:otherwise>
                <c:set value="${product.name}" var="title"></c:set>
            </c:otherwise>
        </c:choose>
        <div id="edit-product-title">
            <h2>${title}</h2>
        </div>
        <div class="container">
            <form:form action="${action}" modelAttribute="product" method="POST">
                <form:hidden path="id" value = "${product.id}"/>
                <div class="form-row row">
                    <div class="form-group col-md-6">
                        <div class="images">
                            <div class="slideshow-container" id="slideshow-container">
                                <c:forEach items="${product.imageList}" var="productImage" varStatus="status">
                                    <form:hidden id="product-id-${status.index+1}" path="imageList[${status.index}].id" value = "${productImage.id}"/>
                                    <div id="mySlides${status.index+1}" class="mySlides">
                                        <div class="image-div">
                                            <img id="prd-img-${status.index+1}" src="${productImage.url}" alt="productimg"/>
                                        </div>
                                        <div class="edit-image">
                                            Image URL:  
                                            <form:input 
                                                type="text"
                                                class="form-control"
                                                id="img-url-input-${status.index+1}"
                                                path="imageList[${status.index}].url"
                                                value="${productImage.url}"
                                                readonly="true"/>
                                            <form:hidden id="remove-image${status.index+1}" path="imageList[${status.index}].remove"/>
                                            <input id="remove-button${status.index+1}" type='button' class='btn btn-primary' value='Remove' onclick='removeImage(${status.index} + 1);'/>
                                        </div>
                                    </div>    
                                </c:forEach>
                            </div>
                            <br><br>
                            <div id="dots" class="dots" style="text-align: center">
                                <c:forEach items="${product.imageList}" var="productImage" varStatus="theCount">
                                    <span id="dot${theCount.index+1}" class="dot" onclick="currentSlide(${theCount.count})"></span>
                                </c:forEach>
                            </div><br>
                            <input id="add-new-image" class="btn btn-primary" type="button" onclick='addNewImage()' value="Add New Image"/>
                        </div>
                    </div>


                    <div style="margin-top: 50px" class="form-group col-md-6">
                        <div id="input_container">
                            <form:label path="name">Product Name </form:label>
                            <form:input
                                type="text"
                                class="form-control"
                                id="name"
                                path="name"
                                placeholder="${product.name}"
                                />
                            <span id="text-error"><form:errors path="name" cssClass="error" /></span>
                        </div>
                        <br>
                        <form:label path="description" style="margin-top:20px;">Description </form:label>
                        <form:textarea
                            type="text"
                            rows="4"
                            class="form-control"
                            id="desc"
                            path="description"
                            placeholder="${product.description}"
                            />
                        <span id="text-error"><form:errors path="description" cssClass="error" /></span>
                        <div style="margin-top:20px" class="form-row row justify-content-center">
                            <div class="form-group col-md-4">
                                <form:label path="brandId.id" for="select-brand">Brand</form:label>
                                <form:select path="brandId.id" class="form-control form-input" id="select-brand">
                                    <c:forEach items="${brands}" var="brand">
                                        <form:option  
                                            value="${brand.id}"
                                            label="${brand.brandName}"
                                            class="form-option"
                                            />
                                    </c:forEach>                                      
                                    <form:option
                                        id="new-brand-option"
                                        value=""
                                        label="Add new brand..."/>
                                </form:select>
                                <div id="new-brand" style="display:none">
                                    <input
                                        type="text"
                                        class="form-control form-input"
                                        id="brand-name-input"
                                        placeholder="Enter Brand Name"/>
                                    <button class="btn btn-primary form-button" id="new-brand-button" style="font-size: 80%;width:30%">Save</button>
                                </div>
                            </div>
                            <div class="form-group col-md-3">
                                <form:label path="categoryId.id" for="select-category">Category</form:label>
                                <form:select path="categoryId.id" class="form-control form-input" id="select-category" value="${product.categoryId.categoryName}">
                                    <c:forEach items="${categories}" var="category">
                                        <form:option
                                            value="${category.id}"
                                            label="${category.categoryName}"/>                                         
                                    </c:forEach>
                                </form:select>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="form-row row justify-content-center">
                    <div class="form-group col-md-3">
                        <form:label path="price">Price </form:label>
                        <form:input
                            type="text"
                            class="form-control"
                            id="price"
                            path="price"
                            placeholder="${product.price}"/>
                        <span id="text-error"><form:errors path="price" cssClass="error" /></span>
                    </div>
                    <div class="form-group col-md-3">
                        <form:label path="stock">Stock </form:label>
                        <form:input
                            type="text"
                            class="form-control"
                            id="stock"
                            path="stock"
                            placeholder="${product.stock}"/>
                        <span id="text-error"><form:errors path="stock" cssClass="error" /></span>
                    </div>
                </div><br>
                <div class="form-row row justify-content-center">
                    <div class="form-group col-md-2">
                        <form:label path="newArrival">New Arrival</form:label>
                        <form:checkbox 
                            id="new"
                            path="newArrival"/>
                    </div>
                </div>
                <hr id="seperator">
                <h3>Promotion</h3><br>
                <div class="form-row row justify-content-center">
                    <div class="form-group col-md-3">
                        <form:label path="discount">Discount </form:label>
                        <form:input 
                            type="text" 
                            class="form-control" 
                            id="discount" 
                            path="discount" 
                            placeholder="${product.discount}" />
                        <c:choose> 
                            <c:when test="${!empty discount_error}">
                                <span id="text-error" class="error">${discount_error}</span>
                            </c:when>
                            <c:otherwise>
                                <span id="text-error" class="error"><form:errors path="discount" cssClass="error"/></span>
                            </c:otherwise>
                        </c:choose>     
                    </div>
                    <div class="form-group col-md-4">
                        <form:label path="endDate">End Date </form:label>
                        <form:input
                            type="date"
                            class="form-control"
                            id="discount_end_date"
                            path="endDate"
                            placeholder="${product.endDate}"/>
                    </div>
                </div><br>
                <button id="save-button" type="submit" class="btn btn-primary btn-lg btn-block"> Save</button>
            </form:form>
        </div>
        <jsp:include page="../templates/footer.jsp" flush="true"/>
        <script type="text/javascript" src="./js/slider.js"></script>
        <script type="text/javascript" src="./js/admin-product-page.js"></script>    
        <script>
                                $(document).ready(function () {
                                    setNumCheck('price');
                                    setNumCheck('stock');
                                    setNumCheck('discount');
                                    $("#price").focusout(function (e) {
                                        $("#price").val(parseFloat($("#price").val()).toFixed(2));
                                    });
                                });
        </script>
    </body>
</html>