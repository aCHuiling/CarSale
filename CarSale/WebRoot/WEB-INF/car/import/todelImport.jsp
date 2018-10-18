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
    
    <title>My JSP 'delImport.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="res/css/main.css">
<style type="text/css">
.form{
width: 800px;
height: 40px;
margin-top: 5px;
}
.form input{
height: 25px;
font-size: 15px;
}
.check{
width: 50px;
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
</style>
  </head>
  
  <body>
     <div class="">
    <jsp:include page="../manage/carMain.jsp"></jsp:include>
  </div>
  <span class="current">当前位置：<span class="manage">进货信息管理</span>-><span class="view">删除进货信息</span></span>
    <div class="main">
    <form action="import/toDelImport" method="post" class="form">
			进货单号：<input type="text" name="importbillid"> 
			<input type="submit" value="查询" class="check">
		</form>
    <table class="hovertable">
    <tr>
    <th>进货单号</th>
    <th>车辆编号</th>
    <th>车辆名称</th>
    <th>进货价（万）</th>
    <th>数量</th>
    <th>金额（万）</th>
    <th>进货日期</th>
    <th>备注</th>
    <th>操作</th>
    </tr>
    <c:forEach items="${importList }" var="i" >
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>${i.importbillid }</td>
    <td>${i.merchbillid }</td>
    <td>${i.merchbill.fullname }</td>
    <td>${i.importprice }</td>
    <td>${i.quantity }</td>
    <td>${i.totalmoney }</td>
    <td><f:formatDate value="${i.importdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    <td>${i.impothers }</td>
    <td><a href="import/DelImport?importbillid=${i.importbillid }"><img src="res/img/bg_button_del.gif"></a></td>
    </tr>
    </c:forEach>
    </table>
  <jsp:include page="../Page.jsp"></jsp:include>
    </div>
  </body>
</html>
