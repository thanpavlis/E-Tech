$(document).ready(function () {
    let mailRegex = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    $("#email").focusout(function () {
        if ($(this).val() === "") {
            $(this).css("border", "solid 2px red");
            $("#text-error1").text("Email can not be empty !!");
        } else if (!mailRegex.test($(this).val())) {
            $(this).css("border", "solid 2px red");
            $("#text-error1").text("Invalid Email");
        } else if (mailRegex.test($(this).val())) {
            $(this).css("border", "1px solid #ced4da");
            $("#text-error1").text("");
        }
    });

    $("#password").focusout(function () {
        if ($(this).val() === "") {
            $(this).css("border", "solid 2px red");
            $(" #text-error2 ").text("Password can not be empty !!");
        } else if ($(this).val().length >= 1) {
            $(this).css("border", "1px solid #ced4da");
            $(" #text-error2 ").text("");
        }
    });
});

function checkNotifyRegister() {
    if ($("#register").text()) {
        notify(
                "Sing Up Notification",
                "Sing up was successfull! Check your email to verify your account.",
                "nfc-bottom-right",
                10000,
                "success",
                false,
                false
                );
    }
}

function checkVerification() {
    if ($("#verification").text() === "true") {
        notify(
                "Verify Notification",
                "Congratulations, your account has been verified.",
                "nfc-bottom-right",
                10000,
                "success",
                false,
                false
                );
    } else if ($("#verification").text() === "false") {
        notify(
                "Verify Notification",
                "Sorry, we could not verify account. It maybe already verified, or verification code is incorrect.",
                "nfc-bottom-right",
                10000,
                "error",
                false,
                false
                );
    }
}

function checkAccountIsValid() {
    if ($("#failureMessage").text()) {
        notify(
                "Sing Up Notification",
                $("#failureMessage").text(),
                "nfc-bottom-right",
                10000,
                "error",
                false,
                false
                );
    }
}

$("#password").focusout(function () {
    if ($(this).val() === "") {
        $(this).css("border", "solid 2px red");
        var correct2 = $(this).siblings("i");
        correct2.addClass("fa-check-circle").css("color", "red");
        $(" #text-error4 ").text("Password can not be empty !!");
    } else if ($(this).val().length >= 5 && $(this).val().length <= 8) {
        $(this).css("border", "solid 2px orange");
        var correct = $(this).siblings("i");
        correct.addClass("fa-check-circle").css("color", "orange");
        $(" #text-error4 ").text("");
    } else if ($(this).val().length > 8 && $(this).val().length <= 64) {
        $(this).css("border", "solid 2px green");
        var correct = $(this).siblings("i");
        correct.addClass("fa-check-circle").css("color", "green");
        $(" #text-error4 ").text("");
    } else if ($(this).val().length < 5) {
        $(this).css("border", "solid 2px red");
        var error = $(this).siblings("i");
        error.addClass("fa-check-circle").css("color", "red");
        $(" #text-error4 ").text(
                "Password  must be greater than 5 Characters !!"
                );
    } else if ($(this).val().length > 64) {
        $(this).css("border", "solid 2px red");
        var error = $(this).siblings("i");
        error.addClass("fa-check-circle").css("color", "red");
        $(" #text-error4 ").text(
                "Password  must be lower than 64 Characters !!"
                );
    }
});