$(function(){
	//默认显示当前年份的月销售额柱状图报表
	monthlySales(new Date().getFullYear());
	categorySales();
})
//月销售额柱状图报表
function monthlySales(year){
	$.ajax({
		type : "POST", // 提交方式
		url : contextPath + '/sale/getMonthlySales',// 路径
		data : {
			'year': year
		},// 数据，这里使用的是Json格式进行传输
		success : function(data) {// 返回数据根据结果进行相应的处理
			console.log(year)
			$('#monthly-sales-container').highcharts({
				chart: {
					type: 'column'
				},
				title: {
					text: year==""?2017:year+'年的月销售额'
				},
				subtitle: {
					text: '数据来源: MIS 35组服装POS系统'
				},
				xAxis: {
					categories: [
					             '一月',
					             '二月',
					             '三月',
					             '四月',
					             '五月',
					             '六月',
					             '七月',
					             '八月',
					             '九月',
					             '十月',
					             '十一月',
					             '十二月'
					             ],
					             crosshair: true
				},
				yAxis: {
					min: 0,
					title: {
						text: '月销售额 (元)'
					}
				},
				tooltip: {
					headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
					pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
					'<td style="padding:0"><b>{point.y:.1f} 元</b></td></tr>',
					footerFormat: '</table>',
					shared: true,
					useHTML: true
				},
				plotOptions: {
					column: {
						pointPadding: 0.2,
						borderWidth: 0
					}
				},
				series: [{
					name: '月销售额',
					data: data
				}]
			});
		}
	});
}

//产品分类销售汇总报表。（选择起止时间，按产品类别进行分类统计销售额）
function categorySales(){
	var start = $("#category-sales-start").val();
	var end = $("#category-sales-end").val();
	$.ajax({
		type : "POST", // 提交方式
		url : contextPath + '/sale/getCategorySales',// 路径
		data : {
			'start': start,
			'end' : end
		},// 数据，这里使用的是Json格式进行传输
		success : function(data) {// 返回数据根据结果进行相应的处理
			$('#category-sales-container').highcharts({
				chart: {
					type: 'column'
				},
				title: {
					text: '产品分类销售汇总报表'
				},
				subtitle: {
					text: '数据来源: MIS 35组服装POS系统'
				},
				xAxis: {
					categories: data.categories,
					             crosshair: true
				},
				yAxis: {
					min: 0,
					title: {
						text: '销售额 (元)'
					}
				},
				tooltip: {
					headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
					pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
					'<td style="padding:0"><b>{point.y:.1f} 元</b></td></tr>',
					footerFormat: '</table>',
					shared: true,
					useHTML: true
				},
				plotOptions: {
					column: {
						pointPadding: 0.2,
						borderWidth: 0
					}
				},
				series: [{
					name: '销售额',
					data: data.data
				}]
			});
		}
	});
}