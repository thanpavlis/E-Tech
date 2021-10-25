$(document).ready(function () {
    $('#orders-table').DataTable({
        "columns": [
            {"width": "15%"},
            {"width": "30%"},
            {"width": "20%"},
            {"width": "15%"},
            {"width": "10%"},
            {"width": "10%"}
        ],
        "oLanguage": {
            "sSearch": "Search Order:"
        },
        "language": {
            "info": "_START_ to _END_ of _TOTAL_ Total Orders",
            "lengthMenu": "_MENU_"
        }
    });

    $(".check-shipped").click(function (e) {
        e.preventDefault();
        let orderInput = $(this);
        if (orderInput.is(':checked')) {
            orderInput.prop('disabled', true);
            $.post("/orderShipped", {orderId: orderInput.attr("id"),
                orderNumber: orderInput.attr("orderNumber"),
                customersPhone: orderInput.attr("customersPhone")})
                    .done(function (result) {
                        if (result) {
                            orderInput.prop('disabled', false);
                            orderInput.prop('checked', true);
                        } else {
                            orderInput.prop('disabled', false);
                            console.log("APETUXE");
                        }
                    }).fail(function (xhr, textStatus, errorThrown) {
                console.log("FAIL");
                orderInput.prop('disabled', false);
            });
        }
    });
});