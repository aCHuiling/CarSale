<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateProffer.jsp' starting page</title>
    
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

  //验证名称
  function ckName(obj){
  var vl=obj.value;
  var content=document.getElementById("spName");
  if(vl==""){
  content.innerHTML="名称不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  
  //验证联系人
  function ckContact(obj){
  var vl=obj.value;
  var content=document.getElementById("spContact");
  if(vl==""){
  content.innerHTML="联系人不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  
  //验证联系电话
  function ckPhone(obj){
  var vl=obj.value;
  var content=document.getElementById("spPhone");
  if(vl==""){
  content.innerHTML="联系电话不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  
  //验证联系地址
  function ckAdress(obj){
  var vl=obj.value;
  var content=document.getElementById("spAdress");
  if(vl==""){
  content.innerHTML="联系地址不能为空！"
  exists=false;
  }else{
  exists=true;
  }
  }
  
  
  function ckAllForm(){
  var content2=document.getElementById("spName");
  var content3=document.getElementById("spContact");
  var content4=document.getElementById("spPhone");
  var content5=document.getElementById("spAdress");
  var fullname=$("input[name=fullname]").val();
  var contactperson=$("input[name=contactperson]").val();
  var phone=$("input[name=phone]").val();
  var adress=$("input[name=adress]").val();
  if(fullname==""){
  content2.innerHTML="名称不能为空！"
  return false;
  }
  if(contactperson==""){
  content3.innerHTML="联系人不能为空！"
  return false;
  }
  if(phone==""){
  content4.innerHTML="联系电话不能为空！"
  return false;
  }
  if(adress==""){
  content5.innerHTML="联系地址不能为空！"
  return false;
  }
  return exists;
  }
  
  </script>
  <style type="text/css">
  #spId,#spName,#spContact,#spPhone,#spAdress{
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
  .view2{
  color: #f5a76e;
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
    <span class="current">当前位置：<span class="manage">供货商信息管理</span>-><span class="view">修改供货商信息</span>-><span class="view2">修改供货商信息</span></span>
    <div class="main">
    <form action="proffer/UpdateProfferT" onsubmit="return ckAllForm()" class="form">
    <input type="hidden" name="profferid" value="${profferModel.profferid }">
    <table>
    <tr>
    <td>供货商号：</td><td style="width: 196px;background-color: #c3dde0;">${profferModel.profferid }</td>
    </tr>
    <tr>
    <td>名称：</td><td><input name="fullname" onblur="ckName(this)" value="${profferModel.fullname }"></td>
    <td><span id="spName"></span></td>
    </tr>
    <tr>
    <td>联系人：</td><td><input name="contactperson" onblur="ckContact(this)" value="${profferModel.contactperson }"></td>
    <td><span id="spContact"></span></td>
    </tr>
    <tr>
    <td>联系电话：</td><td><input name="phone" onblur="ckPhone(this)" value="${profferModel.phone }"></td>
    <td><span id="spPhone"></span></td>
    </tr>
    <tr>
    <td>联系地址：</td><td><input name="adress" onblur="ckAdress(this)" value="${profferModel.adress }"></td>
    <td><span id="spAdress"></span></td>
    </tr>
    <tr>
    <td>开户行：</td><td><input name="openingbank" value="${profferModel.openingbank }"></td>
    </tr>
    <tr>
    <td>银行帐号：</td><td><input name="accountid" value="${profferModel.accountid }"></td>
    </tr>
    <tr>
    <td>备注：</td><td><input name="others" value="${profferModel.others }"></td>
    </tr>
    </table>
    <input type="submit" value="提交" class="button">&nbsp;
    <input type="reset" value="重置" class="button">
    <input type="button" value="返回上一级" onclick="javascript:location.href='proffer/toUpdateProffer'">
    </form>
    </div>
  </body>
</html>
