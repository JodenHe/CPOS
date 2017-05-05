$(function() {
	setInterval("showTime()",1000);
	$('.selectCombo').comboSelect();

    modelCenter();//模态库居中
    inintSale();//初始化销售明细表
    inintReject();//初始化退货明细表
    keyEvent();//按钮触发事件
    
});

/*按钮触发事件*/
function keyEvent() {
    $(document).keydown(function(event){ 

        switch (event.keyCode){
           case 116://F5按钮
               bill();
               return false;
               break;
            case 121://F10按钮
               $("#memberCheckbox").trigger("click")
               return false;
               break;
            case 13://回车
                if ( $("#search-goods-barcode").is(':focus') ) {//如果搜索框右脚点就触发
                    searchGoods();
                    $("#goodsModal").modal('show');//打开模态库    
                    return false;
                } 
                break;
           default :console.log(event.keyCode); break;
           }
                   
      });
}

/* center modal */ 
function modelCenter(){
    function centerModals() { 
        $('#saleModal').each(function(i) { 
        var $clone = $(this).clone().css('display', 'block').appendTo('body'); var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2); 
        top = top > 0 ? top : 0; 
        $clone.remove(); 
        $(this).find('.modal-content').css("margin-top", top); 
    });
   /* $('#goodsModal').each(function(i) { 
        var $clone = $(this).clone().css('display', 'block').appendTo('body'); 
        var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2); 
        top = top > 0 ? top : 0; 
        $clone.remove(); 
        $(this).find('.modal-content').css("margin-top", top); 
    });  */
    } 
    $('#saleModal').on('show.bs.modal', centerModals); 
    // $('#goodsModal').on('show.bs.modal', centerModals); 
    $(window).on('resize', centerModals);
    
}
//backdrop 为 static 时，点击模态对话框的外部区域不会将其关闭。keyboard 为 false 时，按下 Esc 键不会关闭 Modal。
function modelStatic(){
    console.log("bbbb")
    $('#goodsModal').modal({backdrop: 'static', keyboard: false});
}

/*显示当前时间*/
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
//进行退货前先初始化
function inintReject(){
	//初始化明细表
	$("#reject-item-table tbody").html("");
	for(var i=0;i<100;i++){
		$("#reject-item-table tbody").append("<tr><td></td><td></td><td></td><td></td><td></td></tr>");
	}
	 //初始化页面的数据，售，数量，原价，会员编号，会员姓名,收款现金，找零，支付方式
    $("#rejectAmount").html("0.00");
    $("#rejectQuantity").html("0");
    $("#originalAmount").html("0.00");
}
//进行销售前先初始化
function inintSale() {
    //初始化明细表
    $("#sale-item-table tbody").html("");
    for (var i = 0;i<100;i++){
        $("#sale-item-table tbody").append("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
    }
    //初始化页面的数据，售，数量，原价，会员编号，会员姓名,收款现金，找零，支付方式
    $("#member").val("");
    $("#memberName").val("");
    $("#memberPhone").val("");
    $("#saleAmount").html("0.00");
    $("#saleQuantity").html("0");
    $("#originalAmount").html("0.00");
    $("#cashPay").val("");
    $("#change").val("");
    $("#payType").val("0");

}
//添加销售明细
function addSaleItem(barcode,name,price){
    var str = "<tr><td>"+barcode+"</td><td>"+name+"</td><td><input type='number' min='0' value='1' onchange='subTotal(this,this.value);calSale();'></td><td>"+(price-0).toFixed(2)+"</td><td>"+(price-0).toFixed(2)+"</td><td onclick='deleteSaleItem(this);'><i class='fa fa-trash-o'></i></td>></tr>"
    $("#sale-item-table tbody").prepend(str);
    calSale();
}
//删除销售明细
function deleteSaleItem(btn){
   var c = btn.parentNode;
    c.parentNode.removeChild(c);
    calSale();
}
//删除所有销售明细
function deleteAllSaleItem(btn){
    var trs = $("#sale-item-table tbody tr");//所有行
    var len = trs.length-100;//获取表格中有值的长度
    for(var i=0;i<len;i++){
        trs.eq(i).remove();
    }
    calSale();
}
//添加退货明细
function addRejectItem(itemId,quantity,subTotals){
    var str = "<tr><td>"+itemId+"</td><td><input type='number' min='0' value='"+1+"' onchange='subTotal(this,this.value);calReject();'></td><td>"+(subTotals-0).toFixed(2)+"</td><td>"+(subTotals-0).toFixed(2)+"</td><td onclick='deleteRejectItem(this);'><i class='fa fa-trash-o'></i></td>></tr>"
    $("#reject-item-table tbody").prepend(str);
    calReject();
}
//删除退货明细
function deleteRejectItem(btn){
   var c = btn.parentNode;
    c.parentNode.removeChild(c);
    calReject();
}
//删除所有退货明细
function deleteAllRejectItem(btn){
    var trs = $("#reject-item-table tbody tr");//所有行
    var len = trs.length-100;//获取表格中有值的长度
    for(var i=0;i<len;i++){
        trs.eq(i).remove();
    }
    calReject();
}
//改变数量，小计变化
function subTotal(eventObj,quantity){
   var price = $(eventObj).parent().siblings().eq(2).text() - 0;
   var subTotal = quantity * price;
   $(eventObj).parent().siblings().eq(3).html(subTotal.toFixed(2))//.toFixed(2)保留小数点两位
}
//售，原价，数量
function calSale(){
    var quantity = 0;
    var totalAmount = 0.00;
    var trs = $("#sale-item-table tbody tr");//所有行
    var len = trs.length-100;//获取表格中有值的长度
    for(var i = 0; i < len; i++){
        var num1 = trs.eq(i).find("td").eq(2).find("input").val()-0;//某个商品的购买数量
        var num2 = trs.eq(i).find("td").eq(4).text()-0;//某个商品的购买小计
        quantity +=  num1;
        totalAmount += num2
    }
    $("#saleAmount").html(totalAmount.toFixed(2));
    $("#originalAmount").html(totalAmount.toFixed(2));
    $("#saleQuantity").html(quantity);
}
//售，原价，数量
function calReject(){
    var quantity = 0;
    var totalAmount = 0.00;
    var trs = $("#reject-item-table tbody tr");//所有行
    var len = trs.length-100;//获取表格中有值的长度
    for(var i = 0; i < len; i++){
        var num1 = trs.eq(i).find("td").eq(1).find("input").val()-0;//某个商品的数量
        var num2 = trs.eq(i).find("td").eq(3).text()-0;//某个商品的小计
        quantity +=  num1;
        totalAmount += num2
    }
    $("#rejectAmount").html(totalAmount.toFixed(2));
    $("#rejectQuantity").html(quantity);
}

//结算按钮
function bill(){
    $("#totalAmount").val( $("#saleAmount").text() );
    $("#totalPrice").val( $("#originalAmount").text() );
    $("#totalDiscount").val( ($("#originalAmount").text() - $("#saleAmount").text()).toFixed(2) );
    var len = $("#sale-item-table tbody tr").length-100;//获取表格中有值的长度
    if (len>0) {
        $("#saleModal").modal('show');//打开模态库  
    } else {
        alert("没添加任何商品！");
    }
    
}
//退货结算按钮
function rejectBill(){
	$("#totalRejectAmount").val( $("#rejectAmount").text() );
	var len = $("#reject-item-table tbody tr").length-100;//获取表格中有值的长度
	if(len>0){
		$("#rejectModal").modal('show');
	}else{
		alert("没添加任何商品");
	}
}
//找零
function calChange(num){
    var result = num-$("#totalAmount").val();
    if (result < 0) {
        alert("收款现金不能小于应付款！");
    } else {
      $("#change").val(result.toFixed(2));
    }
}
//列出所有的订单，dataTable展示
function searchOrders(){
	var saleOrderNo = $("#search-order-rejectOrderNo").val();
	$.ajax({
		type:"post",
		url:contextPath + "/soi/getItemByNo",
		datatype:"json",
		data:{
			"SaleOrder.saleOrderNo":saleOrderNo
		},
		success:function(result){
			ordersDataTable(result.data1,result.data2,result.data3);
		},
		error:function(result){
			 console.log("未知错误！");
		}
	});
}
//辅助searchOrder()方法，dataTable
function ordersDataTable(data1,data2,data3){
	var goodsTable = $('#orders-table')
    .DataTable(
            {
                "destroy" : true,
                "bAutoWidth" : false,
                "aoColumnDefs" : [ {
                                        "bSearchable" : false,
                                        "aTargets" : [ 0]
                                    },
                                    {
                                        "bSortable" : false,
                                        "aTargets" : [  ]
                                    },
                                 ],
                "order": [[ 5, "desc" ]],//默认第6列降序排列
                data : data3,
                // 使用对象数组，一定要配置columns，告诉 DataTables 每列对应的属性
                columns : [ {
                    data : 'id'
                }, {
                	"className": 'goods-itemId',
                    data : 'itemId'
                }, {
                	"className": 'goods-quantity',
                    data : 'quantity'
                }, {
                	"className": 'goods-salePrice',
                    data : 'salePrice'
                },{
                    data : 'id'
                }, {
                    data : 'id'
                }, ],                        
                "language": {
                    "url": contextPath +"/resources/DataTables-1.10.13/i18n/Chinese.json"
                },
                "fnCreatedRow" : function(nRow, aData, iDataIndex) {  
                	console.log(data1);
                	$('td:eq(0)', nRow).html(
                			data1[0].customerNo
                	);
                	$('td:eq(4)', nRow).html(
                			data1[0].operatorId == 2 ? "cashier":"admin"
                	);
                	$('td:eq(5)', nRow).html(
                			data1[0].saleDateTime
                	);
                },
                "fnRowCallback" : function(nRow, aaData, iDisplayIndex,
                        iDisplayIndexFull) {
                },
});    
//添加双击事件
	$('#orders-table tbody').off('dblclick.dt');//在进行事件绑定前先关闭先前绑定的事件
	$('#orders-table tbody').one('dblclick.dt', 'tr' , function (event) {
		var itemId = $(this).find(".goods-itemId").text();
		var quantity = $(this).find(".goods-quantity").text();
		var subTotals = $(this).find(".goods-salePrice").text();
		addRejectItem(itemId,quantity,subTotals);
		$("#ordersModal").modal('hide');//关闭模态库    
	} );
}
//列出所有的商品，dataTable展示
function searchGoods() {
    var barcode = $("#search-goods-barcode").val();
    $.ajax({
        type : "POST",
        url : contextPath + "/sale/getGoodsByBarcode",
        data : {
            "Goods.barcode" : barcode
        },
        datatype : "json",
        success : function(result) {
            goodsDataTable(result);
            
        },
        error : function(result) {
            console.log("未知错误！");
        }
    });
}
//辅助searchGoods()方法，dataTable
function goodsDataTable(data) {
    var goodsTable = $('#goods-table')
            .DataTable(
                    {
                        "destroy" : true,
                        "bAutoWidth" : false,
                        "aoColumnDefs" : [ {
                                                "bSearchable" : false,
                                                "aTargets" : [ 0]
                                            },
                                            {
                                                "bSortable" : false,
                                                "aTargets" : [  ]
                                            },
                                         ],
                        "order": [[ 5, "desc" ]],//默认第6列降序排列
                        data : data,
                        // 使用对象数组，一定要配置columns，告诉 DataTables 每列对应的属性
                        columns : [ {
                            "className": 'goods-barcode',
                            "data" : 'barcode'
                        }, {
                            "className": 'goods-name',
                            "data" : 'name'
                        }, {
                            "className": 'goods-price',
                            "data" : 'price'
                        }, {
                            data : 'id'
                        },{
                            data : 'script'
                        }, {
                            data : 'createTime'
                        }, ],                        
                        "language": {
                            "url": contextPath +"/resources/DataTables-1.10.13/i18n/Chinese.json"
                        },
                        "fnCreatedRow" : function(nRow, aData, iDataIndex) {    

                        },
                        "fnRowCallback" : function(nRow, aaData, iDisplayIndex,
                                iDisplayIndexFull) {
                        },
     });    
    //添加双击事件
    $('#goods-table tbody').off('dblclick.dt');//在进行事件绑定前先关闭先前绑定的事件
    $('#goods-table tbody').one('dblclick.dt', 'tr' , function (event) {
        var barcode = $(this).find(".goods-barcode").text();
        var name = $(this).find(".goods-name").text();
        var price = $(this).find(".goods-price").text();
        addSaleItem(barcode,name,price);
        $("#goodsModal").modal('hide');//关闭模态库    
    } );
}
//退货记录
function makeReject(){
	
	var amount = $("#rejectAmount").text()-0;
	var orderId = $("#search-order-rejectOrderNo").val();
	if(amount!=0){
		$.ajax({
			type:"post",
			url:contextPath + "/sro/add",
			dataType:"json",
			data:{
				"saleOrderNo":orderId,
				"SaleRejectOrder.total":amount
			},
			success:function(result){
				if(result.status){
					makeRejectItem(result.data);
				}else{
					console.log(result.status);
				}
			},
			error:function(result){
				console.log("未知错误！");
			}
		});
	}else{
		alert("出错了");
	};
}
//退货纤细记录
function makeRejectItem(data){
    var trs = $("#reject-item-table tbody tr");//所有行
    var len = trs.length-100;//获取表格中有值的长度
    var rejectReason = $("#resultOfReject").val();
    for(var i=0;i<len;i++){
    	var itemId = trs.eq(i).find("td").eq(0).text();
    	var rejectPrice = trs.eq(i).find("td").eq(2).text();
    	var subTotal = trs.eq(i).find("td").eq(3).text();
    	$.ajax({
    		type:"post",
    		url:contextPath + "/sroi/add",
    		dataType:"json",
    		data:{
    			"SaleRejectOrderItem.rejectNo":data[0].rejectNo,
    			"SaleRejectOrderItem.itemId":itemId,
    			"SaleRejectOrderItem.rejectPrice":rejectPrice,
    			"SaleRejectOrderItem.subTotal":subTotal,
    			"SaleRejectOrderItem.rejectReason":rejectReason
    		},
    		success:function(result){
    			alert("退货成功");
    		},
    		error:function(result){
    			console.log("未知错误");
    		}
    	});
    }
}
//销售下单
function makesale(){
    var total = $("#saleAmount").text()-0;
    var cashPay = $("#cashPay").val()-0;
    if (cashPay>=total) {
            $.ajax({
                type : "POST",
                url : contextPath + "/so/add",
                data : {
                    "saleOrder.total" : total
                },
                datatype : "json",
                success : function(result) {
                    if (result.status) {
                        makesaleitem(result.saleOrderNo);
                    } else {
                        alert(result.data);
                    }
                    
                },
                error : function(result) {
                    console.log("未知错误！");
                }
            });
    } else {
        alert("收款现金不能少于应付款！");
    }

}
//销售下单
function makesaleitem(saleOrderNo){
    var item="";
    var trs = $("#sale-item-table tbody tr");//所有行
    var len = trs.length-100;//获取表格中有值的长度
    for(var i = 0; i < len; i++){
        var itemId = trs.eq(i).find("td").eq(0).text();//商品编号
        var itemName = trs.eq(i).find("td").eq(1).text();//商品编号
        var salePrice = trs.eq(i).find("td").eq(3).text();//商品单价
        var quantity = trs.eq(i).find("td").eq(2).find("input").val()-0;//某个商品的购买数量
        var subTotal = trs.eq(i).find("td").eq(4).text()-0;//某个商品的购买小计

        item +='<tr>'+
                    '<td colspan="5" align="center" valign="bottom"><div align="left">['+itemId+']&nbsp;'+itemName+'</div></td>'+
                  '</tr>'+
                  '<tr>'+
                    '<td align="center" valign="bottom">'+salePrice+'</td>'+
                    '<td align="center" valign="bottom">'+quantity+'</td>'+
                    '<td align="center" valign="bottom">'+subTotal+'</td>'+
                  '</tr>';

            $.ajax({
                type : "POST",
                url : contextPath + "/soi/add",
                data : {
                    'saleOrderItem.saleOrderNo' : saleOrderNo,
                    'saleOrderItem.itemId' : itemId,
                    'saleOrderItem.salePrice' : salePrice,
                    'saleOrderItem.quantity' : quantity,
                    'saleOrderItem.subTotal' : subTotal,
                },
                datatype : "json",
                success : function(result) {
                    if (result.status) {
                    } else {
                        alert(result.data);
                    }
                    
                },
                error : function(result) {
                    console.log("未知错误！");
                }
            });
    }
    pay(saleOrderNo,item);//支付
}
//支付
function pay(saleOrderNo,item){
    var payType = $("#payType").val();
    var totalAmount = $("#totalAmount").val();
    var payTransactionNo =null;

    $.ajax({
        type : "POST",
        url : contextPath + "/pay/add",
        data : {
            'payment.saleOrderNo' : saleOrderNo,
            'payment.amount' : totalAmount,
            'payment.payType' : payType,
            'payment.payTransactionNo' : payTransactionNo,
        },
        datatype : "json",
        success : function(result) {
            if (result.status) {
                 alert(result.data);
                 $("#saleModal").modal('hide');//关闭模态库  
                 if ($( "#isPrint" ).is( ":checked" ) ) {//判断用户有没选择打印
                    printSale(saleOrderNo,result.paymentNo,item);//打印凭条
                 }
                 inintSale();//初始化页面
            } else {
                alert(result.data);
            }
            
        },
        error : function(result) {
            console.log("未知错误！");
        }
    });
}
//打印凭条
function printSale(soNo,paymentNo,item) {
    var shouldPaid=$("#totalAmount").val();
    var realdPaid=$("#cashPay").val();
    var change=$("#change").val();
    var time = new Date().toLocaleString( ) ;//当前时间
    var content = '<table width="200" border="0" align="center" cellpadding="0" cellspacing="0">'+
              '<tbody>'+
                  '<tr>'+
                    '<td valign="middle">'+
                        '<div align="center"><font style="font-size:18px;line-height: 25px;">35组服装POS公司</font> <br>消费结帐单<br></div>'+
                    '</td>'+
                  '</tr>'+
                  '<tr>'+
                    '<td width="200" valign="middle" bgcolor="#FFFFFF"><div align="left">交易流水号：'+paymentNo+'<br>消费单号：'+soNo+'</div></td>'+
                  '</tr>'+
                  '<tr>'+
                    '<td valign="middle" bgcolor="#FFFFFF"><div style="border-bottom:1px dashed #000;margin: 12px 0;"></div></td>'+
                  '</tr>'+
                  '<tr>'+
                    '<td valign="middle" bgcolor="#FFFFFF">'+
                        '<div align="left">'+
                            '<table width="100%" border="0" cellpadding="0" cellspacing="0">'+
                              '<tbody>'+
                                  '<tr>'+
                                    '<td><div align="center" style="font-size: 12">单价</div></td>'+
                                    '<td><div align="center" style="font-size: 12">数量</div></td>'+
                                    '<td><div align="center" style="font-size: 12">合计</div></td>'+
                                  '</tr>'+
                                  item+
                              '</tbody>'+
                          '</table>'+
                        '</div>'+
                    '</td>'+
                  '</tr>'+
                  '<tr>'+
                    '<td valign="middle" bgcolor="#FFFFFF"><div style="border-bottom:1px dashed #000;margin: 12px 0;"></div></td>'+
                  '</tr>'+
                  '<tr>'+
                    '<td valign="middle" bgcolor="#FFFFFF">'+
                        '<table width="100%" border="0" cellpadding="0" cellspacing="0">'+
                            '<tbody>'+
                                '<tr>'+
                                  '<td>'+
                                  '应付：'+shouldPaid+' 元<br>'+
                                  '现付：'+realdPaid+' 元  <br>'+
                                  '找零：'+change+' 元<br> '+    
                                  '操作员：cashier'+
                                  '</td>'+
                                '</tr>'+
                            '</tbody>'+
                        '</table>'+
                    '</td>'+
                  '</tr>'+
                  '<tr>'+
                    '<td valign="middle" bgcolor="#FFFFFF">时间：'+time+'</td>'+
                  '</tr>'+
                  '<tr>'+
                    '<td align="left" bgcolor="#FFFFFF">电话：02584407055<br>地址：华南农业大学</td>'+
                  '</tr>'+
                  '<tr>'+
                    '<td align="center" bgcolor="#FFFFFF"></td>'+
                  '</tr>'+
                  '<tr>'+
                    '<td align="center" bgcolor="#FFFFFF" height="50">*服装POS系统* 信管35组<br></td>'+
                  '</tr>'+
              '</tbody>'+
        '</table>';
        console.log(content)
    jQuery("#salePrint").print({
            //Use Global styles
            /*globalStyles : false,*/
            //Add link with attrbute media=print
            mediaPrint : false,
            //Custom stylesheet
            /*stylesheet : "http://fonts.googleapis.com/css?family=Inconsolata",*/
            //Print in a hidden iframe
            iframe : false,
            //Don't print this
            noPrintSelector : ".avoid-this",
            //Add this at top
            prepend : content,
            //Add this on bottom
            append : "<br/>Buh Bye!",
            deferred: $.Deferred().done(function() { })
        });
}