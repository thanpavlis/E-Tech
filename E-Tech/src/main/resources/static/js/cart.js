//prosthiki antikeimenou sto kart
function addToCartProduct(id) {
    let price = 0;
    if ($('#after-discount').length) {//yparxei ekptwsh
        price = parseFloat(String($('#after-discount').text()).replace(/\,/g, '.'));
    } else {//kanonikh timh
        price = parseFloat(String($('.euros').text()).replace(/\,/g, '.'));
    }
    $.ajax({
        url: "/api/cart/addProductToCart/" + price + "/" + id,
        success: (result) => {
            if (result) {
                updateCart();
                notify(
                        "Cart Notification",
                        "Product added to cart successfully !",
                        "nfc-bottom-right",
                        6000,
                        "success",
                        false,
                        false
                        );
            } else {
                notify(
                        "Cart Notification",
                        "Product already exists in cart !",
                        "nfc-bottom-right",
                        6000,
                        "error",
                        false,
                        false
                        );
            }
        }
    });
}

function incrementQuantity(id, stock) {
    var quantity = parseInt($('#quantity' + id).val());
    if (quantity < stock) {//yparxei akoma stock
        $('#label' + id).hide();
        $('#quantity' + id).val(++quantity);
        $.ajax({
            url: "/api/cart/updateQuantity/" + id + "/" + quantity,
            success: () => {
                let price = parseFloat($("#price" + id).text().replace(/\,/g, '.'));
                $('#total' + id).text(String((price * quantity).toFixed(2)).replace(/\./g, ',') + ' €');
                //ypologismos totalAmount
                let totalAmount = parseFloat($('#total-amount').text().replace(/\,/g, '.'));
                totalAmount += price;
                $('#total-amount').text(String((totalAmount).toFixed(2)).replace(/\./g, ',') + ' €');
            }
        });
    } else {
        quantityWarning("#quantity" + id, 1000);
    }
}

function decrementQuantity(id) {
    var quantity = parseInt($('#quantity' + id).val());
    if (quantity > 1) {
        $('#label' + id).hide();
        $('#quantity' + id).val(--quantity);
        $.ajax({
            url: "/api/cart/updateQuantity/" + id + "/" + quantity,
            success: () => {
                let price = parseFloat($("#price" + id).text().replace(/\,/g, '.'));
                $('#total' + id).text(String((price * quantity).toFixed(2)).replace(/\./g, ',') + ' €');
                //ypologismos totalAmount
                let totalAmount = parseFloat($('#total-amount').text().replace(/\,/g, '.'));
                totalAmount -= price;
                $('#total-amount').text(String((totalAmount).toFixed(2)).replace(/\./g, ',') + ' €');
            }
        });
    } else {
        quantityWarning("#quantity" + id, 2000);
    }
}

function deleteProduct(id) {
    $.ajax({
        url: "/api/cart/deleteProduct/" + id,
        success: (data) => {
            let total = parseFloat($("#total" + id).text().replace(/\,/g, '.'));
            let totalAmount = parseFloat($('#total-amount').text().replace(/\,/g, '.'));
            totalAmount -= total;
            $('#total-amount').text(String((totalAmount).toFixed(2)).replace(/\./g, ',') + ' €');
            if (data == 0) {//exoun fygei ola ta proionta
                $('#cartContent').empty();//adeiazei olo to cart
                setEmptyCart();
            } else {
                $('#cartProd' + id).remove();
                let count = parseInt($("#label-cart-counter").text());
                $("#label-cart-counter").text((--count).toString());
            }
        }
    });
}

function checkout() {
    //elegxos me to stock ths vashs
    $.ajax({
        url: "/api/cart/checkProductsWithStock",
        success: (data) => {
            if (data.updateProducts.length > 0) {//exw proionta gia enhmerwsh tou stock sto front
                $.each(data.updateProducts, function (key, value) {
                    $('#quantity' + value.id).val(value.quantity);
                    $('#increment' + value.id).attr("onclick", "incrementQuantity(" + value.id + "," + value.stock + ")");
                    $('#total' + value.id).text(String((value.total).toFixed(2)).replace(/\./g, ',') + ' €');
                    $('#total-amount').text(String((data.totalAmount).toFixed(2)).replace(/\./g, ',') + ' €');
                    quantityWarning("#quantity" + value.id, 20000);
                    $('#stockNotify').text('Check products quantities !');
                    $('#stockNotify').show().delay(5000).fadeOut();
                });
            } else {//paypal
                let price = String(($('#total-amount').text())).replace(/\,/g, '.');
                price = price.substring(0, price.length - 1);
                $.post('/pay', {'price': parseFloat(price)}).done(function (paypalLink) {
                    window.location.href = paypalLink;
                }).fail(function (xhr, textStatus, errorThrown) {
                    if (xhr.status === 401) {
                        window.location.href = "/login";
                    }
                });

            }
        }
    });

}

function quantityWarning(element, seconds) {
    var style = $(element)
            .css({color: 'red', borderColor: 'red'})
            .show();
    setTimeout(function () {
        style.css({color: '', borderColor: ''});
    }, seconds);
}

function clearCart() {
    $.ajax({
        url: "/api/cart/clearCart",
        success: () => {
            $('#cartContent').empty();//adeiazei olo to cart
            setEmptyCart();
        }
    });
}

function updateCart() {
    //settarei twn arithmo dipla sto cart
    $.ajax({url: "/api/cart/numberOfProductsInCart",
        success: (result) => {
            $("#label-cart-counter").text(result);
            if (result > 0) {
                //settarei to kalathi analoga me to ti exei to session
                initializeCart();
                $.ajax({url: "/api/cart/getCart",
                    success: (data) => {
                        $.each(data.products, function (key, value) {
                            $("table tbody").append(
                                    '<tr id="cartProd' + value.id + '">' +
                                    '<td><div class="cart-image"><img  src="' + value.imageUrl + '" alt="alt"/></div></td>' +
                                    '<td>' + value.name + '</td>' +
                                    '<td>' +
                                    '<div>' +
                                    '<input type="button" onclick="decrementQuantity(' + value.id + ')" value="-" />' +
                                    '<input  id="quantity' + value.id + '" class="quantity-input" type="text" name="quantity" value="' + value.quantity + '" size="2" disabled/>' +
                                    '<input id="increment' + value.id + '" type="button" onclick="incrementQuantity(' + value.id + ',' + value.stock + ')" value="+" />' +
                                    '</div></td>' +
                                    '<td id="price' + value.id + '">' + String((value.price).toFixed(2)).replace(/\./g, ',') + ' €</td>' +
                                    '<td id="total' + value.id + '">' + String((value.total).toFixed(2)).replace(/\./g, ',') + ' €</td>' +
                                    '<td><img onclick="deleteProduct(' + value.id + ')" class="delete-product-icon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAdVBMVEUAAABNTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU1NTU0N3NIOAAAAJnRSTlMAAQIDBAUGBwgRFRYZGiEjQ3l7hYaqtLm8vsDFx87a4uvv8fP1+bbY9ZEAAAB8SURBVBhXXY5LFoJAAMOCIP4VBRXEv5j7H9HFDOizu2TRFljedgCQHeocWHVaAWStXnKyl2oVWI+kd1XLvFV1D7Ng3qrWKYMZ+MdEhk3gbhw59KvlH0eTnf2mgiRwvQ7NW6aqNmncukKhnvo/zzlQ2PR/HgsAJkncH6XwAcr0FUY5BVeFAAAAAElFTkSuQmCC" width="16" height="16" alt=""></td>' +
                                    '</tr>');
                        });
                        //ekypwsh totalAmount kai exoda apostolhs
                        $("table tbody").append(
                                '<tr>' +
                                '<td><button onclick="clearCart()" class="cart-btn-clear">Clear</button></td>' +
                                '<td></td>' +
                                '<td colspan="2"><img id="paypalButton" class="paypal-icon" onclick="checkout();" src="./images/paypal.webp" alt="Check out with PayPal"></td>' +
                                '<td id="total-amount" colspan="2">' + String(data.totalAmount.toFixed(2)).replace(/\./g, ',') + ' €</td>' +
                                '<td></td>' +
                                '</tr>');
                    }});
//                setTimeout(function () {
//                    checkRoleAdminForPaypal();
//                }, 500);
            } else {
                setEmptyCart();
            }
        }});
}

function updateCartNumber() {
    //settarei twn arithmo dipla sto cart
    $.ajax({url: "/api/cart/numberOfProductsInCart",
        success: (result) => {
            $("#label-cart-counter").text(result);
        }});
}

function setEmptyCart() {
    $("#cartContent").append("<center><h2 id='empty'>Cart is Empty !</h2>");
    $("#cartContent").append(" <img src='./images/empty-cart.svg' alt='empty cart' class='empty-cart-img'></center>");
    $("#label-cart-counter").text('0');
}

function initializeCart() {
    $("#cartContent").html(`                      
                        <div id="div-cart-products" class="hideScroll">
                        <table>
                        <thead>
                        <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody> 
                        </tbody>
                        </table>
                        </div>`);
}

