$.fn.hip = function (param) {
    var itemsPerRow = 4;
    var itemsPerPage = 12;
    var itemGaps = "10px";
    var paginationPos = "center";
    var itemHeight = "510px";
    var dynItemsPerRow;
    var itemPerRowString = "";
    var HSitemPerRowString = "";
    var SMitemPerRowString = "";
    var MDitemPerRowString = "";
    var LGitemPerRowString = "";
    var filter = true;
    var filterPos = "right";
    var filterText = "Search Product";
    var rowPerPageString = "";
    var HSrowPerPageString = "";
    var SMrowPerPageString = "";
    var MDrowPerPageString = "";
    var LGrowPerPageString = "";
    var objects = $(this);

    if (objects.length > 0) {
        dynItemsPerRow = {
            hs: 1,
            sm: 2,
            md: 3,
            lg: 4
        };

        for (var i = 0; i < itemsPerRow; i++)
            itemPerRowString += 100 / itemsPerRow + "% ";
        for (var i = 0; i < dynItemsPerRow.hs; i++)
            HSitemPerRowString += 100 / dynItemsPerRow.hs + "% ";
        for (var i = 0; i < dynItemsPerRow.sm; i++)
            SMitemPerRowString += 100 / dynItemsPerRow.sm + "% ";
        for (var i = 0; i < dynItemsPerRow.md; i++)
            MDitemPerRowString += 100 / dynItemsPerRow.md + "% ";
        for (var i = 0; i < dynItemsPerRow.lg; i++)
            LGitemPerRowString += 100 / dynItemsPerRow.lg + "% ";
        for (var i = 0; i < Math.ceil(itemsPerPage / itemsPerRow); i++)
            rowPerPageString += itemHeight + " ";
        for (var i = 0; i < Math.ceil(itemsPerPage / dynItemsPerRow.hs); i++)
            HSrowPerPageString += itemHeight + " ";
        for (var i = 0; i < Math.ceil(itemsPerPage / dynItemsPerRow.sm); i++)
            SMrowPerPageString += itemHeight + " ";
        for (var i = 0; i < Math.ceil(itemsPerPage / dynItemsPerRow.md); i++)
            MDrowPerPageString += itemHeight + " ";
        for (var i = 0; i < Math.ceil(itemsPerPage / dynItemsPerRow.lg); i++)
            LGrowPerPageString += itemHeight + " ";

        var head = $("head");
        head.prepend(
                "<style>" +
                "@media (max-width:900px) {\n" +
                "  .hip-grid{\n" +
                "    grid-template-columns: " +
                HSitemPerRowString +
                ";\n" +
                "grid-template-rows: " +
                HSrowPerPageString +
                "  }\n" +
                "}\n" +
                "@media (min-width: 900px) and (max-width: 1290px) {\n" +
                "  .hip-grid{\n" +
                "    grid-template-columns: " +
                SMitemPerRowString +
                ";\n" +
                "grid-template-rows: " +
                SMrowPerPageString +
                "  }\n" +
                "}\n" +
                "@media (min-width: 1290px) and (max-width: 1670px) {\n" +
                "  .hip-grid{\n" +
                "    grid-template-columns: " +
                MDitemPerRowString +
                ";\n" +
                "grid-template-rows: " +
                MDrowPerPageString +
                "  }\n" +
                "}\n" +
                "@media (min-width: 1670px) {\n" +
                "  .hip-grid{\n" +
                "    grid-template-columns: " +
                LGitemPerRowString +
                ";\n" +
                "grid-template-rows: " +
                LGrowPerPageString +
                "  }\n" +
                "}" +
                "</style>"
                );

        head.prepend(
                "<style>" +
                ".hip-grid{\n" +
                "  display: grid;\n" +
                "  grid-gap: " +
                itemGaps +
                "px;\n" +
                "grid-template-columns: " +
                itemPerRowString +
                ";" +
                "grid-template-rows: " +
                rowPerPageString +
                "}\n" +
                ".hip-pagination{text-align: " +
                paginationPos +
                ";}" +
                ".hip-pagination {\n" +
                "  display: block;\n" +
                "}\n" +
                ".hip-pagination a {\n" +
                "color: black;\n" +
                "  padding: 8px 16px;\n" +
                "  text-decoration: none;\n" +
                "}\n" +
                ".hip-pagination a.active {\n" +
                "  font-weight: bold;\n" +
                "}" +
                ".hip-item{padding: " +
                itemGaps +
                ";}" +
                ".hip-item-hidden, .hip-item-out{display: none !important;}" +
                "</style>"
                );

        objects.attr("data-item-per-page", itemsPerPage);
        objects.addClass("hip-grid");

        $.each(objects, function (key, curObj) {
            var hip_item_length = $(curObj).find(".hip-item").length;
            var page_length = Math.ceil(hip_item_length / itemsPerPage);
            var pagination =
                    '<div class="hip-pagination">' + '<a href="#prev">&laquo;</a>';
            for (var i = 1; i <= page_length; i++) {
                if (i === 1)
                    pagination += '<a class="active" href="#' + i + '">' + i + "</a>";
                else
                    pagination += '<a href="#' + i + '">' + i + "</a>";
            }
            pagination += '<a href="#next">&raquo;</a>\n' + "</div>";
            $(curObj).after(pagination);
            $(curObj).attr("data-cur-page", "1");
            showPage(curObj);

            if (filter) {
                $(curObj).before(
                        '<div class="hip-filter">\n' +
                        '  <label class="hip-search">\n' +
                        '    <input class="hip-search-input" type="text" placeholder="&#128269 ' +
                        filterText +
                        '"/>\n' +
                        "  </label>\n" +
                        "</div>"
                        );

                head.prepend(
                        "<style>\n" +
                        "  .hip-filter{\n" +
                        "    width: 100%;\n" +
                        "    text-align: " +
                        filterPos +
                        ";\n" +
                        "  }\n" +
                        "  .hip-search {\n" +
                        "    display: inline-block;\n" +
                        "    position: relative;\n" +
                        "    height: 35px;\n" +
                        "    width: 148px;\n" +
                        "    box-sizing: border-box;\n" +
                        "    margin: 0px 8px 7px 0px;\n" +
                        "    padding: 5px 9px 0px 9px;\n" +
                        "    border: 3px solid ;\n" +
                        "    border-radius: 25px;\n" +
                        "    transition: all 200ms ease;\n" +
                        "    cursor: text;\n" +
                        "  }\n" +
                        "  .hip-search:after {\n" +
                        '    content: "";\n' +
                        "    position: absolute;\n" +
                        "    width: 3px;\n" +
                        "    height: 20px;\n" +
                        "    right: -5px;\n" +
                        "    top: 21px;\n" +
                        "    background: ;\n" +
                        "    border-radius: 3px;\n" +
                        "    transform: rotate(-45deg);\n" +
                        "    transition: all 200ms ease;\n" +
                        "  }\n" +
                        "  .hip-search.active, .hip-search:hover {\n" +
                        "    width: 200px;\n" +
                        "    margin-right: 0px;\n" +
                        "  }\n" +
                        "  .hip-search.active:after, .hip-search:hover:after {\n" +
                        "    height: 0px;\n" +
                        "  }\n" +
                        "  .hip-search input {    " +
                        "    width: 100% !important;\n" +
                        "    border: none !important;\n" +
                        "    box-sizing: border-box !important;\n" +
                        "    font-family: Helvetica;\n" +
                        "    font-size: 15px;\n" +
                        "    color: inherit !important;\n" +
                        "    background: transparent !important;\n" +
                        "    outline-width: 0px;\n" +
                        "    padding: 0 !important;\n" +
                        "    margin: 0 !important;}" +
                        "</style>"
                        );
            }
        });
    } else {
        throw new Error("Element not found");
    }
    return this;
};

var filters = {price: $("#myRange").val(), brand: "", rating: 0, search: ""};
var init_filter = 0;

function showPage(elem) {
    var pageToShow = $(elem).attr("data-cur-page");
    var itemsPerPage = $(elem).attr("data-item-per-page");
    var hip_items = $(elem).find(".hip-item").not(".hip-item-out");
    var minLim = (pageToShow - 1) * itemsPerPage;
    var maxLim = pageToShow * itemsPerPage - 1;

    $(elem).find(".hip-item").addClass("hip-item-hidden");

    for (var i = 0; i < hip_items.length; i++) {
        if (i >= minLim && i <= maxLim) {
            $(hip_items[i]).removeClass("hip-item-hidden");
        }
    }
}

$(document).on("click", ".hip-pagination a", function (e) {
    e.preventDefault();
    var hip_elem = $(this).parent().prev(".hip-grid");

    var curPage = hip_elem.attr("data-cur-page");
    var itemsPerPage = hip_elem.attr("data-item-per-page");
    var hip_item_length = hip_elem.find(".hip-item").length;
    var page_length = Math.ceil(hip_item_length / itemsPerPage);
    var pageToShow = $(this).attr("href").toString().replace("#", "");

    if (pageToShow === "prev") {
        if (!isNaN(curPage) && parseInt(curPage) > 1) {
            hip_elem.attr("data-cur-page", parseInt(curPage) - 1);
            $(this).parent().find("a").removeClass("active");
            $(this)
                    .parent()
                    .find("a[href$='#" + (parseInt(curPage) - 1) + "']")
                    .addClass("active");
        }
    } else if (pageToShow === "next") {
        if (!isNaN(curPage) && parseInt(curPage) < page_length) {
            hip_elem.attr("data-cur-page", parseInt(curPage) + 1);
            $(this).parent().find("a").removeClass("active");
            $(this)
                    .parent()
                    .find("a[href$='#" + (parseInt(curPage) + 1) + "']")
                    .addClass("active");
        }
    } else if (!isNaN(pageToShow) && parseInt(pageToShow) <= page_length) {
        hip_elem.attr("data-cur-page", parseInt(pageToShow));
        $(this).parent().find("a").removeClass("active");
        $(this)
                .parent()
                .find("a[href$='#" + parseInt(pageToShow) + "']")
                .addClass("active");
    }

    showPage(hip_elem);
});

$(document).on("keyup", ".hip-search-input", function () {
    var obj = $(this).parent().parent().next();
    var objPagination = $(this).parent().parent().next().next();
    let search = $(this).val().trim();
    filters.search = search;

    var itemsPerPage = obj.attr("data-item-per-page");
    var items = obj.find(".hip-item");
    var filteredLen = Math.ceil(getFilteredItems(items, filters) / itemsPerPage);

    objPagination
            .find("a")
            .not(":first")
            .not(":last")
            .each(function (index, item) {
                if (index <= filteredLen - 1) {
                    $(item).removeClass("hip-item-hidden");
                } else {
                    $(item).addClass("hip-item-hidden");
                }
            });

    objPagination.find("a[href$='#1']").click();
});

$('input[type="checkbox"]').not('#modal').click(function () {
    if ($(this).prop("checked") === true) {
        let brand = $(this).parent().text().trim();
        filters.brand = brand;

        var obj = $(".hip-search-input").parent().parent().next();
        var objPagination = $(".hip-search-input").parent().parent().next().next();

        var itemsPerPage = obj.attr("data-item-per-page");
        var items = obj.find(".hip-item");
        var filteredLen = Math.ceil(getFilteredItems(items, filters) / itemsPerPage);

        objPagination
                .find("a")
                .not(":first")
                .not(":last")
                .each(function (index, item) {
                    if (index <= filteredLen - 1) {
                        $(item).removeClass("hip-item-hidden");
                    } else {
                        $(item).addClass("hip-item-hidden");
                    }
                });

        $.each($('input[type="checkbox"]'), function (index, item) {
            if ($(this).prop("checked") === false && !item.id) {
                item.disabled = true;
                item.parentElement.style.cursor = "not-allowed";
            }
        });

        objPagination.find("a[href$='#1']").click();
    } else if ($(this).prop("checked") === false) {
        var obj = $(".hip-search-input").parent().parent().next();
        var objPagination = $(".hip-search-input").parent().parent().next().next();
        filters.brand = "";

        var itemsPerPage = obj.attr("data-item-per-page");
        var items = obj.find(".hip-item");
        var filteredLen = Math.ceil(getFilteredItems(items, filters) / itemsPerPage);

        objPagination
                .find("a")
                .not(":first")
                .not(":last")
                .each(function (index, item) {
                    if (index <= filteredLen - 1) {
                        $(item).removeClass("hip-item-hidden");
                    } else {
                        $(item).addClass("hip-item-hidden");
                    }
                });

        $.each($('input[type="checkbox"]'), function (index, item) {
            if ($(this).prop("checked") === false && !item.id) {
                item.disabled = false;
                item.parentElement.style.cursor = "pointer";
            }
        });

        objPagination.find("a[href$='#1']").click();
    }
});

$(".slider").on("input", function () {
    let priceRange = $("#pricerange").val();
    var obj = $(".hip-search-input").parent().parent().next();
    var objPagination = $(".hip-search-input").parent().parent().next().next();
    filters.price = priceRange;

    var itemsPerPage = obj.attr("data-item-per-page");
    var items = obj.find(".hip-item");

    var filteredLen = Math.ceil(getFilteredItems(items, filters) / itemsPerPage);

    objPagination
            .find("a")
            .not(":first")
            .not(":last")
            .each(function (index, item) {
                if (index <= filteredLen - 1) {
                    $(item).removeClass("hip-item-hidden");
                } else {
                    $(item).addClass("hip-item-hidden");
                }
            });

    objPagination.find("a[href$='#1']").click();
});

$("#stars").click(function () {
    let rating = $(this).find("input").val();
    var obj = $(".hip-search-input").parent().parent().next();
    var objPagination = $(".hip-search-input").parent().parent().next().next();
    filters.rating = rating;

    var itemsPerPage = obj.attr("data-item-per-page");
    var items = obj.find(".hip-item");

    var filteredLen = Math.ceil(getFilteredItems(items, filters) / itemsPerPage);

    objPagination
            .find("a")
            .not(":first")
            .not(":last")
            .each(function (index, item) {
                if (index <= filteredLen - 1) {
                    $(item).removeClass("hip-item-hidden");
                } else {
                    $(item).addClass("hip-item-hidden");
                }
            });
    objPagination.find("a[href$='#1']").click();
});

$('.block input').click(function () {
    var obj = $(".hip-search-input").parent().parent().next();
    var items = obj.find(".hip-item");
    if ($(".block input:eq(0)").prop("checked") === true) {
        items.sort((a, b) => {
            var price1 = parseInt($(a).find(".euros").text());
            var price2 = parseInt($(b).find(".euros").text());
            return (price1 - price2);
        });
    } else if ($(".block input:eq(1)").prop("checked") === true) {
        items.sort((a, b) => {
            var price1 = parseInt($(a).find(".euros").text());
            var price2 = parseInt($(b).find(".euros").text());
            return (price2 - price1);
        });
    } else if ($(".block input:eq(2)").prop("checked") === true) {
        items.sort((a, b) => {
            var rating1 = parseInt($(a).find(".rating2").attr("value"));
            var rating2 = parseInt($(b).find(".rating2").attr("value"));
            return (rating1 - rating2);
        });
    } else if ($(".block input:eq(3)").prop("checked") === true) {
        items.sort((a, b) => {
            var rating1 = parseInt($(a).find(".rating2").attr("value"));
            var rating2 = parseInt($(b).find(".rating2").attr("value"));
            return (rating2 - rating1);
        });
    }

    $("#products ul").empty();

    $(items).each(function (index) {
        $(this).appendTo('#products ul');
    });

    var objPagination = $(".hip-search-input").parent().parent().next().next();
    objPagination.find("a[href$='#1']").click();
});

function getFilteredItems(items, filters) {
    init_filter = 0;
    var enteredPrice = parseInt(filters.price);
    var enteredStars = parseInt(filters.rating);
    var enteredBrand = filters.brand.trim().toLowerCase();
    var enteredText = filters.search.trim().toLowerCase();
    var i = 0;

    items.filter(function () {
        var price = parseInt($(this).find(".euros").text());
        var stars = parseInt($(this).find(".rating2").attr("value"));
        var brand = $(this).html().trim().toLowerCase().indexOf(enteredBrand) > -1;
        var text = $(this).html().trim().toLowerCase().indexOf(enteredText) > -1;

        i++;

        if (enteredStars === 0) {
            if (enteredBrand !== "") {
                if (enteredText !== "") {
                    if (price <= enteredPrice && brand && text) {
                        init_filter++;
                        $(this).removeClass("hip-item-out");
                    } else {
                        $(this).addClass("hip-item-out");
                    }
                } else {
                    if (price <= enteredPrice && brand) {
                        init_filter++;
                        $(this).removeClass("hip-item-out");
                    } else {
                        $(this).addClass("hip-item-out");
                    }
                }
            } else {
                if (enteredText !== "") {
                    if (price <= enteredPrice && text) {
                        init_filter++;
                        $(this).removeClass("hip-item-out");
                    } else {
                        $(this).addClass("hip-item-out");
                    }
                } else {
                    if (price <= enteredPrice) {
                        init_filter++;
                        $(this).removeClass("hip-item-out");
                    } else {
                        $(this).addClass("hip-item-out");
                    }
                }
            }
        } else {
            if (enteredBrand !== "") {
                if (enteredText !== "") {
                    if (price <= enteredPrice && brand && stars === enteredStars && text) {
                        init_filter++;
                        $(this).removeClass("hip-item-out");
                    } else {
                        $(this).addClass("hip-item-out");
                    }
                } else {
                    if (price <= enteredPrice && brand && stars === enteredStars) {
                        init_filter++;
                        $(this).removeClass("hip-item-out");
                    } else {
                        $(this).addClass("hip-item-out");
                    }
                }
            } else {
                if (enteredText !== "") {
                    if (price <= enteredPrice && stars === enteredStars && text) {
                        init_filter++;
                        $(this).removeClass("hip-item-out");
                    } else {
                        $(this).addClass("hip-item-out");
                    }
                } else {
                    if (price <= enteredPrice && stars === enteredStars) {
                        init_filter++;
                        $(this).removeClass("hip-item-out");
                    } else {
                        $(this).addClass("hip-item-out");
                    }
                }
            }
        }
    });

    return init_filter;
}