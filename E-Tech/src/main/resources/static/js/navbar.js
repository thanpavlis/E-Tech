$(document).ready(function () {
    let favourites = $("#favs");
    let login = $("#login");
    let logout = $("#logout");
    let cart = $("#cart-icon a");
    let orders = $("#orders");
    let allProducts = $("#allProducts");
    let links = $(".main-nav ul li a");

    $(document).ready(function ($) {
        $("#cart-icon a").click(
                function (event) {
                    event.preventDefault();
                    $("#modal").click();
                }
        );
    });

    function media() {
        if (window.matchMedia("(max-width: 835px)").matches) {
            $.ajax({
                url: "checkIfUserIsLoggedIn",
                success: (result) => {
                    favourites.text("");
                    login.text("");
                    logout.text("");
                    cart.text("");
                    orders.text("");
                    allProducts.text("");
                    if (result) {
                        favourites.prepend("<i class='fas fa-heart'></i>");
                        orders.prepend("<i class='fas fa-shipping-fast'></i>");
                        allProducts.prepend("<i class='fas fa-warehouse'></i>");
                        logout.prepend("<i class='fas fa-power-off'></i>");
                    } else {
                        login.prepend("<i class='fas fa-user'></i>");
                    }
                    $.ajax({
                        url: "checkIfRoleAdmin",
                        success: (result) => {
                            if (!result) {
                                cart.prepend("<i class='fas fa-shopping-cart'></i><span id='label-cart-counter' class='badge badge-warning'></span>");
                                updateCartNumber();                                
                            }
                        }
                    });
                    $(links).css("padding", "1em");
                }
            });
        } else {
            $.ajax({
                url: "checkIfUserIsLoggedIn",
                success: (result) => {
                    favourites.text("");
                    login.text("");
                    logout.text("");
                    cart.text("");
                    orders.text("");
                    allProducts.text("");
                    if (result) {
                        favourites.prepend("Favourites &nbsp;&nbsp;&nbsp;<i class='fas fa-heart'>");
                        orders.prepend("Orders &nbsp;&nbsp;&nbsp;<i class='fas fa-shipping-fast'></i>");
                        allProducts.prepend("Stock &nbsp;&nbsp;&nbsp;<i class='fas fa-warehouse'></i>");
                        logout.prepend("Logout &nbsp;&nbsp;&nbsp;<i class='fas fa-power-off'></i>");
                    } else {
                        login.prepend("Login &nbsp;&nbsp;&nbsp;<i class='fas fa-user'></i>");
                    }
                    $.ajax({
                        url: "checkIfRoleAdmin",
                        success: (result) => {
                            if (!result) {
                                cart.prepend("Cart &nbsp;&nbsp;&nbsp;<i class='fas fa-shopping-cart'></i><span id='label-cart-counter' class='badge badge-warning'></span>");
                                updateCartNumber(); 
                            }
                        }
                    });
                    $(links).css("padding", "1em 3em");
                }
            });
        }
    }

    $(window).load("html", media()); //"html",  EDW EINAI TO ERROR!!!!! (ISWS ON LOAD KATI ALLO OXI HTML) ISWS SET TIMEOUT LIGO XRONO GIA NA STRWSEI
    $(window).resize(media);

    function toggle() {
        if (window.matchMedia("(max-width: 1048px)").matches) {
            $(".dropdown-li").css("display", "none");
            $(".dropdown-hidden").css("display", "block");
        } else {
            $(".dropdown-li").css("display", "block");
            $(".dropdown-hidden").css("display", "none");
        }
    }

    $("#icon").click(function () {
        $(".second-nav ul").toggleClass("show");
        toggle();
    });

    if ($(window).resize(toggle))
        ;

    $("a:has(>.fa-comment-dots)").click(function () {
        $.ajax({
            url: "checkIfUserIsLoggedIn",
            success: (result) => {
                if (result) {
                    window.location.href = "/customer-service";
                } else {
                    window.location.href = "/login";
                }
            }
        });
    });
});