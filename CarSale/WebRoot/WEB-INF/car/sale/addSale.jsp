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
    
    <title>My JSP 'addSale.jsp' starting page</title>
    
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
  content.innerHTML="该销售单号已经存在，请重新确认！"
  return false;
  }else{
  if(vl==""){
  content.innerHTML="销售单号不能为空！"
  return false;
  }
  content.innerHTML="该销售单号可以使用！"
  return true;
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
  content.innerHTML="该车辆编号不存在或者库存不足，请重新确认！"
  exists=false;
  }
  if(vl==""){
  content.innerHTML="车辆编号不能为空！"
  return false;
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
  content1.innerHTML="销售单号不能为空！"
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
  
  
  function randomWord(randomFlag, min, max){
var str = "",
range = min,
arr = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
 
// 随机产生
if(randomFlag){
   range = Math.round(Math.random() * (max-min)) + min;
}
for(var i=0; i<range; i++){
   pos = Math.round(Math.random() * (arr.length-1));
   str += arr[pos];
}
document.getElementById("salebillid").value=str;
}
  </script>
  
  <style type="text/css">
  #spId,#spNum,#spDate,#spCustomName,#spEmpName{
  color: red;
  }
  .form{
  width: 800px;
  height: 300px;
  margin: 100px auto;
  background-color: #E3E3E3;
  padding-left: 60px;
  padding-top: 50px;
  }
  input,.select{
  height: 25px;
  font-size: 15px;
  }
  .button{
  width: 50px;
  }
  .date,.select{
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
    <jsp:include page="../manage/carMain.jsp"></jsp:include>
  </div>
    <span class="current">当前位置：<span class="manage">销售信息管理</span>-><span class="view">添加销售信息</span></span>
  <div class="main">
   <form action="sale/AddSale" onsubmit="return ckAllForm()" class="form">
    <table class="add">
    <tr>
    <td>销售单号：</td>
    <td><input name="salebillid" onblur="ckId(this)" id="salebillid"></td>
    <td><!-- <button onclick="randomWord(true, 4, 20)">点击随机生成销售单号</button> --><span id="spId"></span></td>
    </tr>
    <tr>
    <td>车架号：</td>
    <td>
    <select name="salevin" onblur="ckMerch(this)" class="select">
    <c:forEach items="${storeList }" var="s">
    <option>${s.merchbill.vin }</option>
    </c:forEach>
    </select>
    </td>
    <td><span id="spMerch"></span></td>
    </tr>
    <tr>
    <td>销售数量：</td>
    <td><input name="salenum" onblur="ckNum(this)"></td>
    <td><span id="spNum"></span></td>
    </tr>
    <tr>
    <td>销售日期：</td>
    <td><input class="date" name="saledate" type="Date" onblur="ckDate(this)"></td>
    <td><span id="spDate"></span></td>
    </tr>
    <tr>
    <td>客户姓名：</td>
    <td><input name="customname" onblur="ckCustomName(this)"></td>
    <td><span id="spCustomName"></span></td>
    </tr>
    <tr>
    <td>销售人姓名：</td>
    <td><input name="employeename" onblur="ckEmpName(this)"></td>
    <td><span id="spEmpName"></span></td>
    </tr>
    </table>
    <input type="submit" value="提交" class="button">&nbsp;
    <input type="reset" value="重置" class="button">
    </form>
    </div>
  </body>
</html>
