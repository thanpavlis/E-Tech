$(document).ready(function () {
    $(".rating").rating();
    $(".rating2").rating2();

    $("#add-comment").click(function () {
        $.ajax({
            url: "checkIfUserIsLoggedIn",
            success: (result) => {
                if (result) {
                    $("#text-form").show();
                    $("#add-comment").hide();
                } else {
                    window.location.href = "/login";
                }
            }
        });
    });

    $("#heart").click(function () {
        $.ajax({
            url: "checkIfUserIsLoggedIn",
            success: (result) => {
                if (result) {
                    let productId = $('input#prodId').val();
                    $.post("/saveFavourite", {proId: productId})
                            .done(function makeHeartRed(result) {
                                if (result) {
                                    $("#heart").css("color", "red"); // EDW THELEI KAI TO MINIMA TO POP UP!!!!!!!!!!!!!!!!! 
                                } else {
                                    window.location.href = "/login";
                                }
                            }).fail(function (xhr, textStatus, errorThrown) {
                        alert(xhr.responseText); // KANTO CONSOLE.LOG()
                    });
                } else {
                    window.location.href = "/login";
                }
            }
        });
    });

    $(".edit-rating-btn").click(function () {
        $("#edit-rating-div").hide();
        $("#rate-comment").show();
    });

    window.onscroll = function () {
        myFunction();
    };

    var navbar = document.getElementById("sticky-nav");
    var sticky = navbar.offsetTop;

    function myFunction() {
        if (window.pageYOffset >= sticky) {
            navbar.classList.add("sticky");
        } else {
            navbar.classList.remove("sticky");
        }
    }

    $('.delete-comment').on('click', function (e) {
        let commentId = $(this).attr("id");
        $.post("/product-page/removeComment", {commentId: commentId})
                .done((result) => {
                    if (result) {
                        $(e.target).parents('li').remove();
                    } else {
                        window.location.href = "/login";
                    }
                }).fail(function (xhr, textStatus, errorThrown) {
        });
    });

});

setInterval(function () {
    if ($("#rating_value").val() === "" || $("#rating_value").val() == 0) {
        $("#rate-comment #add-rating").css({opacity: 0.4});
    } else {
        $("#rate-comment #add-rating").css({opacity: 1});
    }
}, 300);

function checkRatingValid() {
    if ($("#rating_value").val() === "" || $("#rating_value").val() == 0) {
        return false;
    }
    return true;
}



