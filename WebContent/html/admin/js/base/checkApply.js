(function($) {
    var sel = {
        1: {
            10: "β��",
            11: "�ֻ��ڻ�",
            12: "���",
            13: "��ծ",
            14: "ȡ������"
        },
        2: {
            20: "γб",
            21: "�Ͼ�",
            22: "��γ",
            23: "�ƶ�"
        },
        3: {
            30: "ɫ��",
            31: "ɫ��",
            32: "����",
            33: "��ծ"
        },
        4: {
            40: "¶��",
            41: "ӡ��ɫ���ȣ��ߵ㣩",
            42: "��ɫ�۰�",
            43: "˫��ɫ��",
            44: "�����λ"
        },
        5: {
            50: "�ָ�����",
            51: "���ƻ�ɫ������"
        },
        6: {
            60: "�ɷ�",
            61: "�ߴ��ȶ���",
            62: "ɫ�ζ�",
            63: "˺��ǿ��",
            64: "��ȩ",
            65: "PH",
            66: "��ë����ȼ�ⲻ����"
        },
        7: {
            70: "��ϸ����"
        }
    };
    var dataVal = 0;
    var _res = 'Ϊ���⽻�׾��ף���Կ��ԭ������ϸ����';
    var _key = ['company', 'name', 'mobile']
    var _company = '��˾��';
    var _mobile = '�ֻ���';
    var _name = '��ϵ��';

    $(".J_Select_rea").length &&
        $(".J_Select_rea").on('change', function() {
            dataVal = $(this).find("option:selected").attr("data-value");
            var next = $(this).next().next('.J_Select_rea1')
            next.html("");
            for (var i in sel[dataVal]) {
                next.append("<option value=" + sel[dataVal][i] + ">" + sel[dataVal][i] + "</option>");
            }
        });

    $(".J_textarea").length &&
        $(".J_textarea").on('focus', function() {
            if (this.value == _res) {
                this.value = '';
            } else {

            }
        }).on('blur', function() {
            if (this.value == '' || this.value == undefined) {
                this.value = _res;
                optTip(this, 1);
            } else {
                optTip(this, 0);
            }
        }).on('keyup', function() {
            optTip(this, 0);
        });
    $(".J_Select_rea").trigger("change");

    $(".J_Contact_company").length &&
        $(".J_Contact_company")
        .on('focus', function() {
            if (this.value == _company) {
                optTip(this, 1);
                this.value = '';
            } else  {
                optTip(this, 0);
            }
        })
        .on('blur', function() {
            if (this.value == '' || this.value == undefined) {
                this.value = _company;
                optTip(this, 1);
            } else {
                optTip(this, 0);
            }
        })
        .on('keyup', function(){
            optTip(this, 0);
        });
    $(".J_Contact_mobile").length &&
        $(".J_Contact_mobile")
        .on('focus', function() {
            if (this.value == _mobile) {
                optTip(this, 1);
                this.value = '';
            } else {
                optTip(this, 0);
            }
        })
        .on('blur', function() {
            if (this.value == '' || this.value == undefined) {
                this.value = _mobile;
                optTip(this, 1);
            } else {
                optTip(this, 0);
            }
        })
        .on('keyup', function(){
            optTip(this, 0);
        });
    $(".J_Contact_name").length &&
        $(".J_Contact_name")
        .on('focus', function() {
            if (this.value == _name) {
                this.value = '';
                optTip(this, 1);
            } else {
                optTip(this, 0);
            }
        })
        .on('blur', function() {
            if (this.value == '' || this.value == undefined) {
                this.value = _name;
                optTip(this, 1);
            } else {
                optTip(this, 0);
            }
        })
        .on('keyup', function() {
            optTip(this, 0);
        });

    $(".J_Btn_save").click(function() {
        var tr = $(this).parent().parent().parent();
        var id = tr.attr('data-id');
        if (!isNaN(id)) {
            if (checkSave(tr) == false) {
                return false;
            }
            applyFormByID(id);
        }
        return false;
    });


    function optTip(t,isTip) {
        if (isTip) {
            $(t).addClass("input-tip");
        } else {
            $(t).removeClass("input-tip");
        }
    }
    function selectAll() {
        $("#applyForm").find("input[type='checkbox']").each(function() {
            $(this).prop("checked", true);
        })
    }

    function selectNull() {
        $("#applyForm").find("input[type='checkbox']").each(function() {
            $(this).prop("checked", false);
        })
    }

    function applyFormByID(id) {
        selectNull();
        $("input[name='productId'][value=" + id + "]").prop("checked", true);
        if ($("input[name='productId']:checked").length) {
            $("#applyForm").submit();
        } else {
            alert("��ѡ���Ʒ");
        }
    }

    $("#J_SelectAll").change(function() {
        if ($(this).prop('checked') == true) {
            selectAll();
        } else {
            selectNull();
        }
    })

    $("#btn-submit-apply").click(function() {
        var trs = $(this).parent().parent().find('.tr');
        var ckb = 0,
            tag = true;
        trs.each(function(i) {
            if ($(this).find(".td-chk").find("input[type='checkbox']").prop("checked")) {
                ckb++;
                if (checkSave($(this), i + 1) == false) {
                    tag = false;
                    return false;
                }
            }
        });

        if (tag == false) {
            return false;
        }
        if (ckb == 0) {
            alert('δѡ������Ĳ�Ʒ');
        }
    });

    function checkSave(tr, num) {
        var company = $.trim(tr.find(".J_Contact_company").val());
        var mobile = $.trim(tr.find(".J_Contact_mobile").val());
        var name = $.trim(tr.find(".J_Contact_name").val());
        var textarea = $.trim(tr.find(".J_textarea").val());
        var oPirce = $.trim(tr.find(".J_oPirce").val());
        var pirce = $.trim(tr.find(".J_Pirce").val());
        var unit = $.trim(tr.find(".J_Unit").val());

//        var status = tr.attr('data-status');
        if (oPirce == "" || !(/^[+-]?\d+(\.\d+)?$/.test(oPirce))) {
            showError("ԭ�� ����Ϊ�ջ���ȷ", num);
            return false;
        }
        if (pirce == "" || !(/^[+-]?\d+(\.\d+)?$/.test(pirce))) {
            showError("���� ����Ϊ�ջ���ȷ", num);
            return false;
        }
        if (unit == "") {
            showError("����� ����Ϊ��", num);
            return false;
        }
        
        if (tr.find(".J_cp").prop("checked") == true) {
            if ( ! checkPcPrice(tr)) {
            	showError("�����÷������ۼ۸�", num);
                return false;
            }	
        }
       

        if (tr.find(".J_Way2").prop("checked")) {
            if ($.trim($(".J_Way2").parent().next().find('input').val()) == '') {
                showError(" �����������ݲ���Ϊ��", num);
                return false;
            }
        }
        if (company == _company || company == "") {
            showError(_company + " ����Ϊ��", num);
            return false;
        }
        if (mobile == _mobile || mobile == "" || (!(/^1[3|4|5|7|8]{1}\d{9}$/.test(mobile)))) {
            showError(_mobile + " ����Ϊ�ջ���ȷ", num);
            return false;
        }
        if (name == _name || name == "") {
            showError(_name + " ����Ϊ��", num);
            return false;
        }
        if (textarea == _res) {
        	tr.find(".J_textarea").val("");
        }

    }

    function showError(msg, num) {
        if (num) {
            alert('��' + num + '����' + msg);
        } else {
            alert('���� ' + msg);
        }
    }
    
    function checkPcPrice(t) {
        var tag = 0;
        var empty = 0;

        t.find(".qq .J_cp_unit").each(function(i) {
        	if (i==0 && $(this).val() == '' && $(this).next('input').val() == '') {
                empty = 1;
        	}
            if ($(this).val() != '' && $(this).next('input').val() == '') {
                tag = 1;
                return false;
            }

            if ($(this).val() == '' && $(this).prev('input').val() == '') {
                tag = 1;
                return false;
            }
        });

        if (tag || empty) {
            return false;
        } else {
            return true;
        }
    }

})(jQuery);