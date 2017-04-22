$(function() {
	setInterval("showTime()",1000);
	$('.selectCombo').comboSelect();

    modelCenter();//模态库居中
    inintSaleItemTable();//初始化销售明细表
    
});

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

//初始化明细表
function inintSaleItemTable(){
    $("#sale-item-table tbody").html("");
    for (var i = 0;i<100;i++){
        $("#sale-item-table tbody").append("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
    }
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
//结算按钮
function bill(){
    $("#totalAmount").val( $("#saleAmount").text() );
    $("#totalPrice").val( $("#originalAmount").text() );
    $("#totalDiscount").val( ($("#originalAmount").text() - $("#saleAmount").text()).toFixed(2) )  
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
