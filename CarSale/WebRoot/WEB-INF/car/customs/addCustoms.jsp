<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addCustoms.jsp' starting page</title>
    
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
  function ckName(obj){
  var vl=obj.value;
  var content=document.getElementById("spName");
  if(vl==""){
  content.innerHTML="姓名不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  
  //验证性别
  function ckSex(obj){
  var vl=obj.value;
  var content=document.getElementById("spSex");
  if(vl==""){
  content.innerHTML="性别不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  
  //验证年龄
  function ckAge(obj){
  var vl=obj.value;
  var content=document.getElementById("spAge");
  if(vl==""){
  content.innerHTML="年龄不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  
  //验证联系电话
  function ckPhone(obj){
  var vl=obj.value;
  var content=document.getElementById("spPhone");
  if(vl=="")  
  {  
  content.innerHTML="联系电话不能为空";  
  exists=false;
  }else{
  exists=true;
  }
  }
  
  
  function ckAllForm(){
  var content1=document.getElementById("spName");
  var content2=document.getElementById("spSex");
  var content3=document.getElementById("spAge");
  var content4=document.getElementById("spPhone");
  var name=$("input[name=custname]").val();
  var sex=$("input[name=custsex]").val();
  var age=$("input[name=custage]").val();
  var phone=$("input[name=phone]").val();
  if(name==""){
  content1.innerHTML="姓名不能为空！"
  return false;
  }
  if(sex==""){
  content2.innerHTML="性别不能为空！"
  return false;
  }
  if(age==""){
  content3.innerHTML="年龄不能为空！"
  return false;
  }
  if(age<=0||age>120){
  content3.innerHTML="年龄不合法！"
  return false;
  }
  if(phone==""){
  content4.innerHTML="联系电话不能为空！"
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
.sex{
width: 196px;
height: 25px;
font-size: 15px;
}
#spName,#spAge,#spPhone{
color: red;
}
  </style>
  </head>
  
  <body>
    <div class="">
    <jsp:include page="../manage/carMain.jsp"></jsp:include>
  </div>
  <span class="current">当前位置：<span class="manage">客户信息管理</span>-><span class="view">添加客户信息</span></span>
  <div class="main">
  <form action="customs/AddCustoms" onsubmit="return ckAllForm()" class="form">
    <table>
     <tr>
    <td>客户姓名：</td>
    <td><input name="custname" onblur="ckName(this)"><span id="spName"></span></td>
    </tr>
     <tr>
    <td>客户性别：</td>
    <td>
    <select name="custsex" class="sex">
    <option value="男">男</option>
    <option value="女">女</option>
    </select>
    </td>
    </tr>
     <tr>
    <td>客户年龄：</td>
    <td><input name="custage" onblur="ckAge(this)"><span id="spAge"></span></td>
    </tr>
    <tr>
    <td>联系电话：</td>
    <td><input name="custphone" onblur="ckPhone(this)"><span id="spPhone"></span></td>
    </tr>
    </table>
    <input type="submit" value="提交" class="button">&nbsp;
    <input type="reset" value="重置" class="button">
    </form>
    </div>
  </body>
</html>
