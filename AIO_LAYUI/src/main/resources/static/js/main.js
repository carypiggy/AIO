/**
 * @autor syp
 * @content echarts 实例
 * @returns
 * @Time 2018-08-04
 */
layui.use(['element', 'layer', 'jquery'], function() {
	element = layui.element;
	$ = layui.$;
	layer = parent.layer === undefined ? layui.layer : top.layer;
	
	var myLineChart = echarts.init(document.getElementById('line'));
	var myPieChart = echarts.init(document.getElementById('pie'));
	initLineChart();
	initPieChart();
	
	//初试化饼状图
	function initPieChart(){
		$.ajax({
			url: "../static/json/piechartData.json",
			success: function(rs){
				// 指定图表的配置项和数据
				var option = {
			        title: {
			            text: '校友区域统计',
			            subtext: '纯属虚构',
			            x: 'center'
			        },
			        tooltip: {
			            trigger: 'item',
			            formatter: "{a} <br/>{b} : {c} ({d}%)"
			        },
			        legend: {
			            orient: 'vertical',
			            left: 'left',
			            data: rs.legendData
			        },
			        series: [{
			            name: '地区校友数量',
			            type: 'pie',
			            radius: '55%',
			            center: ['50%', '60%'],
			            data: rs.seriesData,
			            itemStyle: {
			                emphasis: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }]
			    };
				// 使用刚指定的配置项和数据显示图表。
				myPieChart.setOption(option);
			}
		});			
	}
	
	//初试化折线图
	function initLineChart(){
		$.ajax({
			url: "../static/json/linechartData.json",
			success: function(data){
				linechartData = data;
				// 指定图表的配置项和数据
				var option = {
					tooltip : {
						trigger : 'axis'
					},
					legend : {
						data : data.legendData
					},
					grid : {
						left : '3%',
						right : '4%',
						bottom : '3%',
						containLabel : true
					},
					toolbox : {
						feature : {
							saveAsImage : {}
						}
					},
					xAxis : {
						type : 'category',
						boundaryGap : false,
						data : data.xAxisData
					},
					yAxis : {
						type : 'value'
					},
					series : data.seriesData
				};
				// 使用刚指定的配置项和数据显示图表。
				myLineChart.setOption(option);
			}
		});		
	}
	
	


});