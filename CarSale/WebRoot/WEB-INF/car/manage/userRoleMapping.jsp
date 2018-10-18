<%@page import="com.zgc.model.UserRole"%>
<%@page import="com.zgc.model.SysRole"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userRoleMapping.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
  .button{
  width: 50px;
  height: 25px;
  font-size: 15px;
  margin-top: 10px;
  }
  .button2{
  height: 25px;
  font-size: 15px;
  }
  .title{
  font-size: 20px;
  font-weight: bold;
  }
  .function{
  width: 150px;
  height: 40px;
  border: 1px solid black;
  text-align: center;
  }
	</style>
  </head>
  
  <body>
    <div class="">
    <jsp:include page="carMain.jsp"></jsp:include>
  </div>
    <div class="main">
    <form action="manage/updateUserRole">
    <input type="hidden" name="rowid" value="${id }">
    <span class="title">角色：</span><br>
    
    <% 
    List<SysRole> roleList=(List<SysRole>)request.getAttribute("roles");
    List<UserRole> userRoleList=(List<UserRole>)request.getAttribute("userRoleList");
    for(int i=0;i<roleList.size();i++){
    SysRole role=roleList.get(i);
    %>
    <span style="display:inline-block;" class="function">
    <%=role.getRolename() %>:
    <input type="checkbox" name="userRoleIds" 
    <%
    for(int u=0;u<userRoleList.size();u++){
    if(userRoleList.get(u).getRoleid()==role.getRowid()){
    userRoleList.remove(u--);
     %>
     checked="checked"
    <%}}%>
    value="<%=role.getRowid()%>">
    </span>
    <%} %><br>
    <input type="submit" value="提交" class="button">&nbsp;
    <input type="reset" value="重置" class="button">&nbsp;
    <input type="button" value="返回上一级" onclick="location.href='manage/toUserManage';" class="button2">
    </form>
    </div>
  </body>
</html>
