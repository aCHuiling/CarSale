<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatePerson.jsp' starting page</title>
    
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
  
  //验证用户名
  function ckUserName(obj){
  var vl=obj.value;
  var content=document.getElementById("spUser");
  var userName=$("input[name=username]").val();
  //content.innerHTML=vl;
  $.ajax({
  url:"manage/ajaxCkUser",
  type:"get",
  data:"userName="+vl,
  success:function(data){
  if(data=="true")
  if(userName!=${userbillModel.username }){
  {
  content.innerHTML="用户已经存在，请重新输入！"
  return false;
  }}else{
  if(vl==""){
  content.innerHTML="用户名不能为空！"
  return false;
  }
  else{
  content.innerHTML="该用户可以使用！"
  return true;
  }
  }
  }
  });
  }
  
  //验证密码
  function ckUserPwd(obj){
  var vl=obj.value;
  var content=document.getElementById("spPwd");
  if(vl==""){
  content.innerHTML="密码不能为空！"
  exists=false;
  }else{
  exists=true;
  }
  }
  
  
  function ckAllForm(){
  var content1=document.getElementById("spUser");
  var content2=document.getElementById("spPwd");
  var userName=$("input[name=username]").val();
  var pwd=$("input[name=password]").val();
  if(userName==""){
  content1.innerHTML="用户名不能为空！"
  return false;
  }
  if(pwd==""){
  content2.innerHTML="密码不能为空！"
  return false;
  }
  return exists;
  }
  </script>
  <style type="text/css">
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
  <span class="current">当前位置：<span class="manage">个人信息管理</span>-><span class="view">修改个人信息</span></span>
  <div class="main">
  <form action="manage/UpdatePerson" class="form">
  <input type="hidden" name="rowid" value=${userbillModel.rowid }>
    <table>
    <tr>
    <td>用户名：</td>
    <td><input name="username" value="${userbillModel.username }" onblur="ckUserName(this)"><span id="spUser"></span></td>
    </tr>
    <tr>
    <td>密码：</td>
    <td><input type="text" name="password" value="${userbillModel.password }" onblur="ckUserPwd(this)"><span id="spPwd"></span></td>
    </tr>
    </table> 
    <input type="submit" value="修改" class="button">&nbsp;
    <input type="reset" value="重置" class="button">
    </form>
    </div>
  </body>
</html>
