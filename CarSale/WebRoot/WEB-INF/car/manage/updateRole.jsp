<%@page import="com.zgc.model.RoleFunc"%>
<%@page import="com.zgc.model.SysFunction"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateRole.jsp' starting page</title>
    
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
  }
  input{
  height: 25px;
  font-size: 15px;
  margin-top: 10px;
  }
  .button{
  width: 50px;
  height: 25px;
  font-size: 15px;
  }
  .button2{
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
  <span class="current">当前位置：<span class="manage">角色管理</span>-><span class="view">修改角色</span></span>
    <div class="main">
    <form action="manage/UpdateRole" class="form">
    <input type="hidden" name="rowid" value="${roleModel.rowid }">
    角色名称：<input name="rolename" value="${roleModel.rolename }"><br>
    角色代码：<input name="rolecode" value="${roleModel.rolecode }"><br>
    功能名称：<input name="funcname" value="${roleModel.funcname }"><br>
    <input type="submit" value="修改" class="button">&nbsp;
    <input type="reset" value="重置" class="button">&nbsp;
    <input type="button" value="返回上一级" onclick="javascript:location.href='manage/RoleList'" class="button2">
    </form>
    </div>
  </body>
</html>
