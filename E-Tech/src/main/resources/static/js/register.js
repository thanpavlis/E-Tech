$(document).ready(function () {
    $("#fname").focusout(function () {
        let nameRegex = new RegExp("^([A-Za-z0-9\\s]*)$");
        if ($(this).val() === "") {
            $(this).css("border", "solid 2px red");
            var correct2 = $(this).siblings("i");
            correct2.addClass("fa-check-circle").css("color", "red");
            $(" #text-error ").text("First Name can not be empty !!");
        } else if ($(this).val().length < 3 || $(this).val().length > 30) {
            $(this).css("border", "solid 2px red");
            var error = $(this).siblings("i");
            error.addClass("fa-check-circle").css("color", "red");
            $(" #text-error ").text(
                    "First Name must be between 3-30 Characters !!"
                    );
        } else if (!nameRegex.test($(this).val())) {
            $(this).css("border", "solid 2px red");
            var error = $(this).siblings("i");
            error.addClass("fa-check-circle").css("color", "red");
            $(" #text-error ").text(
                    "Only Latin characters and Numbers allowed !!"
                    );
        } else if ($(this).val().length >= 3 && $(this).val().length <= 30) {
            $(this).css("border", "solid 2px green");
            var correct = $(this).siblings("i");
            correct.addClass("fa-check-circle").css("color", "green");
            $(" #text-error ").text("");
        }
    });

    $("#lname").focusout(function () {
        let nameRegex = new RegExp("^([A-Za-z0-9\\s]*)$");
        if ($(this).val() === "") {
            $(this).css("border", "solid 2px red");
            var correct2 = $(this).siblings("i");
            correct2.addClass("fa-check-circle").css("color", "red");
            $(" #text-error1 ").text("Last Name can not be empty !!");
        } else if ($(this).val().length < 3 || $(this).val().length > 30) {
            $(this).css("border", "solid 2px red");
            var error = $(this).siblings("i");
            error.addClass("fa-check-circle").css("color", "red");
            $(" #text-error1 ").text(
                    "Last Name must be between 3-30 Characters !!"
                    );
        } else if (!nameRegex.test($(this).val())) {
            $(this).css("border", "solid 2px red");
            var error = $(this).siblings("i");
            error.addClass("fa-check-circle").css("color", "red");
            $(" #text-error1 ").text(
                    "Only Latin characters and Numbers allowed !!"
                    );
        } else if ($(this).val().length >= 3 && $(this).val().length <= 30) {
            $(this).css("border", "solid 2px green");
            var correct = $(this).siblings("i");
            correct.addClass("fa-check-circle").css("color", "green");
            $(" #text-error1 ").text("");
        }
    });

    $("#phone").focusout(function () {
        if ($(this).val() === "") {
            $(this).css("border", "solid 2px red");
            var correct2 = $(this).siblings("i");
            correct2.addClass("fa-check-circle").css("color", "red");
            $(" #text-error2 ").text("Phone Number can not be empty !!");
        } else if ($(this).val().length === 10) {
            $(this).css("border", "solid 2px green");
            var correct = $(this).siblings("i");
            correct.addClass("fa-check-circle").css("color", "green");
            $(" #text-error2 ").text("");
        } else if ($(this).val().length > 10 || $(this).val().length < 10) {
            $(this).css("border", "solid 2px red");
            var error = $(this).siblings("i");
            error.addClass("fa-check-circle").css("color", "red");
            $(" #text-error2 ").text("Phone Number must be 10 Numbers !!");
        }
    });

    $("#email").focusout(function () {
        let emailInput = $(this);
        let email = emailInput.val();
        $.ajax({
            url: "/checkIfEmailAlreadyExists/" + email,
            success: (result) => {
                if (result) {
                    emailInput.css("border", "solid 2px red");
                    emailInput.siblings("i").addClass("fa-check-circle").css("color", "red");
                    $("#text-error3").text("Email already exists !!");
                    $("#emailExists").val("true");
                } else {
                    $("#emailExists").val("false");
                }
            }
        });
        let mailRegex = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
        if ($(this).val() === "") {
            $(this).css("border", "solid 2px red");
            var correct2 = $(this).siblings("i");
            correct2.addClass("fa-check-circle").css("color", "red");
            $(" #text-error3 ").text("Email can not be empty !!");
        } else if ($(this).val().length < 7 || $(this).val().length > 45) {
            $(this).css("border", "solid 2px red");
            var error = $(this).siblings("i");
            error.addClass("fa-check-circle").css("color", "red");
            $(" #text-error3 ").text(
                    "Email must be between 7-45 Characters !!"
                    );
        } else if (!mailRegex.test($(this).val())) {
            $(this).css("border", "solid 2px red");
            var error = $(this).siblings("i");
            error.addClass("fa-check-circle").css("color", "red");
            $(" #text-error3 ").text(
                    "Invalid Email !!"
                    );
        } else if ($(this).val().length >= 7 && $(this).val().length <= 45) {
            $(this).css("border", "solid 2px green");
            var correct = $(this).siblings("i");
            correct.addClass("fa-check-circle").css("color", "green");
            $(" #text-error3 ").text("");
        }
    });

    $("#password").focusout(function () {
        let passwordRegex = new RegExp("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{5,64}$");
        if ($(this).val() === "") {
            $(this).css("border", "solid 2px red");
            var correct2 = $(this).siblings("i");
            correct2.addClass("fa-check-circle").css("color", "red");
            $(" #text-error4 ").text("Password can not be empty !!");
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
        } else if (!passwordRegex.test($(this).val())) {
            $(this).css("border", "solid 2px red");
            var error = $(this).siblings("i");
            error.addClass("fa-check-circle").css("color", "red");
            $(" #text-error4 ").text(
                    "Password Needs at least one Uppercase, one Lowercase letter and a Number !!"
                    );
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
        }
    });

    $("#password, #confirmPassword").on("keyup", function () {
        if ($("#password").val() === $("#confirmPassword").val()) {
            $("#message").html("Matching").css("color", "green");
        } else if (
                $("#password").val() === "" ||
                $("#confirmPassword").val() === ""
                ) {
            $("#message").html("Not Matching").css("color", "red");
        } else {
            $("#message").html("Not Matching").css("color", "red");
        }
    });
});

