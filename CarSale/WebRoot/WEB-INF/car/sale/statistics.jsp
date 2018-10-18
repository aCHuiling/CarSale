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
    
    <title>My JSP 'statistics.jsp' starting page</title>
    
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
    <span class="current">当前位置：<span class="manage">销售信息管理</span>-><span class="view">销售信息盘点</span></span>
    <div class="main" style="text-align:center;position: absolute;left: 204px">  
                   统计图查看 <br><br>  
        <a href="getColumnChart.year"><input type="button" value="按年统计图"></a>
        <a href="getColumnChart.month"><input type="button" value="按当年月份统计图"></a>
        <a href="getColumnChart.name"><input type="button" value="按销售人/年统计图"></a> 
        <a href="getColumnChart.kind"><input type="button" value="按车辆类别统计图"></a> 
        <a href="getPieChart.do"><input type="button" value="男女购买车辆比列图"></a> 
     <br><br>  
     <img src="${chartColumnURL}" >
     <img src="${chartPieURL}" >  
  </div>
  </body>
</html>
