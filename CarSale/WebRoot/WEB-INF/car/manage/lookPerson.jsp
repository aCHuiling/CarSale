<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'lookPerson.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.form{
width: 600px;
height: 300px;
margin: 100px auto;
background-color: #E3E3E3;
  padding-left: 60px;
  padding-top: 50px;
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
</style>
  </head>
  
  <body>
  <div class="">
    <jsp:include page="carMain.jsp"></jsp:include>
  </div>
  <span class="current">当前位置：<span class="manage">个人信息管理</span>-><span class="view">查看个人信息</span></span>
  <div class="main">
  <div class="form">
    <table>
    <tr>
    <td>姓名：</td>
    <td><input name="name" value="${userbillModel.employee.name }"></td>
    </tr>
    <tr>
    <td>用户名：</td>
    <td><input name="username" value="${userbillModel.username }"></td>
    </tr>
    <tr>
    <td>性别：</td>
    <td><input name="sex" value="${userbillModel.employee.sex }"></td>
    </tr>
    </table>
    <input class="check" type="button" value="修改信息请点击" onclick="javascript:location.href='manage/toUpdatePerson'">
    </div>
    </div>
    
  </body>
</html>
