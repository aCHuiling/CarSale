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
    
    <title>My JSP 'updateMerch.jsp' starting page</title>
    
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
  
  //验证供货商号
  function ckId(obj){
  var vl=obj.value;
  var content=document.getElementById("spId");
  $.ajax({
  url:"manage/ajaxCkId",
  type:"get",
  data:"profferId="+vl,
  success:function(data){
  if(data=="true"){
  content.innerHTML="供货商号存在，可以使用！"
  return true;
  }
  else{
  content.innerHTML="供货商号不存在，请重新输入！"
  return false;
  }
  }
  });
  }
  
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
  
  
  //验证发动机号
  function ckEnginenumber(obj){
  var vl=obj.value;
  var content=document.getElementById("spEnginenumber");
  if(vl==""){
  content.innerHTML="发动机号不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  function ckVin(obj){
  var vl=obj.value;
  var content=document.getElementById("spVin");
  if(vl==""){
  content.innerHTML="车架号不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  
  function ckColor(obj){
  var vl=obj.value;
  var content=document.getElementById("spColor");
  if(vl==""){
  content.innerHTML="颜色不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  
  //验证计量单位
  function ckMetricunit(obj){
  var vl=obj.value;
  var content=document.getElementById("spMetricunit");
  if(vl==""){
  content.innerHTML="计量单位不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  
  //验证单价（万）
  function ckUnitcost(obj){
  var vl=obj.value;
  var content=document.getElementById("spUnitcost");
  if(vl==""){
  content.innerHTML="单价（万）不能为空！"
  exists=false;
  }else{
  exists=true;
  }
  }
  
  
  function ckAllForm(){
  var content1=document.getElementById("spName");
  var content2=document.getElementById("spEnginenumber");
  var content3=document.getElementById("spMetricunit");
  var content4=document.getElementById("spUnitcost");
  var content5=document.getElementById("spId");
  var content6=document.getElementById("spVin");
  var content7=document.getElementById("spColor");
  var profferid=$("input[name=profferid]").val();
  var fullname=$("input[name=fullname]").val();
  var enginenumber=$("input[name=enginenumber]").val();
  var metricunit=$("input[name=metricunit]").val();
  var unitcost=$("input[name=unitcost]").val();
  var vin=$("input[name=vin]").val();
  var color=$("input[name=color]").val();
  if(profferid==""){
  content5.innerHTML="供货商id不能为空！"
  return false;
  }
  if(fullname==""){
  content1.innerHTML="名称不能为空！"
  return false;
  }
  if(enginenumber==""){
  content2.innerHTML="发动机号不能为空！"
  return false;
  }
  if(vin==""){
  content6.innerHTML="车架号不能为空！"
  return false;
  }
  if(color==""){
  content7.innerHTML="颜色不能为空！"
  return false;
  }
  if(metricunit==""){
  content3.innerHTML="计量单位不能为空！"
  return false;
  }
  if(unitcost==""){
  content4.innerHTML="单价（万）不能为空！"
  return false;
  }
  return exists;
  }
  </script>
  <style type="text/css">
  #spName,#spId,#spMetricunit,#spUnitcost,#spColor{
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
  <span class="current">当前位置：<span class="manage">销售信息管理</span>-><span class="view">修改车辆信息</span>-><span class="view2">修改车辆信息</span></span>
  <div class="main">
  <form action="merch/UpdateMerchT" onsubmit="return ckAllForm()" class="form">
  <input type="hidden" name="enginenumber" value="${merchModel.enginenumber }">
  <input type="hidden" name="vin" value="${merchModel.vin }">
  <input type="hidden" name="color" value="${merchModel.color }">
    <table>
    <tr>
    <td>供货商号：</td>
    <td><input name="profferid" onblur="ckId(this)" value="${merchModel.profferid }"></td>
    <td><span id="spId"></span></td>
    </tr>
    <tr>
    <td>名称：</td>
    <td><input name="fullname" onblur="ckName(this)" value="${merchModel.fullname }"></td>
    <td><span id="spName"></span></td>
    </tr>
    <tr>
    <td>发动机号：</td>
    <td style="width: 196px;background-color: #c3dde0;">${merchModel.enginenumber }</td>
    </tr>
    <tr>
    <td>车架号：</td>
    <td style="width: 196px;background-color: #c3dde0;">${merchModel.vin }</td>
    </tr>
    <tr>
    <tr>
    <td>颜色：</td>
    <td><input name="color" onblur="ckColor(this)" value="${merchModel.color }"></td>
    <td><span id="spColor"></span></td>
    </tr>
    <tr>
    <td>计量单位：</td>
    <td><input name="metricunit" onblur="ckMetricunit(this)" value="${merchModel.metricunit }"></td>
    <td><span id="spMetricunit"></span></td>
    </tr>
    <tr>
    <td>单价（万）：</td>
    <td><input name="unitcost" onblur="ckUnitcost(this)" value="${merchModel.unitcost }"></td>
    <td><span id="spUnitcost"></span></td>
    </tr>
    <tr>
    <td>类别：</td>
    <td><input name="kind" value="${merchModel.kind }"></td>
    </tr>
    <tr>
    <td>产地：</td>
    <td><input name="birthplace" value="${merchModel.birthplace }"></td>
    </tr>
    <tr>
    <td>备注：</td>
    <td><input name="others" value="${merchModel.others }"></td>
    </tr>
    </table>
    <input type="submit" value="提交" class="button">&nbsp;
    <input type="reset" value="重置" class="button">&nbsp;
    <input type="button" value="返回上一级" onclick="javacript:location.href='merch/toUpdateMerch'">
    </form>
    </div>
  </body>
</html>
