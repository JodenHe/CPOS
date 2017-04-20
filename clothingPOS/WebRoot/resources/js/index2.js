$(function() {
	setInterval("showTime()",1000);
	$('.selectCombo').comboSelect();
	/* center modal */ 
	function centerModals() { 
		$('#saleModal').each(function(i) { 
		var $clone = $(this).clone().css('display', 'block').appendTo('body'); var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2); 
		top = top > 0 ? top : 0; 
		$clone.remove(); 
		$(this).find('.modal-content').css("margin-top", top); 
	}); 
	} 
	$('#saleModal').on('show.bs.modal', centerModals); 
	$(window).on('resize', centerModals); 
});


function showTime(){
        var date     = new Date();
        var year     = date.getFullYear();    //获取完整的年份(4位,1970-????)
        var month     = date.getMonth() + 1;   //获取当前月份(0-11,0代表1月)
        var da         = date.getDate();        //获取当前日(1-31)
        var day     = date.getDay();         //获取当前星期X(0-6,0代表星期天)        
        var hour     = date.getHours();       //获取当前小时数(0-23)
        var minute     = date.getMinutes();     //获取当前分钟数(0-59)
        var seconds = date.getSeconds();     //获取当前秒数(0-59)
        var dateString = year + "年" + checkNum(month) + " 月" + checkNum(da) +"日";
        var timeString = checkNum(hour) + ":" + checkNum(minute) + ":" + checkNum(seconds) + "";
        var dayString = "";
        switch(day){
        	case 0 : dayString = "星期日";
        	break;
        	case 1 : dayString = "星期一";
        	break;
        	case 2 : dayString = "星期二";
        	break;
        	case 3 : dayString = "星期三";
        	break;
        	case 4 : dayString = "星期四";
        	break;
        	case 5 : dayString = "星期五";
        	break;
        	default: dayString = "星期六";
        }
        $('#saleDate').text(dateString);
        $(".now").text(dateString +"   "+ timeString +"   "+ dayString);
        
        $('#timeString').text(timeString);
        $('#dayString').text(dayString);
    }
    
    function checkNum(num){
        if(num < 10){
            return "0" + num; 
        }
        return num;
    }