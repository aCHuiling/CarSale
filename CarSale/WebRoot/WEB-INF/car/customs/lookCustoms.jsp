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
    
    <title>My JSP 'lookCustoms.jsp' starting page</title>
    
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
  <span class="current">当前位置：<span class="manage">客户信息管理</span>-><span class="view">查看客户信息</span></span>
  <div class="main">
  <form action="customs/toLookCustoms" method="post" class="form">
			客户姓名：<input type="text" name="custname"> 
			<input type="submit" value="查询" class="check">
		</form>
    <table class="hovertable">
    <tr>
    <th>职工编号</th>
    <th>客户姓名</th>
    <th>客户性别</th>
    <th>客户年龄</th>
    <th>联系电话</th>
    </tr>
    <c:forEach items="${custList }" var="cu">
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>${cu.customsid }</td>
    <td>${cu.custname }</td>
    <td>${cu.custsex }</td>
    <td>${cu.custage }</td>
    <td>${cu.custphone }</td>
    </tr>
    </c:forEach>
    </table>
  <jsp:include page="../Page.jsp"></jsp:include>
    </div>
  </body>
</html>
