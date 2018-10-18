<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateSale.jsp' starting page</title>
    
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
  
  //验证销售编号
  function ckId(obj){
  var vl=obj.value;
  var content=document.getElementById("spId");
   $.ajax({
  url:"sale/ajaxId",
  type:"get",
  data:"saleBillId="+vl,
  success:function(data){
  if(data=="true")
  {
  content.innerHTML="该销售编号已经存在，请重新确认！"
  return false;
  }else{
  if(vl==""){
  content.innerHTML="销售编号不能为空！"
  return false;
  }
  else{
  content.innerHTML="该销售编号可以使用！"
  return true;
  }
  }
  }
  });
  }
  
  
  //验证车辆编号
  function ckMerch(obj){
  var vl=obj.value;
  var content=document.getElementById("spMerch");
  $.ajax({
  url:"sale/ajaxMerchId",
  type:"get",
  data:"merchId="+vl,
  success:function(data){
  if(data=="true")
  {
  content.innerHTML="该车辆编号存在，可以使用！"
  return true;
  }else{
  if(vl==""){
  content.innerHTML="车辆编号不能为空！"
  return false;
  }
  content.innerHTML="该车辆编号不存在或者库存不足，请重新确认！"
  exists=false;
  }
  }
  });
  }
  
  
  //验证销售数量
  function ckNum(obj){
  var vl=obj.value;
  var content=document.getElementById("spNum");
  if(vl==""){
  content.innerHTML="销售数量不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  
  //验证销售日期
  function ckDate(obj){
  var vl=obj.value;
  var content=document.getElementById("spDate");
  if(vl==""){
  content.innerHTML="销售日期不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  //验证客户姓名
  function ckCustomName(obj){
  var vl=obj.value;
  var content=document.getElementById("spCustomName");  
  $.ajax({
  url:"sale/ajaxCustomName",
  type:"get",
  data:"customName="+vl,
  success:function(data){
  if(data=="true")
  {
  content.innerHTML="该客户存在，可以使用！"
  return true;
  }else{
  content.innerHTML="该客户不存在，请先添加客户信息！"
  exists=false;
  }
  if(vl==""){
  content.innerHTML="客户姓名不能为空！"
  return false;
  }
  }
  });
  }
  
  
  //验证销售人姓名
  function ckEmpName(obj){
  var vl=obj.value;
  var content=document.getElementById("spEmpName");
  $.ajax({
  url:"sale/ajaxEmpName",
  type:"get",
  data:"empName="+vl,
  success:function(data){
  if(data=="true")
  {
  content.innerHTML="该销售人存在，可以使用！"
  exists=true;
  }else{
  content.innerHTML="该销售人在职工表不存在，请重新确认！"
  exists=false;
  }
  if(vl==""){
  content.innerHTML="销售人姓名不能为空！"
  return false;
  }
  }
  });
  }
  
  
  
  function ckAllForm(){
  var content1=document.getElementById("spId");
  var content2=document.getElementById("spMerch");
  var content3=document.getElementById("spNum");
  var content4=document.getElementById("spDate");
  var content5=document.getElementById("spCustomName");
  var content6=document.getElementById("spEmpName");
  var salebillid=$("input[name=salebillid]").val();
  var merch=$("input[name=merch]").val();
  var salenum=$("input[name=salenum]").val();
  var saledate=$("input[name=saledate]").val();
  var customname=$("input[name=customname]").val();
  var employeename=$("input[name=employeename]").val();
  if(salebillid==""){
  content1.innerHTML="销售编号不能为空！"
  return false;
  }
  if(merch==""){
  content2.innerHTML="车辆编号不能为空！"
  return false;
  }
  if(salenum==""){
  content3.innerHTML="销售数量不能为空！"
  return false;
  }
  if(saledate==""){
  content4.innerHTML="销售日期不能为空！"
  return false;
  }
  if(customname==""){
  content5.innerHTML="客户姓名不能为空！"
  return false;
  }
  if(employeename==""){
  content6.innerHTML="销售人姓名不能为空！"
  return false;
  }
  return exists;
  }
  </script>
  <style type="text/css">
  #spId,#spNum,#spDate,#spCustomName,#spEmpName{
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
  .date{
  width: 196px;
  height: 25px;
  font-size: 15px;
  }
  </style>
  </head>
  
  <body>
    <div class="">
    <jsp:include page="../manage/carMain.jsp"></jsp:include>
  </div>
  <span class="current">当前位置：<span class="manage">销售信息管理</span>-><span class="view">修改销售信息</span>-><span class="view2">修改销售信息</span></span>
  <div class="main">
   <form action="sale/UpdateSaleT" onsubmit="return ckAllForm()" class="form">
   <!-- 传修改前的销售数量 -->
   <input type="hidden" name="presalenum" value="${saleModel.salenum }">
   <!-- 传销售单号 -->
   <input type="hidden" name="salebillid" value="${saleModel.salebillid }">
   <input type="hidden" name="merch" value="${saleModel.merch }">
    <table>
    <tr>
    <td>销售单号：</td>
    <td style="width: 196px;background-color: #c3dde0;">${saleModel.salebillid }</td>
    </tr>
    <tr>
    <td>车辆编号：</td>
    <td style="width: 196px;background-color: #c3dde0;">${saleModel.merch }</td>
    </tr>
    <tr>
    <td>销售数量：</td>
    <td><input name="salenum" onblur="ckNum(this)" value="${saleModel.salenum }"></td>
    <td><span id="spNum"></span></td>
    </tr>
    <tr>
    <td>销售日期：</td>
    <td><input class="date" name="saledate" type="Date" onblur="ckDate(this)" value='<f:formatDate value="${saleModel.saledate }" pattern="yyyy-MM-dd"/>' ></td>
    <td><span id="spDate"></span></td>
    </tr>
    <tr>
    <td>客户姓名：</td>
    <td><input name="customname" onblur="ckCustomName(this)" value="${saleModel.customname }"></td>
    <td><span id="spCustomName"></span></td>
    </tr>
    <tr>
    <td>销售人姓名：</td>
    <td><input name="employeename" onblur="ckEmpName(this)" value="${saleModel.employeename }"></td>
    <td><span id="spEmpName"></span></td>
    </tr>
    </table>
    <input type="submit" value="提交" class="button">&nbsp;
    <input type="reset" value="重置" class="button">&nbsp;
    <input type="button" onclick="javascript:location.href='sale/toUpdateSale'" value="返回" class="button">
    </form>
    </div>
  </body>
</html>
