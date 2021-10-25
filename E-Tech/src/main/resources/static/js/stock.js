$(document).ready(function () {
    $('#products').DataTable({
        "columns": [
            {"width": "10%"},
            {"width": "45%"},
            {"width": "10%"},
            {"width": "8%"},
            {"width": "10%"},
            {"width": "9%"},
            {"width": "8%"}
        ],
        "oLanguage": {
            "sSearch": "Search Product:"
        },
        "language": {
            "info": "_START_ to _END_ of _TOTAL_ Total Products"
        },
        "bInfo": false,
        "bLengthChange": false
    });
    $("#products_wrapper").prepend("<button id='add-product' onclick=\"window.location.href ='/new-product'\">Add Product &nbsp;&nbsp;<i class='fas fa-shopping-basket'></i></button>");
});

function checkTransaction() {
    if ($("#transaction").length) {
        notify(
                "Product Notification",
                $("#transaction").text(),
                "nfc-bottom-right",
                10000,
                "success",
                false,
                false
                );
    }

}



