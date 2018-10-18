<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addUser.jsp' starting page</title>
    
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
  
  //验证姓名
  function ckEmpName(obj){
  var vl=obj.value;
  var content=document.getElementById("spEmp");
  //content.innerHTML=vl;
  $.ajax({
  url:"manage/ajaxCkEmp",
  type:"get",
  data:"EmpName="+vl,
  dataType:"json",
  success:function(data){
  if(data.empModel=="true"){
  content.innerHTML="该职工存在！"
  //给form表单的id赋值
  document.getElementById("id").value=data.id;
  return true;
  }else{
  content.innerHTML="该职工不存在，请重新确认！"
  return false;
  }
  }
  });
  }
  
  
  //验证用户名
  function ckUserName(obj){
  var vl=obj.value;
  var content=document.getElementById("spUser");
  //content.innerHTML=vl;
  $.ajax({
  url:"manage/ajaxCkUser",
  type:"get",
  data:"userName="+vl,
  success:function(data){
  if(data=="true")
  {
  content.innerHTML="用户已经存在，请重新输入！"
  return false;
  }else{
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
  var content3=document.getElementById("spEmp");
  var content1=document.getElementById("spUser");
  var content2=document.getElementById("spPwd");
  var userName=$("input[name=username]").val();
  var pwd=$("input[name=password]").val();
  var empName=$("input[name=employeeName]").val();
  if(empName==""){
  content3.innerHTML="姓名不能为空！"
  return false;
  }
  if(userName==""){
  content1.innerHTML="用户名不能为空！"
  return false;
  }
  if(pwd==""){
  content2.innerHTML="密码不能为空！"
  return false;
  }
  
  //判断职工是否已经有用户
  $.ajax({
  url:"manage/ajaxCkisUser",
  type:"get",
  data:"empName="+empName,
  success:function(data){
  if(data=="true")
  {
  alert("该职工已经有用户名，请重新确认！");
  location.href="manage/toAddUser";
  }
  }
  });
  return exists;
  }
  </script>
    <style type="text/css">
  #spEmp,#spUser,#spPwd{
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
  .input{
  height: 25px;
  font-size: 15px;
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
  <span class="current">当前位置：<span class="manage">用户管理</span>-><span class="view">添加用户</span></span>
    <div class="main">
    <form action="manage/AddUser" onsubmit="return ckAllForm()" class="form">
    <input type="hidden" name="rowid" id="id">
    <table class="hovertable">
    <tr>
    <td>姓名：</td>
    <td><input class="input" name="employeeName" onblur="ckEmpName(this)"><span id="spEmp"></span></td>
    </tr>
    <tr>
    <td>用户名：</td>
    <td><input class="input" name="username" onblur="ckUserName(this)"><span id="spUser"></span></td>
    </tr>
    <tr>
    <td>密码：</td>
    <td><input class="input" type="password" name="password" onblur="ckUserPwd(this)"><span id="spPwd"></span></td>
    </tr>
    <tr>
    <td>是否管理员：</td>
    <td><input type="radio" name="ismanage" value="1">管理员
    <input type="radio" name="ismanage" value="2" checked="checked">普通用户</td>
    </tr>
    <tr>
    <td colspan="2"><input type="submit" value="提交" class="button">
    <input type="reset" value="重置" class="button">
    <input type="button" value="返回上一级" onclick="javascript:location.href='manage/toUserManage'" class="button2">
    </td>
    </tr>
    </table>
    </form>
    </div>
  </body>
</html>
