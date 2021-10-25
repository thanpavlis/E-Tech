$(document).ready(function () {
    $('#pass').on('input', function () {
        $("#confirm-pass").css({'border': ''});
        $("#confirm-pass").siblings("i").removeClass("fa-check-circle").css("color", "red");
        $("#text-error-conf-pass").text("");
        $("#change-password-btn").prop('disabled', true);
        $("#change-password-btn").css({'opacity': '0.2'});
        $("#confirm-pass").val('');
        $("#confirm-pass").prop('disabled', true);
        if ($(this).val().match(/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{5,64}$/)) {
            $("#text-error-pass").text("");
            $("#confirm-pass").prop('disabled', false);
            $(this).css("border", "solid 2px green");
        } else {
            $(this).css("border", "solid 2px red");
            $("#text-error-pass").text("Password Needs at least one Uppercase, one Lowercase letter, one Number and 5 characters !!");
            $(this).css("border", "solid 2px red");
        }
    });

    $('#confirm-pass').on('input', function () {
        if ($("#pass").val() == $(this).val()) {
            $("#text-error-conf-pass").text("");
            $("#change-password-btn").prop('disabled', false);
            $("#change-password-btn").css({'opacity': ''});
            $(this).css("border", "solid 2px green");
        } else {
            $(this).css("border", "solid 2px red");
            $("#text-error-conf-pass").text("Not Matching");
            $(this).css("border", "solid 2px red");
            $("#change-password-btn").prop('disabled', true);
            $("#change-password-btn").css({'opacity': '0.2'});
        }
    });

    $('#change-password-btn').on('click', function () {
        let token = $('#reset_token').text();
        let password = $('#pass').val();
        $.post('reset_password', {'token': token, 'password': password})
                .done(
                        function (result) {
                            if (result) {
                                $("#passwordModal").modal('toggle');
                                notify(
                                        "Password Notification",
                                        "Password changed.",
                                        "nfc-bottom-right",
                                        10000,
                                        "success",
                                        false,
                                        false
                                        );
                            } else {
                                notify(
                                        "Password Notification",
                                        "Password change failed.",
                                        "nfc-bottom-right",
                                        10000,
                                        "error",
                                        false,
                                        false
                                        );
                            }
                        })
                .fail(function (xhr, textStatus, errorThrown) {
                    alert(xhr);
                    if (xhr.status === 401) {
                        window.location.href = "/login";
                    }
                });
    });
});

$('#sendEmail').on('click', function () {
    let email = $('#email-forget').val();
    $("#sendEmail").prop('disabled', true);
    $.post('forgot-password', {'email': email})
            .done(
                    function (result) {
                        if (result) {
                            $("#cancel-reset").click();
                            notify(
                                    "Password Notification",
                                    "Check your email to reset your password.",
                                    "nfc-bottom-right",
                                    10000,
                                    "success",
                                    false,
                                    false
                                    );
                        } else {
                            $('#email-forget').val("");
                            $("#sendEmail").prop('disabled', false);
                            notify(
                                    "Password Notification",
                                    "Email is wrong.",
                                    "nfc-bottom-right",
                                    10000,
                                    "error",
                                    false,
                                    false
                                    );
                        }
                    })
            .fail(function (xhr, textStatus, errorThrown) {
                $("#sendEmail").prop('disabled', false);
                if (xhr.status === 401) {
                    window.location.href = "/login";
                }
            });
});