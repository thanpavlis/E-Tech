function removeFavourite(id) {
    $.post("/removeFavourite", {proId: id})
            .done((result) => {
                if (result) {
                    $("#" + id).parents('li').remove();
                } else {
                    window.location.href = "/login";
                }
            }).fail(function (xhr, textStatus, errorThrown) {
    });
}

