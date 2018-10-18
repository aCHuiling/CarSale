<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'lookSale.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="res/css/main.css">
<script type="text/javascript" src="res/js/jquery-1.12.4.js"></script>
<script type="text/javascript">
/* var idTmr;
function  getExplorer() {
    var explorer = window.navigator.userAgent ;
    //ie 
    if (explorer.indexOf("MSIE") >= 0) {
        return 'ie';
    }
    //firefox 
    else if (explorer.indexOf("Firefox") >= 0) {
        return 'Firefox';
    }
    //Chrome
    else if(explorer.indexOf("Chrome") >= 0){
        return 'Chrome';
    }
    //Opera
    else if(explorer.indexOf("Opera") >= 0){
        return 'Opera';
    }
    //Safari
    else if(explorer.indexOf("Safari") >= 0){
        return 'Safari';
    }
}
function method1(tableid) {//整个表格拷贝到EXCEL中
    if(getExplorer()=='ie')
    {
        var curTbl = document.getElementById(tableid);
        var oXL = new ActiveXObject("Excel.Application");

        //创建AX对象excel 
        var oWB = oXL.Workbooks.Add();
        //获取workbook对象 
        var xlsheet = oWB.Worksheets(1);
        //激活当前sheet 
        var sel = document.body.createTextRange();
        sel.moveToElementText(curTbl);
        //把表格中的内容移到TextRange中 
        sel.select();
        //全选TextRange中内容 
        sel.execCommand("Copy");
        //复制TextRange中内容  
        xlsheet.Paste();
        //粘贴到活动的EXCEL中       
        oXL.Visible = true;
        //设置excel可见属性

        try {
            var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
        } catch (e) {
            print("Nested catch caught " + e);
        } finally {
            oWB.SaveAs(fname);

            oWB.Close(savechanges = false);
            //xls.visible = false;
            oXL.Quit();
            oXL = null;
            //结束excel进程，退出完成
            //window.setInterval("Cleanup();",1);
            idTmr = window.setInterval("Cleanup();", 1);

        }

    }
    else
    {
        tableToExcel('teamtable');
    }
}
function Cleanup() {
    window.clearInterval(idTmr);
    CollectGarbage();
}
var tableToExcel = (function() {
    var uri = 'data:application/vnd.ms-excel;base64,',
    template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
    base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
    format = function(s, c) {
        return s.replace(/{(\w+)}/g,
        function(m, p) { return c[p]; }) }
            return function(table, name) {
                if (!table.nodeType) table = document.getElementById(table)
                var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
                window.location.href = uri + base64(format(template, ctx))
              }
})(); */




//导出通用方法,在onlick事件中调用getImport(table名称)即可    
var idTmr;  
function getExplorer() {  
    var explorer = window.navigator.userAgent;  
    if (explorer.indexOf("MSIE") >= 0 || (explorer.indexOf("Windows NT 6.1;") >= 0 && explorer.indexOf("Trident/7.0;") >= 0)) {  
        return 'ie';   //ie    
    }  
    else if (explorer.indexOf("Firefox") >= 0) {  
        return 'Firefox';  //firefox    
    }  
    else if (explorer.indexOf("Chrome") >= 0) {  
        return 'Chrome'; //Chrome    
    }  
    else if (explorer.indexOf("Opera") >= 0) {  
        return 'Opera';  //Opera    
    }  
    else if (explorer.indexOf("Safari") >= 0) {  
        return 'Safari';   //Safari    
    }  
}  
  
//此方法为ie导出之后,可以保留table格式的方法  
function getIEsink(tableid) {  
    var curTbl = document.getElementById(tableid);  
    if (curTbl == null || curTbl == "") {  
        alert("没有数据");  
        return false;  
    }  
    var oXL;  
    try {  
        oXL = new ActiveXObject("Excel.Application"); //创建AX对象excel    
    } catch (e) {  
        alert("无法启动Excel!\n\n如果您确信您的电脑中已经安装了Excel，" + "那么请调整IE的安全级别。\n\n具体操作：\n\n" + "工具 → Internet选项 → 安全 → 自定义级别 → 对没有标记为安全的ActiveX进行初始化和脚本运行 → 启用");  
        return false;  
    }  
  
    var oWB = oXL.Workbooks.Add();  
    var oSheet = oWB.ActiveSheet;  
    var sel = document.body.createTextRange();  
    sel.moveToElementText(curTbl);  
    sel.select();  
    sel.execCommand("Copy");  
    oSheet.Paste();  
    oXL.Visible = true;  
}  
  
//此方法为ie导出之后,不保留table格式的方法  
function getIEnotsink(tableid) {  
    var curTbl = document.getElementById(tableid);  
    if (curTbl == null || curTbl == "") {  
        alert("没有数据");  
        return false;  
    }  
    var oXL;  
    try {  
        oXL = new ActiveXObject("Excel.Application"); //创建AX对象excel    
    } catch (e) {  
        alert("无法启动Excel!\n\n如果您确信您的电脑中已经安装了Excel，" + "那么请调整IE的安全级别。\n\n具体操作：\n\n" + "工具 → Internet选项 → 安全 → 自定义级别 → 对没有标记为安全的ActiveX进行初始化和脚本运行 → 启用");  
        return false;  
    }  
  
    var oWB = oXL.Workbooks.Add();  
    var oSheet = oWB.ActiveSheet;  
    var Lenr = curTbl.rows.length;  
    for (i = 0; i < Lenr; i++) {  
        var Lenc = curTbl.rows(i).cells.length;  
        for (j = 0; j < Lenc; j++) {  
            oSheet.Cells(i + 1, j + 1).value = curTbl.rows(i).cells(j).innerText;  
        }  
    }  
    oXL.Visible = true;  
}  
  
function getImport(tableid) {  
    if (getExplorer() == 'ie') {  
        getIEnotsink(tableid);  
    }  
    else {  
        tableToExcel(tableid);  
    }  
}  
  
function Cleanup() {  
    window.clearInterval(idTmr);  
    CollectGarbage();  
}  
var tableToExcel = (function () {  
    var uri = 'data:application/vnd.ms-excel;base64,',  
              template = '<html><head><meta charset="UTF-8"></head><body><table border="1">{table}</table></body></html>',  
            base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) },  
           format = function (s, c) {  
               return s.replace(/{(\w+)}/g,  
                    function (m, p) { return c[p]; })  
           }  
    return function (table, name) {  
        if (!table.nodeType) table = document.getElementById(table)  
        var ctx = { worksheet: name || 'Worksheet', table: table.innerHTML }  
        window.location.href = uri + base64(format(template, ctx))  
    }  
  
})()
</script> 
<style type="text/css">
.form{
width: 800px;
height: 30px;
margin-top: 5px;
}
.form input{
height: 25px;
font-size: 15px;
}
.current{
position: absolute;
top:95px;
left: 206px;
}
.view{
color: #f69147;
font-weight:bold;
}
.manage{
color: #f47920;
font-weight:bold;
}
#dateOrWho{
color: #2a5caa;
font-weight:bold;
font-size: 20px;
}
.format{
color: red;
}
.import{
height: 25px;
font-size: 15px;
margin-top: 10px;
}
</style>
  </head>
  
  <body>
    <div class="">
    <jsp:include page="../manage/carMain.jsp"></jsp:include>
  </div>
  <span class="current">当前位置：<span class="manage">销售信息管理</span>-><span class="view">查看销售信息</span></span>
  <div class="main">
  <c:if test="${userModel.ismanage==2 }">
    <form action="sale/SelectStatistics" method="post" class="form">
	日期：<input type="text" name="saledates">
	<input type="submit" value="按日期查询" class="check"><span>*输入日期格式为<span  class="format">2017</span>/<span  class="format">2017-01</span>/<span  class="format">2017-01-01</span></span>
	</form>
	<form action="sale/LookSale" method="post" class="form" onsubmit="return ckAllForm()">
	姓名：<input type="text" name="salename">
	<input type="submit" value="按销售人查询" class="check"><span>*请输入全名哦</span>
	</form>
	<span>${lead }</span><span id="dateOrWho">${dateOrWho }</span>--<span style="color: red">销售总额（万）：${saleCount }</span><br>
	<span>${lead }</span><span id="dateOrWho">${dateOrWho }</span>--<span style="color: red">盈利总额（万）：${profitCount }</span>
    <table class="hovertable" id="teamtable">
    <tr>
    <th>销售单号</th>
    <th>车辆编号</th>
    <th>车辆名称</th>
    <th>进货价（万）</th>
    <th>出售价（万）</th>
    <th>销售数量（辆）</th>
    <th>销售日期</th>
    <th>客户姓名</th>
    <th>客户性别</th>
    <th>销售人姓名</th>
    <th style="color: red">销售额（万）</th>
    <th style="color: red">盈利（万）</th>
    </tr>
    <c:forEach items="${saleStaList }" var="s">
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>${s.salebillid }</td>
    <td>${s.merch }</td>
    <td>${s.merchbill.fullname }</td>
    <td>${s.importbill.importprice }</td>
    <td>${s.merchbill.unitcost }</td>
    <td>${s.salenum }</td>
    <td><f:formatDate value="${s.saledate }" pattern="yyyy-MM-dd"/></td>
    <td>${s.customs.custname }</td>
    <td>${s.customs.custsex }</td>
    <td>${s.employee.name }</td>
    <td>${s.merchbill.unitcost*s.salenum }<input type="hidden" name="allCost" saleCost="${s.merchbill.unitcost*s.salenum }"></td>
    <td>${(s.merchbill.unitcost-s.importbill.importprice)*s.salenum }</td>
    </tr>
    </c:forEach>
    </table>
    <jsp:include page="../Page.jsp"></jsp:include>
    <br>
    <!-- <button onclick="javascript:method1('teamtable')">导出EXCEL</button> -->
    <button onclick="getImport('teamtable')" class="import">导出EXCEL</button>
    </c:if>
    <c:if test="${userModel.ismanage==3 }">
    <form action="sale/SelectStatistics" method="post" class="form">
	日期：<input type="text" name="saledates">
	<input type="submit" value="按日期查询" class="check"><span>*输入日期格式为<span  class="format">2017</span>/<span  class="format">2017-01</span>/<span  class="format">2017-01-01</span></span>
	</form>
	<span>${lead }</span><span id="dateOrWho">${dateOrWho }</span>--<span style="color: red">销售总额（万）：${saleCount }</span><br>
	<span>${lead }</span><span id="dateOrWho">${dateOrWho }</span>--<span style="color: red">盈利总额（万）：${profitCount }</span>
    <table class="hovertable" id="teamtable">
    <tr>
    <th>销售单号</th>
    <th>车辆编号</th>
    <th>车辆名称</th>
    <th>进货价（万）</th>
    <th>出售价（万）</th>
    <th>销售数量（辆）</th>
    <th>销售日期</th>
    <th>客户姓名</th>
    <th>客户性别</th>
    <th>销售人姓名</th>
    <th style="color: red">销售额（万）</th>
    <th style="color: red">盈利（万）</th>
    </tr>
    <c:forEach items="${salePeople }" var="s">
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>${s.salebillid }</td>
    <td>${s.merch }</td>
    <td>${s.merchbill.fullname }</td>
    <td>${s.importbill.importprice }</td>
    <td>${s.merchbill.unitcost }</td>
    <td>${s.salenum }</td>
    <td><f:formatDate value="${s.saledate }" pattern="yyyy-MM-dd"/></td>
    <td>${s.customs.custname }</td>
    <td>${s.customs.custsex }</td>
    <td>${s.employee.name }</td>
    <td>${s.merchbill.unitcost*s.salenum }<input type="hidden" name="allCost" saleCost="${s.merchbill.unitcost*s.salenum }"></td>
    <td>${(s.merchbill.unitcost-s.importbill.importprice)*s.salenum }</td>
    </tr>
    </c:forEach>
    </table>
    <jsp:include page="../Page.jsp"></jsp:include>
    <br>
    <!-- <button onclick="javascript:method1('teamtable')">导出EXCEL</button> -->
    <button onclick="getImport('teamtable')" class="import">导出EXCEL</button>
    </c:if>
    </div>
  </body>
</html>
