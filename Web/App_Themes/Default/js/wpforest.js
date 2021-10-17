
function objectWithPrototype(a, b) {
    function c() {}
    var d, e;
    c.prototype = a;
    d = new c;
    d.prototype = a;
    if ("undefined" !== typeof b) for (e in b) b.hasOwnProperty(e) && (d[e] = b[e]);
    return d
}

var PopUp = {
    //price_prefix: "<sup>$</sup>",
    positionPopUpNextTo: function (a) {
        var b, c;
        b = this.popupDiv();
        c = $(a).offset().top + $(a).outerHeight() - b.outerHeight();
        c < $(window).scrollTop() && (c = $(window).scrollTop());
        a = $(a).offset().left + $(a).outerWidth() / 2 >= $(window).width() / 2 ? $(a).offset().left - b.outerWidth() : $(a).offset().left + $(a).outerWidth();
        b.css({
            top: c,
            left: a
        })
    },
    showPopUp: function (a) {
        void 0 === $(a).attr("data-tooltip") && ($(a).attr("data-tooltip", $(a).attr("title")), $(a).attr("title", ""), $("img", a).attr("title", ""));
        this.populatePopUpFrom(a);
        this.positionPopUpNextTo(a);
        this.popupDiv().css({
            display: "inline"
        })
    },
    hidePopUp: function () {
        this.popupDiv().hide()
    },
    magnify: function (a) {
        var b = this;
        $(a).live("mouseenter", function () {
            b.showPopUp(this)
        });
        $(a).live("mouseleave", function () {
            b.hidePopUp(this)
        })
    },
    bindMetaData: function (a) {
        var b = $(a),
            c = this.popupDiv(),
            d = c.find("strong").empty(),
            e = c.find(".author").empty(),
            f = c.find(".category").empty(),
            h = c.find(".cost").empty();
        c.find(".information");
        c = b.attr("data-item-cost");
        a = "undefined" !== typeof $(a).attr("data-item-cost");
        d.html(b.attr("data-item-name"));
        e.html(b.attr("data-item-author"));
        f.html(b.attr("data-item-category"));
        h.html(a ?c : c)
    }
},
    ImagePopUp = objectWithPrototype(PopUp, {
        populatePopUpFrom: function (a) {
            var b, c = this.popupDiv().find("div.size-limiter"),
                d = $(a);
            d.attr("popup-large") ? (b = new Image, $(b).attr("src", d.attr("popup-large")), d.attr("image-preview-height") && ($(b).attr("height", 350), $(b).attr("width", 350 / d.attr("image-preview-height") * d.attr("image-preview-width"))), c.empty(), c.append(b), c.show()) : c.hide();
            this.bindMetaData(a)
        }
    }),
    ThemePopup = objectWithPrototype(ImagePopUp, {
        popupDiv: function () {
            return $("div#thumbnail-image-popup")
        },
        populatePopUpFrom: function (a) {
            var b, c, d, e, f, h = this.popupDiv(),
                k = h.find("div.size-limiter").empty(),
                m = h.find("strong");
            b = new Image;
            $(b).attr("src", $(a).attr("popup-large"));
            c = parseInt($(a).attr("image-preview-height"), 10);
            d = parseInt($(a).attr("image-preview-width"), 10);
            $(k).empty();
            $(k).css("height", "");
            $(k).css("width", "");
            $(h).removeClass("previewable");
            0 < c * d ? (c > d ? (e = 350, f = 350 / c * d) : (f = 350, e = 350 / d * c), $(b).attr("height", e), $(b).attr("width", f), m.css("width", f), h.css("width", f), $(k).css("height", e), $(k).css("width", f), $(a).hasClass("home-page-home-page-no_preview") || ($(h).addClass("previewable"), c = $(a).clone(), c.addClass("thumbnail_preview").attr("width", f).attr("height", e), $(k).append(c)), $(k).show()) : $(b).attr("height", 225);
            $(k).append(b);
            this.bindMetaData(a)
        }
    })
$(function () {
    ThemePopup.magnify("img.thumbnail-image-popup");
}
);












$('ul.tabs').each(function(){
					// For each set of tabs, we want to keep track of
					// which tab is active and it's associated content
					var $active, $content, $links = $(this).find('a');
					
					
					// Use the first link as the initial active tab
					$active = $links.first().addClass('active');
					$content = $($active.attr('href'));

					// Hide the remaining content
					$links.not(':first').each(function () {
						$($(this).attr('href')).hide();
					});

					// Bind the click event handler
					$(this).on('click', 'a', function(e){
						// Make the old tab inactive.
						$active.removeClass('active');
						$content.hide();

						// Update the variables with the new link and content
						$active = $(this);
						$content = $($(this).attr('href'));

						// Make the tab active.
						$active.addClass('active');
						$content.show();

						// Prevent the anchor's default click action
						e.preventDefault();
					});
				});




$('ul.tabs').each(function(){
					// For each set of tabs, we want to keep track of
					// which tab is active and it's associated content
					var $active, $content, $links = $(this).find('li');

					// Use the first link as the initial active tab
					$active = $links.first().addClass('selected');
					$content = $($active.attr('href'));

					// Hide the remaining content
					$links.not(':first').each(function () {
						$($(this).attr('li')).hide();
					});

					// Bind the click event handler
					$(this).on('click', 'li', function(e){
						// Make the old tab inactive.
						$active.removeClass('selected');
						$content.hide();

						// Update the variables with the new link and content
						$active = $(this);
						$content = $($(this).attr('selected'));

						// Make the tab active.
						$active.addClass('selected');
						$content.show();

						// Prevent the anchor's default click action
						e.preventDefault();
					});
				});
