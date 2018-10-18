<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateUser.jsp' starting page</title>
    
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
  $.ajax({
  url:"manage/ajaxCkUser",
  type:"get",
  data:"userName="+vl,
  success:function(data){
  if(data=="true")
  {
  if(userName!=${userbill.username }){
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
  }
  .input{
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
  <span class="current">当前位置：<span class="manage">用户管理</span>-><span class="view">修改用户</span></span>
  <div class="main">
  <form action="manage/UpdateUser" onsubmit="return ckAllForm()" class="form">
  <input type="hidden" name="rowid" value=${userbill.rowid }>
    <table>
    <tr>
    <td>用户名：</td>
    <td><input class="input" name="username" value="${userbill.username }" onblur="ckUserName(this)"><span id="spUser"></span></td>
    </tr>
    <tr>
    <td>密码：</td>
    <td><input class="input" type="text" name="password" value="${userbill.password }" onblur="ckUserPwd(this)"><span id="spPwd"></span></td>
    </tr>
    <tr>
    <td>是否管理员：</td>
    <td><input type="radio" name="ismanage" value="1">管理员
    <input type="radio" name="ismanage" value="2" checked="checked">普通用户</td>
    </tr>
    </table> 
    <input type="submit" value="修改" class="button">&nbsp;
    <input type="reset" value="重置" class="button">&nbsp;
    <input type="button" value="返回上一级" onclick="javascript:location.href='manage/toUserManage'" class="button2">
    </form>
    </div>
  </body>
</html>
