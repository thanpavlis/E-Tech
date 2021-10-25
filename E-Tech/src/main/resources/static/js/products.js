var mybutton = document.getElementById("myBtn");

window.onscroll = function () {
    scrollFunction();
};

function scrollFunction() {
    if (document.body.scrollTop > 800 || document.documentElement.scrollTop > 800) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}

function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}

function checkNotifyPayment() {
    if ($("#payment").length) {
        if ($("#payment").text() == "true") {
            notify(
                    "Payment Notification",
                    "Payment placed successfully !",
                    "nfc-bottom-right",
                    10000,
                    "success",
                    false,
                    false
                    );
        } else {
            notify(
                    "Payment Notification",
                    "Payment cancelled !",
                    "nfc-bottom-right",
                    10000,
                    "error",
                    false,
                    false
                    );
        }
    }
}
