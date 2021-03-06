/*!
 Bootstrap integration for DataTables' Editor
 ©2015 SpryMedia Ltd - datatables.net/license
*/
(function(c) {
    "function" === typeof define && define.amd ? define(["jquery", "datatables.net-bs4", "datatables.net-editor"], function(a) {
        return c(a, window, document)
    }) : "object" === typeof exports ? module.exports = function(a, d) {
        a || (a = window);
        if (!d || !d.fn.dataTable)
            d = require("datatables.net-bs4")(a, d).$;
        d.fn.dataTable.Editor || require("datatables.net-editor")(a, d);
        return c(d, a, a.document)
    }
    : c(jQuery, window, document)
}
)(function(c, a, d) {
    a = c.fn.dataTable;
    a.Editor.defaults.display = "bootstrap";
    var e = a.Editor.defaults.i18n;
    e.create.title = '<h5 class="modal-title">' + e.create.title + "</h5>";
    e.edit.title = '<h5 class="modal-title">' + e.edit.title + "</h5>";
    e.remove.title = '<h5 class="modal-title">' + e.remove.title + "</h5>";
    if (e = a.TableTools)
        e.BUTTONS.editor_create.formButtons[0].className = "btn btn-primary",
        e.BUTTONS.editor_edit.formButtons[0].className = "btn btn-primary",
        e.BUTTONS.editor_remove.formButtons[0].className = "btn btn-danger";
    c.extend(!0, c.fn.dataTable.Editor.classes, {
        header: {
            wrapper: "DTE_Header modal-header"
        },
        body: {
            wrapper: "DTE_Body modal-body"
        },
        footer: {
            wrapper: "DTE_Footer modal-footer"
        },
        form: {
            tag: "form-horizontal",
            button: "btn btn-default"
        },
        field: {
            wrapper: "DTE_Field form-group row",
            label: "col-lg-4 col-form-label",
            input: "col-lg-8",
            error: "error has-error",
            "msg-labelInfo": "form-text text-secondary",
            "msg-info": "form-text text-secondary",
            "msg-message": "form-text text-secondary",
            "msg-error": "form-text text-danger",
            multiValue: "card multi-value",
            multiInfo: "small",
            multiRestore: "card multi-restore"
        }
    });
    c.extend(!0, a.ext.buttons, {
        create: {
            formButtons: {
                className: "btn-primary"
            }
        },
        edit: {
            formButtons: {
                className: "btn-primary"
            }
        },
        remove: {
            formButtons: {
                className: "btn-danger"
            }
        }
    });
    var b;
    a.Editor.display.bootstrap = c.extend(!0, {}, a.Editor.models.displayController, {
        init: function(a) {
            if (!b._dom.content) {
                b._dom.content = c('<div class="modal fade"><div class="modal-dialog"><div class="modal-content"/></div></div>');
                b._dom.close = c('<button class="close">&times;</div>');
                b._dom.close.click(function() {
                    b._dte.close("icon")
                });
                c(d).on("click", "div.modal", function(a) {
                    c(a.target).hasClass("modal") && b._shown && b._dte.background()
                })
            }
            a.on("displayOrder.dtebs", function() {
                c.each(a.s.fields, function(a, b) {
                    c("input:not([type=checkbox]):not([type=radio]), select, textarea", b.node()).addClass("form-control")
                })
            });
            return b
        },
        open: function(a, e, d) {
            if (b._shown)
                d && d();
            else {
                b._dte = a;
                b._shown = true;
                a = b._dom.content.find("div.modal-content");
                a.children().detach();
                a.append(e);
                c("div.modal-header", e).append(b._dom.close);
                c(b._dom.content).one("shown.bs.modal", function() {
                    b._dte.s.setFocus && b._dte.s.setFocus.focus();
                    d && d()
                }).one("hidden", function() {
                    b._shown = false
                }).appendTo("body").modal({
                    backdrop: "static",
                    keyboard: false
                })
            }
        },
        close: function(a, d) {
            if (b._shown) {
                c(b._dom.content).one("hidden.bs.modal", function() {
                    c(this).detach()
                }).modal("hide");
                b._dte = a;
                b._shown = false
            }
            d && d()
        },
        node: function() {
            return b._dom.content[0]
        },
        _shown: !1,
        _dte: null,
        _dom: {}
    });
    b = a.Editor.display.bootstrap;
    return a.Editor
});
