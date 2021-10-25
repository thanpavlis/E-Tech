$.fn.rating2 = function (options) {
  if (typeof options == "undefined") options = {};
  var ratings = [];
  objs = this;
  if (objs.length) {
    for (var i = 0; i < objs.length; i++) {
      ratings.push(new simpleRating2(options, objs[i]));
    }
  }
};

class simpleRating2 {
  constructor(options, obj) {
    this.obj = obj;
    this.options = options;
    this.rating = 0;
    this.init();
  }

  init() {
    var html = '<div class="simple-rating star-rating">';
    for (var i = 0; i < 5; i++) {
      html += '<i class="fa fa-star-o" data-rating="' + (i + 1) + '"></i>';
    }
    html += "</div>";

    $(this.obj).attr("type", "hidden").after(html);
    let x = $(this.obj).attr("value");
    for (var i = 0; i < 5; i++) {
      var starObj = $(this.obj).next().children()[i];
      if (i < +x) {
        $(starObj).removeClass("fa-star-o");
        $(starObj).addClass("fa-star");
      } else {
        $(starObj).addClass("fa-star-o");
        $(starObj).removeClass("fa-star");
      }
    }
  }
}
