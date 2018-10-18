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
    
    <title>My JSP 'roleFuncMapping.jsp' starting page</title>
    
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
    <jsp:include page="../manage/carMain.jsp"></jsp:include>
  </div>
    <div class="main">
    <form action="manage/UpdateRoleFunc" class="form">
    <input type="hidden" name="rowid" value="${id }">
    <span class="title">功能：</span><br>
    
    <%
    List<SysFunction> funList=(List<SysFunction>)request.getAttribute("funcs");
    List<RoleFunc> funRoleList=(List<RoleFunc>)request.getAttribute("userFuncList");
    for(int f=0;f<funList.size();f++){
    if(funList.get(f).getParentid()!=0){
    %>
    <span style="display:inline-block;" class="function">
    <%=funList.get(f).getFunctitle() %>:<input type="checkbox"
    <%
    for(int i=0;i<funRoleList.size();i++){
    RoleFunc roleFunc=funRoleList.get(i);
    if(roleFunc.getFuncid()==funList.get(f).getRowid()){
    funRoleList.remove(i--);//减少循环次数，当Functionid和Rowid相等时就移除
    //i--;
    %>
     checked="checked"
    <%}} %>
     name="function_ids" value="<%=funList.get(f).getRowid()%>">
    </span>
    <%}} %>
    <br>
    <input type="submit" value="修改" class="button">&nbsp;
    <input type="reset" value="重置" class="button">&nbsp;
    <input type="button" value="返回上一级" onclick="javascript:location.href='manage/RoleList'" class="button2">
    </form>
    </div>
  </body>
</html>
