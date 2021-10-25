var slides = ($("#image-list-size").length) ? parseInt($("#image-list-size").text()) : 0;
if (slides == 0) {
    $("#save-button").prop("disabled", true);
    $("#save-button").css('opacity', '0.2');
}

function addNewImage() {
    slides++;
    document.querySelector("#slideshow-container").insertAdjacentHTML(
            "beforeend",
            "<div id='mySlides" + slides + "' class='mySlides'>\n\
                                            <div class='image-div'>\n\
                                            <img id='prd-img-" + slides + "' alt='product_img'/>\n\
                                            </div>\n\
                                            <div class='edit-image'>\n\
                                            Image URL:\n\
                                            <input type='text' class='form-control' id='img-url-input-" + slides + "' name='imageList[" + (slides - 1) + "].url' oninput='loadImage(" + slides + ")' required='true'/>\n\
                                            <input id='valid" + (slides) + "' class='valid' type='hidden' value='false'/></div><div>\n\
                                            <input id='remove-button" + slides + "' type='button'  class='btn btn-primary' value='Remove' onclick='removeImage(" + slides + ");'/>\n\
                                            </div>\n\
                                            </div>");
    document.querySelector("#dots").insertAdjacentHTML(
            "beforeend",
            "<span id='dot" + slides + "' class='dot' onclick='currentSlide(" + slides + ")'></span>");
    currentSlide(slides);
    $("#add-new-image").prop("disabled", true);
    $("#save-button").prop("disabled", true);
    $("#save-button").css('opacity', '0.2');
}

function loadImage(id) {
    let image = new Image();
    image.src = $('#img-url-input-' + id).val();
    image.addEventListener('load', () => {
        $('#prd-img-' + (id)).attr('src', $('#img-url-input-' + id).val());
        $("#add-new-image").prop("disabled", false);
        $("#valid" + id).val(true);
        $('#img-url-input-' + (id)).css("border", "solid 2px green");
        $('#dot' + (id)).css("background-color", "");
        checkForWrongImage();
    });
    image.addEventListener('error', () => {
        $('#prd-img-' + (id)).attr('src', '');
        $("#add-new-image").prop("disabled", true);
        $("#valid" + id).val(false);
        $('#img-url-input-' + (id)).css("border", "solid 2px red");
        $('#dot' + (id)).css("background-color", "red");
        $("#save-button").prop("disabled", true);
        $("#save-button").css('opacity', '0.2');
    });
}


$("#select-brand").click(function () {
    if ($(this).val() === "") {
        $("#new-brand").show();
    }
});

$("#select-brand").click(function () {
    if ($(this).val() !== "") {
        $("#new-brand").hide();
    }
});

function checkForWrongImage() {
    let wrongImage = false;
    $(".valid").each(function () {
        if ($(this).val() == "false") {
            wrongImage = true;
        }
    });
    if (!wrongImage) {
        $("#add-new-image").prop("disabled", false);
        $("#save-button").prop("disabled", false);
        $("#save-button").css('opacity', '');
    }
}

function removeImage(id) {
    if (!$("#product-id-" + id).length) {//den einai apo thn bash ara den yparxei problhma na ta kanw remove
        $("#dot" + id).remove();
        $("#mySlides" + id).remove();
        slides--;
        let counter = 1;
        $('#dots>span').each(function (i) {
            $("#" + this.id).attr("id", "dot" + counter);
            $("#" + this.id).attr("onclick", "currentSlide(" + counter + ")");
            counter++;
        });
        counter = 1;
        $('#slideshow-container').find('.mySlides').each(function (i) {
            let currentIdNumber = (this.id).substring(8, (this.id).length);
            $("#remove-button" + currentIdNumber).attr("onclick", "removeImage(" + counter + ")");
            $("#prd-img-" + currentIdNumber).attr("id", "prd-img-" + counter);
            $("#img-url-input-" + currentIdNumber).attr("oninput", "loadImage(" + counter + ")");
            $("#img-url-input-" + currentIdNumber).attr("name", "imageList[" + (counter - 1) + "].url");
            $("#img-url-input-" + currentIdNumber).attr("id", "img-url-input-" + counter);
            $("#remove-button" + currentIdNumber).attr("id", "remove-button" + counter);
            $("#" + this.id).attr("id", "mySlides" + counter); //teleutaia allazw to id
            counter++;
        });
        if (slides > 0) {
            currentSlide(slides);
            checkForWrongImage();
        } else {
            $("#add-new-image").prop("disabled", false);
            $("#save-button").prop("disabled", true);
            $("#save-button").css('opacity', '0.2');
        }
    } else {//an einai apo thn bash ta kanw hide gia na postarei ta dedomena
        $("#mySlides" + id).css('opacity', '0.2');
        $("#remove-image" + id).val(true);
        $("#remove-button" + id).prop('disabled', true);
    }
}
//new
function showInput() {
    alert("new brand");
    $("#new-brand").show();
}

$(".form-option").click(function () {
    $("#new-brand").hide();
});

function setNumCheck(id) {
    $("#" + id).keydown(function (e) {
        var keyCode = e.which;
        if (e.shiftKey) {
            return (false);
        } else if (keyCode == 110 && id == "price" && !$("#price").val().includes('.')) {
            $("#price").val($("#price").val() + ".");
            return (false);
        } else if (
                (keyCode > 31) &&
                (keyCode < 48 || keyCode > 57) &&
                (keyCode < 96 || keyCode > 105)) {
            return (false);
        }
    });
}

$("#new-brand-button").on("click", function (e) {
    e.preventDefault();
    let brandName = $("#brand-name-input").val();
    console.log(brandName);
    $.post("/add-new-brand/" + brandName)
            .done((newId) => {
                if (newId > 0) {
                    $("#new-brand").hide();
                    $("#new-brand-option").attr("class", "form-option").attr("value", newId);
                    $("#new-brand-option").text(brandName);
                    $("#new-brand-option").removeAttr("onclick").removeAttr("id");
                } else {
                    alert("Something went wrong");
                }
            }).fail(function (xhr, textStatus, errorThrown) {
    });
});

