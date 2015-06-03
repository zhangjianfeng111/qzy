(function($, undefined) {
    function AutoComplete(opts) {
        this.suggestions = [];
        this.index = -1;
        this.ele = null;
        this.list = null;
        this.lis = null;
        this.disable = false;
        this.autoSubmit = false;
        this.form = null;
        this.link = null;
        this.query = '';
        /*
         *@Param: {Array} cache
         *
         */
        this.cache = {};
        /*
         *@Param: {Array} fails
         *
         */
        this.fails = [];
        this.opts = $.extend({}, opts);
        this.init();
    }

    AutoComplete.prototype = {
        init: function() {
            var _this = this;
            
            if (!_this.ele) {
                _this.ele = $(_this.opts.ele);
            }
            _this.ele.bind('keyup', function(e) {
                _this.keyUp(e);
            });
            _this.ele.bind('keydown', function(e) {
                _this.keyPress(e);
            });
            
//            _this.ele.bind('blur', function(e) {
//                _this.hideList();
//            });
            
            _this.form = _this.ele.parents("form");
          
            _this.form.submit(function() {
                if (!_this.form.attr("action")) {
                	_this.setFormAction(_this.getQuery());
                	window.location.href = _this.form.attr("action");
                   	return false;
                }
            });
            
            _this.link = $("#"+_this.ele.attr("id") + "_a");
            _this.link.click(function() {
            	window.location.href = _this.queryUrl(_this.getQuery());
            	return false;
            });
            
        },
        keyUp: function(e) {
            var e = e || window.event;
            var code = e.keyCode;

            if (code == '38' || code == '40' || code == '13' || code == '27') {
                return
            } else {
                this.getQuery();
                this.getSuggestions();
            }
            return false;
        },
        keyPress: function(e) {
            if (!this.disable) {
                return
            }

            var e = e || window.event;
            var code = e.keyCode;

            if (code == '38') {
                this.moveUp();
            } else if (code == '40') {
                this.moveDown();
            } else if (code == '13') {
                this.onEnter(this.index);
            } else if (code == '27') {
                this.hideList();
            } else {
                return;
            }
            e.stopImmediatePropagation();
            e.preventDefault();
        },
        moveUp: function() {
            this.unmarkSelected();
            this.index--;
            if (this.index === -2) {
                this.index = this.suggestions.length - 1;
            }
            this.markSelected();
            this.select();
        },
        moveDown: function() {
            this.unmarkSelected();
            this.index++;

            if (this.index > this.suggestions.length - 1) {
                this.index = -1;
            }
            this.markSelected();
            this.select();
        },
        markSelected: function() {
            var lis = this.lis;
            if (this.index > -1) {
                lis.eq(this.index).addClass('selected');
            }
        },
        unmarkSelected: function() {
            var lis = this.lis;
            if (this.index > -1) {
                lis.eq(this.index).removeClass('selected');
            }
        },
        select: function() {
            if (this.index == -1 || this.index >= this.suggestions.length) {
                this.ele.val(this.query);
                //this.setFormAction(this.query);
                return;
            }
            var newQuery = this.suggestions[this.index].key;
            //do some query format.
            this.ele.val(newQuery);
            //this.setFormAction(newQuery);
            if (this.autoSubmit) {
                this.form.submit();
            }
        },
        onEnter: function() {
            this.hideList();
            if (this.opts.onEnter) {
                return
            };
            if (this.form.length > 0 && this.queryUrl(this.getQuery())) {
            	this.form.submit();
            } else {
            	this.link.click();
            }
        },
        getQuery: function() {
            this.query = $.trim(this.ele.val());
            return this.query;
        },
        showList: function() {
            this.list.show();
            this.disable = true;
            var _this = this;
            $(document).bind('click', function() {
                _this.hideList();
                $(document).unbind('click');
            });
        },
        hideList: function() {
        	if (this.list) {
        		this.list.hide();
                this.disable = false;
        	}
        },
        getSuggestions: function() {
            if (this.query == "") {
            	this.hideList();
                return; 
            }

           var query = GBKencodeURIComponent(this.query);

            var type = this.ele.attr('data-type');

            if (this.cache[query]) {
                this.suggestions = this.cache[query];
                this.handleSuggestion();
                return
            }
            if (this.isFail(query)) {
            	//this.setFormAction(query);
            	this.hideList();
                return;
            }

            var _this = this;
            $.get(this.opts.url, {
                q: query,
                t: type
            }, function(json) {
                if (json.length < 1) {
                	//_this.setFormAction(_this.query);
                    _this.fails.push(query);
                }
                var str = [];
                for (var i = 0; i <json.length; i++) {
                    var one = json[i];
                    str.push({
                        key: one.title,
                        value: one.title
                    });
                };
                _this.suggestions = str;
                _this.cache[query] = str;
                _this.handleSuggestion();
            });
        },
        isFail: function(string) {
            var isfail = false;
            for (var i = 0; i < this.fails.length; i++) {
                var fail = this.fails[i];
                if (string == fail) {
                    isfail == true;
                    break;
                }
            }

            return isfail;
        },
        queryUrl: function(key){
        	key =  $.trim(key.replace("\/",""));
            var uri = this.ele.attr('data-url');
            if (uri) {
            	uri = uri.replace("{key}", GBKencodeURIComponent(key));
            }
            return uri;
        },
        setFormAction: function(key){
            this.form.attr("action", this.queryUrl(key));
        },
        handleSuggestion: function() {
            var len = this.suggestions.length;
            var sugg = $('<ul class="act-ac-list">');
            var _this = this;
            for (var i = 0; i < len; i++) {
                var li = $('<li>' + this.suggestions[i].value + '</li>');
                li.bind('mouseover', (function(index) {
                    return function() {
                        _this.unmarkSelected();
                        _this.index = index;
                        _this.markSelected();
                    };
                })(i));
                li.bind('click', (function(index) {
                    return function() {
                        _this.index = index;
                        _this.select();
                        _this.onEnter();
                    };
                })(i));
                li.appendTo(sugg);
            }

            if (!this.list) {
                this.list = $('<div style="display:none"></div>').appendTo('body');
                var elePos = this.ele.offset();
                this.list.css({
                    position: "absolute",
                    zIndex: 9999,
                    background: '#fff',
                    border:"1px solid #ccc",
                    top: elePos.top + this.ele.outerHeight(),
                    left: elePos.left,
                    width: (this.opts.width || (this.ele.outerWidth() < 208 ? this.ele.outerWidth() : 208))
                });
            }
            this.index = -1;
            this.list.html(sugg);
            this.lis = this.list.find('li');
            this.showList();
        }
    }

    $.fn.qfcac = function(opts) {
        this.each(function() {
            var _this = $(this);
            var baseUrl = QFC.config.path.rootPath + "/search/keyword.html";
            
            return new AutoComplete($.extend({
                ele: _this,
                url: baseUrl
            }, opts));
        });
    }
})(jQuery)