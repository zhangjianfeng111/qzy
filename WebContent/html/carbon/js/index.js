/**
 * Created by zxk on 2015/4/23.
 */
$(document).ready(function(){
    $("#main_nav_link").hover(function(){
        $("#main_cata").show();
    },function(){
        $("#main_cata").hide();
    });
    
    $("#main_cata").hover(function(){
        $(this).show();
    },function(){
        $(this).hide();
    });

    var len = $("#bootha li").length;
    var indexs = 0;
    var adTimer;
    $("#bootha li").click(function(){
        indexs = $(this).index();
        showIMG(indexs);
    });
    $("#booth").hover(function(){
        clearInterval(adTimer);
    },function(){
        adTimer = setInterval(function(){
            indexs++;
            if( indexs == len){
                indexs = 0;
            }
            showIMG(indexs);
        },3000)
    }).trigger("mouseleave");
});

function showIMG(index){
    var adWidth = $("#booth").width();
    $("#booths").stop().animate({left:-adWidth*index},1000);
    $("#bootha li").removeClass("on").eq(index).addClass("on");
}
function showBg(){
    $("#dialog").show();
}
function closeBg(){
    $("#dialog").hide();
}
function showBg1(id){
    $("#dialog_"+id).show();
}
function closeBg1(id){
	$("#dialog_"+id).hide();
}
function selectAll(){
	var obj = document.getElementById("selectall");
	var cks = document.getElementsByTagName("input");
	var ckslen = cks.length;
	for(var i = 0;i <= ckslen - 1;i++ ){
		if(cks[i].type == "checkbox"){
			cks[i].checked = obj.checked;
		}
	}
}