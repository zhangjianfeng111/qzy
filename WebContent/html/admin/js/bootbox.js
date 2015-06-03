window.bootbox = window.bootbox || function a(b, c) {
    "use strict";
    function d(a) {
        var b = s[q.locale];
        return b ? b[a] : s.en[a];
    }
    function e(a, c, d) {
        a.preventDefault();
        var e = b.isFunction(d) && d(a) === !1;
        e || c.modal("hide");
    }
    function f(a) {
        var b, c = 0;
        for (b in a) c++;
        return c;
    }
    function g(a, c) {
        var d = 0;
        b.each(a, function(a, b) {
            c(a, b, d++);
        });
    }
    function h(a) {
        var c, d;
        if ("object" != typeof a) throw new Error("Please supply an object of options");
        if (!a.message) throw new Error("Please specify a message");
        return a = b.extend({}, q, a), a.buttons || (a.buttons = {}), a.backdrop = a.backdrop ? "static" : !1, 
        c = a.buttons, d = f(c), g(c, function(a, e, f) {
            if (b.isFunction(e) && (e = c[a] = {
                callback: e
            }), "object" !== b.type(e)) throw new Error("button with key " + a + " must be an object");
            e.label || (e.label = a), e.className || (e.className = 2 >= d && f === d - 1 ? "btn-primary" : "btn-default");
        }), a;
    }
    function i(a, b) {
        var c = a.length, d = {};
        if (1 > c || c > 2) throw new Error("Invalid argument length");
        return 2 === c || "string" == typeof a[0] ? (d[b[0]] = a[0], d[b[1]] = a[1]) : d = a[0], 
        d;
    }
    function j(a, c, d) {
        return b.extend(!0, {}, a, i(c, d));
    }
    function k(a, b, c) {
        return n(j(m.apply(null, a), b, c), a);
    }
    function l() {
        for (var a = {}, b = 0, c = arguments.length; c > b; b++) {
            var e = arguments[b], f = e.toLowerCase(), g = e.toUpperCase();
            a[f] = {
                label: d(g)
            };
        }
        return a;
    }
    function m() {
        return {
            buttons: l.apply(null, arguments)
        };
    }
    function n(a, b) {
        var d = {};
        return g(b, function(a, b) {
            d[b] = !0;
        }), g(a.buttons, function(a) {
            if (d[a] === c) throw new Error("button key " + a + " is not allowed (options are " + b.join("\n") + ")");
        }), a;
    }
    var o = {
        dialog: "<div class='bootbox modal' tabindex='-1' role='dialog'><div class='modal-dialog'><div class='modal-content'><div class='modal-body'><div class='bootbox-body'></div></div></div></div></div>",
        header: "<div class='modal-header'><h4 class='modal-title'></h4></div>",
        footer: "<div class='modal-footer'></div>",
        closeButton: "<button type='button' class='bootbox-close-button close'>&times;</button>",
        form: "<form class='bootbox-form'></form>",
        inputs: {
            text: "<input class='bootbox-input form-control' autocomplete=off type=text />"
        }
    }, p = b("body"), q = {
        locale: "zh_CN",
        backdrop: !0,
        animate: !0,
        className: null,
        closeButton: !0,
        show: !0
    }, r = {};
    r.alert = function() {
        var a;
        if (a = k([ "ok" ], arguments, [ "message", "callback" ]), a.callback && !b.isFunction(a.callback)) throw new Error("alert requires callback property to be a function when provided");
        return a.buttons.ok.callback = a.onEscape = function() {
            return b.isFunction(a.callback) ? a.callback() : !0;
        }, r.dialog(a);
    }, r.confirm = function() {
        var a;
        if (a = k([ "cancel", "confirm" ], arguments, [ "message", "callback" ]), a.buttons.cancel.callback = a.onEscape = function() {
            return a.callback(!1);
        }, a.buttons.confirm.callback = function() {
            return a.callback(!0);
        }, !b.isFunction(a.callback)) throw new Error("confirm requires a callback");
        return r.dialog(a);
    }, r.prompt = function() {
        var a, d, e, f, g, h;
        if (f = b(o.form), d = {
            buttons: l("cancel", "confirm"),
            value: ""
        }, a = n(j(d, arguments, [ "title", "callback" ]), [ "cancel", "confirm" ]), h = a.show === c ? !0 : a.show, 
        a.message = f, a.buttons.cancel.callback = a.onEscape = function() {
            return a.callback(null);
        }, a.buttons.confirm.callback = function() {
            return a.callback(g.val());
        }, a.show = !1, !a.title) throw new Error("prompt requires a title");
        if (!b.isFunction(a.callback)) throw new Error("prompt requires a callback");
        return g = b(o.inputs.text), g.val(a.value), f.append(g), f.on("submit", function(a) {
            a.preventDefault(), e.find(".btn-primary").click();
        }), e = r.dialog(a), e.off("shown.bs.modal"), e.on("shown.bs.modal", function() {
            g.focus();
        }), h === !0 && e.modal("show"), e;
    }, r.dialog = function(a) {
        a = h(a);
        var c = b(o.dialog), d = c.find(".modal-body"), f = a.buttons, i = "", j = {
            onEscape: a.onEscape
        };
        if (g(f, function(a, b) {
            i += "<button data-bb-handler='" + a + "' type='button' class='btn " + b.className + "'>" + b.label + "</button>", 
            j[a] = b.callback;
        }), d.find(".bootbox-body").html(a.message), a.animate === !0 && c.addClass("fade"), 
        a.className && c.addClass(a.className), a.title && d.before(o.header), a.closeButton) {
            var k = b(o.closeButton);
            a.title ? c.find(".modal-header").prepend(k) : k.css("margin-top", "-10px").prependTo(d);
        }
        return a.title && c.find(".modal-title").html(a.title), i.length && (d.after(o.footer), 
        c.find(".modal-footer").html(i)), c.on("hidden.bs.modal", function(a) {
            a.target === this && c.remove();
        }), c.on("shown.bs.modal", function() {
            c.find(".btn-primary:first").focus();
        }), c.on("escape.close.bb", function(a) {
            j.onEscape && e(a, c, j.onEscape);
        }), c.on("click", ".modal-footer button", function(a) {
            var d = b(this).data("bb-handler");
            e(a, c, j[d]);
        }), c.on("click", ".bootbox-close-button", function(a) {
            e(a, c, j.onEscape);
        }), c.on("keyup", function(a) {
            27 === a.which && c.trigger("escape.close.bb");
        }), p.append(c), c.modal({
            backdrop: a.backdrop,
            keyboard: !1,
            show: !1
        }), a.show && c.modal("show"), c;
    }, r.setDefaults = function(a) {
        b.extend(q, a);
    }, r.hideAll = function() {
        b(".bootbox").modal("hide");
    };
    var s = {
        br: {
            OK: "OK",
            CANCEL: "Cancelar",
            CONFIRM: "Sim"
        },
        da: {
            OK: "OK",
            CANCEL: "Annuller",
            CONFIRM: "Accepter"
        },
        de: {
            OK: "OK",
            CANCEL: "Abbrechen",
            CONFIRM: "Akzeptieren"
        },
        en: {
            OK: "OK",
            CANCEL: "Cancel",
            CONFIRM: "OK"
        },
        es: {
            OK: "OK",
            CANCEL: "Cancelar",
            CONFIRM: "Aceptar"
        },
        fi: {
            OK: "OK",
            CANCEL: "Peruuta",
            CONFIRM: "OK"
        },
        fr: {
            OK: "OK",
            CANCEL: "Annuler",
            CONFIRM: "D'accord"
        },
        it: {
            OK: "OK",
            CANCEL: "Annulla",
            CONFIRM: "Conferma"
        },
        nl: {
            OK: "OK",
            CANCEL: "Annuleren",
            CONFIRM: "Accepteren"
        },
        pl: {
            OK: "OK",
            CANCEL: "Anuluj",
            CONFIRM: "Potwierdź"
        },
        ru: {
            OK: "OK",
            CANCEL: "Отмена",
            CONFIRM: "Применить"
        },
        zh_CN: {
            OK: "OK",
            CANCEL: "取消",
            CONFIRM: "确认"
        },
        zh_TW: {
            OK: "OK",
            CANCEL: "取消",
            CONFIRM: "確認"
        }
    };
    return r.init = function(c) {
        window.bootbox = a(c || b);
    }, r;
}(window.jQuery);