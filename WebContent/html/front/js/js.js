$(function(){
	$('.list1 .leftpart .btn').mouseover(function(){
		$('.list1 .leftpart .btn').removeClass('active');
		$(this).addClass('active');
		$('.content-a').removeClass('mt0');
		$('.content-a').removeClass('mt1');
		$('.content-a').removeClass('mt2');
		$('.content-a').removeClass('mt3');
	});
	$('.list1 .leftpart .btn:eq(0)').mouseover(function(){
		$('.content-a').addClass('mt0');
	});
	$('.list1 .leftpart .btn:eq(1)').mouseover(function(){
		$('.content-a').addClass('mt1');
	});
	$('.list1 .leftpart .btn:eq(2)').mouseover(function(){
		$('.content-a').addClass('mt2');
	});
	$('.list1 .leftpart .btn:eq(3)').mouseover(function(){
		$('.content-a').addClass('mt3');
	});
	$('.diqu .header li').click(function(){
		$('.diqu .header li').removeClass('active');
		$(this).addClass('active');
		$('.diqu-b').removeClass('heer');
	});
	$('.diqu .header li:eq(0)').click(function(){
		$('.diqu-b:eq(0)').addClass('heer');
	});
	$('.diqu-b:eq(0)').addClass('heer');
	$('.diqu .header li:eq(1)').click(function(){
		$('.diqu-b:eq(1)').addClass('heer');
	});
	$('.diqu .header li:eq(2)').click(function(){
		$('.diqu-b:eq(2)').addClass('heer');
	});
	$('#details .header li').click(function(){
		$('#details .header li').removeClass('active');
		$(this).addClass('active');
	});
	$('#details .header li:eq(0)').click(function(){
		$('#details .entry').show();
		$('.comment-div').hide();
	});
	$('#details .header li:eq(1)').click(function(){
		$('#details .entry').hide();
		$('.comment-div').show();
	});
	$('.stars-div p').each(function(){
		var numpeo = parseFloat($(this).find('.num-peo').html());
		$(this).find('.per')[0].style.width=numpeo+"%";
	});
	$('#J_Product_N_add').click(function(){
		var val=parseInt($('#count').html())+1;
		$('#count').html(val);
	});
	$('#J_Product_N_').click(function(){
		var val=parseInt($('#count').html())-1;
		if(val<1) val=1;
		$('#count').html(val);
	});
	$('#J_home_N_add').click(function(){
		var val=parseInt($('#daycount').html())+1;
		$('#daycount').html(val);
	});
	$('#J_home_N_').click(function(){
		var val=parseInt($('#daycount').html())-1;
		if(val<1) val=1;
		$('#daycount').html(val);
	});
	$('.J_add_cart').click(function(){
		var skuId = $("#addCartSkuId").val();
		var productId = $("#addCartProductId").val();
		var areaSize = $('#count').html();
		var day = $('#daycount').html();
		var url = $(this).attr("data-url");
		var count = $("#count").html();
		
		var mobile = $(this).attr("data-value");
		if(productId=="7469" && !spai(mobile)){
			alert("该产品只限于一吻免单获奖用户领取");
			return false;
		}
		
		$.ajax({
			type: "GET",
			"url": url,
			data: {"skuId":skuId,"productId":productId,"areaSize":areaSize,"day":day,"productNumber":count}, 
			dataType: "json",
			success: function( data ){
				if(data.isSuccess){
					$("#gwcnum").html(data.id).show();
					swal("成功加入购物车!", " ", "success");
				}else {
					alert(data.message);
				}
			},
	        error: function() {
	            alert("网络错误，请重试！");
	        }
		});
		
		
	});
	
	
	function spai(mobile){
		var mobiles=new Array("13957161357","13456919328","18057915030","13588015492","15088660243","18806538234","18658188107","15158166658"
				,"15058100521","13606508588","13093718326","13095714177","13750887556","15968172916","13958110178","13585769109"
				,"15957131032","13456804753","13750889869","15905811635","18829269879","13588136471","13735548587","13685763270"
				,"15990053052","13336019820","18658140772","13575498061","13957143411","15088617339","15967120224","13588105706"
				,"13858029338","13456987298","15158020115","13575784816","18969924149","13858005794","13806516311","13968070602");
		var alreadymobiles = new Array(40);
		for(var i=0;i<40;i++){
			if(jQuery.inArray(mobile,mobiles) > -1 && jQuery.inArray(mobile,alreadymobiles) == -1){
				alreadymobiles.push(mobile);
				return true;
			}
		}
		return false;
	}
	
	var star = $('.star-wrapper a');
	var  starStamp = new Array();
    
//    var temp = 0;
    
    for(var i = 0, len = star.length; i < len; i++){
        star[i].index = i;
        
        star[i].onmouseover = function(){
        	 clear(this.index);
            var  line = parseInt(this.index /5) ;
            var startNum = line* 5;
            
            for(var j = startNum; j < this.index + 1; j++){
                star[j].style.backgroundPosition = '0 0';
            }
           // clear(this.index);
        }
        
        star[i].onmouseout = function(){
        		var  line = parseInt(this.index /5) ;
            var startNum = line* 5;
            for(var j = startNum; j < this.index + 1; j++){
                star[j].style.backgroundPosition = '0 -20px';
            }
            current(this.index);
        }
        
        star[i].onclick = function(){
            var temp = this.index ;
            var line = parseInt(temp/5);
            var  startNum = temp%5;
            var starValue = $(".starValue")[line];
            
            $(starValue).val(startNum +1);
            
            $('.star-wrapper-p')[line].innerHTML =( startNum +1) + ' 颗星';
            current(temp) ;
        }
    }
    //清除所有
    function clear(index ){
      	var  line = parseInt(index /5) ;
        var startNum = line* 5;
        for(var i = start, len = start +5; i < len; i++){
            star[i].style.backgroundPosition = '0 -20px';
        }
    }
    //显示当前第几颗星
    function current(temp){
//    	clear(index);
    	var  line = parseInt(temp /5) ;
        var startNum = line* 5;
        for(var i = startNum; i <=temp; i++){
            star[i].style.backgroundPosition = '0 0';
        }
        
        for(var i = temp +1 , len = startNum +5; i < len; i++){
            star[i].style.backgroundPosition = '0 -20px';
        }
    }
});




