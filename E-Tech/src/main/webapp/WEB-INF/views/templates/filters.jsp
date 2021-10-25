<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="sidebar">
    <h2>Filters</h2>
    <hr />
    <div class="filters">
        <h3>Brand</h3>
        <c:forEach items="${brands}" var="brand">
            <label class="container">
                ${brand}
                <input type="checkbox"/>
                <span class="checkmark"></span>
            </label>
        </c:forEach>
    </div>
    <div class="filters">
        <h3>Max Price</h3>
        <div>
            <input
                type="range"
                min="0"
                max="${max_price}"
                value="${max_price}"
                class="slider"
                id="myRange"
                oninput="pricerange.value = value"
                />
            <div class="price-output">
                <output id="pricerange">${max_price}</output><span> €</span>
            </div>
        </div>
        <br>
    </div>
    <div class="filters">
        <h3>Rating</h3>
        <div id="stars">
            <input class="rating">
        </div>
        <br>
    </div>
    <div class="filters">
        <h3>Sort By Price</h3>
        <label class="block">
            <input type="radio" name="radgroup"  value="Asc">Asc
        </label>
        <label class="block">
            <input type="radio" name="radgroup" value="Desc">Desc
        </label>
        <br />
        <h3>Sort By Rating</h3>
        <label class="block">
            <input type="radio" name="radgroup"  value="Asc">Asc
        </label>
        <label class="block">
            <input type="radio" name="radgroup" value="Desc">Desc
        </label>
        <br />
    </div>
</div>
<div class="verticalLine"></div>