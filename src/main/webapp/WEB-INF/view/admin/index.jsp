<%-- User: fengymi--%>
<%-- Date: 16-11-3--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->


    <title>主页</title>

    <%@include file="../layout/style.jsp"%>


</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title" style="border-bottom:none;background:#fff;">
                    <h5>服务器状态&nbsp;<span id="num"></span></h5>
                </div>
                <div class="ibox-content" style="border-top:none;">
                    <div id="now" style="height:400px;"></div><br />

                    <div id="history" style="height:400px;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 全局js -->
<%@include file="../layout/main_js.jsp"%>
<script src="static/js/plugin/echarts.js"></script>
<script src="static/js/design/design.js"></script>
<!--flotdemo-->
<script type="text/javascript">
    var option;
    $(function() {
        $.ajax({
            url: "<%=basePath%>index/get_user_num",
            success: function (data) {
                var con = "在线浏览人数:" + data.visitorNum + ";在线用户:" + data.userNum + ";连接数:" + data.connectionNum;
                $("#num").text(con);
            }
        });


        var history = echarts.init(document.getElementById('history'));

        option = {
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['游客数','在线用户数','连接数']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            yAxis : [
                {
                    type : 'value'
                }
            ],
            xAxis:[{
                type : 'category',
                boundaryGap : false
            }],
            series:[
                {
                    name:'游客数',
                    type:'line',
                    smooth:true,
                    itemStyle: {normal: {areaStyle: {type: 'default'}}}
                },
                {
                    name:'在线用户数',
                    type:'line',
                    smooth:true,
                    itemStyle: {normal: {areaStyle: {type: 'default'}}}
                },
                {
                    name:'连接数',
                    type:'line',
                    smooth:true,
                    itemStyle: {normal: {areaStyle: {type: 'default'}}}
                }
            ]
        };

        var history_xAxis_data = ['周一','周二','周三','周四','周五','周六','周日'];
        var history_series_data = [
            {data:[120, 132, 101, 134, 90, 230, 210]},
            {data:[220, 182, 191, 234, 290, 330, 310]},
            {data:[150, 232, 201, 154, 190, 330, 410]}
        ];

//        option.title = {
//            text: '用户连接情况',
//            subtext: '历史记录'
//        };
        history.setOption(updateOptions(history_xAxis_data,history_series_data));

        history.setOption({
            title : {
                text: '某楼盘销售情况',
                subtext: '纯属虚构'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['意向','预购','成交']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : ['周一','周二','周三','周四','周五','周六','周日']
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'成交',
                    type:'line',
                    smooth:true,
                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
                    data:[10, 12, 21, 54, 260, 830, 710]
                },
                {
                    name:'预购',
                    type:'line',
                    smooth:true,
                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
                    data:[30, 182, 434, 791, 390, 30, 10]
                },
                {
                    name:'意向',
                    type:'line',
                    smooth:true,
                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
                    data:[1320, 1132, 601, 234, 120, 90, 20]
                }
            ]
        });

        setInterval(function () {
            getNowCount();
        },1000);


    });

    var now = echarts.init(document.getElementById('now'));
    var xAxis = [];
    var series = [{data:[]},{data:[]},{data:[]}];
    var now_index;
    var dateTime = new Date().getTime();
    for(now_index=0;xAxis.length<60;now_index++){
        xAxis.push(getDate(now_index));
    }

    function addOne() {
        var isFull;
        if(series[0].data.length>=xAxis.length){
            isFull = true;
            xAxis.shift();
            xAxis.push(getDate(now_index));
        }

        for (var i=0;i<3;i++){
            series[i].data.push(Math.floor(Math.random()*100));
            if(isFull){
                series[i].data.shift();
            }
        }
        now.setOption(updateOptions(xAxis,series));
    }

    function getNowCount() {
        $.ajax({
            url:"index/get_user_num",
            success:function (data) {
                addOne();
            }
        });
    }

    function getDate(index) {
        index = index || 0;
        var nowTime = new Date(dateTime+index*10*60000);
        console.log(nowTime);
        var hours = nowTime.getHours();
        var minutes = nowTime.getMinutes();
        return (hours<10?"0"+hours:hours)+":"+(minutes<10?"0"+minutes:minutes)+":00";
    }

    function updateOptions(xAxis_data,series_data) {
        option.xAxis[0].data = xAxis_data;
        for(var i=0;i<series_data.length;i++){
            option.series[i].data = series_data[i].data;
        }
        return option;
    }

</script>
</body>

</html>