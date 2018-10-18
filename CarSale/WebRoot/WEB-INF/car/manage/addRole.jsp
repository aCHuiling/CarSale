<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addRole.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="res/js/jquery-1.12.4.js"></script>
  <script type="text/javascript">
  var exists=false;
  
  //验证角色名称
  function ckRoleName(obj){
  var vl=obj.value;
  var content=document.getElementById("spRole");
  //content.innerHTML=vl;
  $.ajax({
  url:"manage/ajaxCkRole",
  type:"get",
  data:"roleName="+vl,
  success:function(data){
  if(data=="true"){
  content.innerHTML="该角色名称已经存在，请重新输入！"
  return false;
  }else{
  if(vl==""){
  content.innerHTML="角色名称不能为空！"
  return false;
  }
  else{
  content.innerHTML="该角色名称可以使用！"
  return true;
  }
  }
  }
  });
  }
  
  
  //验证角色代码
  function ckRoleCode(obj){
  var vl=obj.value;
  var content=document.getElementById("spCode");
  $.ajax({
  url:"manage/ajaxCkCode",
  type:"get",
  data:"roleCode="+vl,
  success:function(data){
  if(data=="true")
  {
  content.innerHTML="该角色代码已经存在，请重新输入！"
  return false;
  }else{
  if(vl==""){
  content.innerHTML="角色代码不能为空！"
  return false;
  }
  else{
  content.innerHTML="该角色代码可以使用！"
  return true;
  }
  }
  }
  });
  }
  
  //验证功能名称
  function ckFuncName(obj){
  var vl=obj.value;
  var content=document.getElementById("spFunc");
  if(vl==""){
  content.innerHTML="功能名称不能为空！"
  exists=false;
  }else{
  exists=true;
  }
  }
  
  
  function ckAllForm(){
  var content1=document.getElementById("spRole");
  var content2=document.getElementById("spCode");
  var content3=document.getElementById("spFunc");
  var rolename=$("input[name=rolename]").val();
  var rolecode=$("input[name=rolecode]").val();
  var funcname=$("input[name=funcname]").val();
  if(rolename==""){
  content1.innerHTML="角色名称不能为空！"
  return false;
  }
  if(rolecode==""){
  content2.innerHTML="功能代码不能为空！"
  return false;
  }
  if(funcname==""){
  content3.innerHTML="功能名称不能为空！"
  return false;
  }
  return exists;
  }
  </script>
  <style type="text/css">
  #spRole,#spCode,#spFunc{
  color: red;
  }
  .form{
  width: 600px;
  height: 300px;
  margin: 100px auto;
  background-color: #E3E3E3;
  padding-left: 60px;
  padding-top: 50px;
  }
  input{
  height: 25px;
  font-size: 15px;
  }
  .button{
  width: 50px;
  height: 25px;
  font-size: 15px;
  }
  .date{
  width: 196px;
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
  <span class="current">当前位置：<span class="manage">角色管理</span>-><span class="view">添加角色</span></span>
    <div class="main">
  <form action="manage/AddRole" onsubmit="return ckAllForm()" class="form">
    <table>
    <tr>
    <td>角色名称：<input name="rolename" onblur="ckRoleName(this)"><span id="spRole"></span></td>
    </tr>
    <tr>
    <td>角色代码：<input name="rolecode" onblur="ckRoleCode(this)"><span id="spCode"></span></td>
    </tr>
    <tr>
    <td>功能名称：<input name="funcname" onblur="ckFuncName(this)"><span id="spFunc"></span></td>
    </tr>
    </table>
    <input type="submit" value="提交" class="button">
    <input type="reset" value="重置" class="button">
    <input type="button" value="返回上一级" onclick="javascript:location.href='manage/RoleList'">
  </form>
  </div>
  </body>
</html>
