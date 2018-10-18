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
    
    <title>My JSP 'addMerch.jsp' starting page</title>
    
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
  
  
  //验证发动机号
  function ckEnginenumber(obj){
  var vl=obj.value;
  var content=document.getElementById("spEnginenumber");
  $.ajax({
  url:"merch/ajaxEnginenumber",
  type:"get",
  data:"enginenumber="+vl,
  success:function(data){
  if(data=="true")
  {
  content.innerHTML="该发动机号已经存在，请重新生成！"
  return false;
  }else{
  if(vl==""){
  content.innerHTML="发动机号不能为空！"
  return false;
  }
  content.innerHTML="该发动机号可以使用！"
  return true;
  }
  }
  });
  }
  
  
  function ckVin(obj){
  var vl=obj.value;
  var content=document.getElementById("spVin");
  $.ajax({
  url:"merch/ajaxVin",
  type:"get",
  data:"vin="+vl,
  success:function(data){
  if(data=="true")
  {
  content.innerHTML="该车架号已经存在，请重新生成！"
  return false;
  }else{
  if(vl==""){
  content.innerHTML="车架号不能为空！"
  return false;
  }
  content.innerHTML="该车架号可以使用！"
  return true;
  }
  }
  });
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
  var content5=document.getElementById("spVin");
  var content6=document.getElementById("spColor");
  var fullname=$("input[name=fullname]").val();
  var enginenumber=$("input[name=enginenumber]").val();
  var metricunit=$("input[name=metricunit]").val();
  var unitcost=$("input[name=unitcost]").val();
  var vin=$("input[name=vin]").val();
  var color=$("input[name=color]").val();
  if(fullname==""){
  content1.innerHTML="名称不能为空！"
  return false;
  }
  if(enginenumber==""){
  content2.innerHTML="发动机号不能为空！"
  return false;
  }
  if(vin==""){
  content5.innerHTML="车架号不能为空！"
  return false;
  }
  if(color==""){
  content6.innerHTML="颜色不能为空！"
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
document.getElementById("enginenumber").value=str;
}

function randomWord2(randomFlag, min, max){
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
document.getElementById("vin").value=str;
}
  </script>
  <style type="text/css">
  #spName,#spEnginenumber,#spMetricunit,#spUnitcost,#spVin,#spColor{
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
  .select{
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
  <span class="current">当前位置：<span class="manage">车辆信息管理</span>-><span class="view">添加车辆信息</span></span>
  <div class="main">
  <form action="merch/AddMerch" onsubmit="return ckAllForm()" class="form">
    <table>
    <tr>
    <td>供货商号：</td>
    <td>
    <select name="profferid" class="select">
    <c:forEach items="${profferList }" var="p">
    <option value="${p.profferid }">${p.profferid }</option>
    </c:forEach>
    </select>
    </td>
    </tr>
    <tr>
    <td>名称：</td>
    <td><input name="fullname" onblur="ckName(this)"></td>
    <td><span id="spName"></span></td>
    </tr>
    <tr>
    <td>发动机号：</td>
    <td><input name="enginenumber" onblur="ckEnginenumber(this)" id="enginenumber"></td>
    <td><button onclick="randomWord(true, 7, 8)">点击随机生成发动机号</button><span id="spEnginenumber"></span></td>
    </tr>
    <tr>
    <tr>
    <td>车架号：</td>
    <td><input name="vin" onblur="ckVin(this)" id="vin"></td>
    <td><button onclick="randomWord2(false, 17)">点击随机生成车架号</button><span id="spVin"></span></td>
    </tr>
    <tr>
    <tr>
    <td>颜色：</td>
    <td><input name="color" onblur="ckColor(this)"></td>
    <td><span id="spColor"></span></td>
    </tr>
    <tr>
    <td>计量单位：</td>
    <td><input name="metricunit" onblur="ckMetricunit(this)"></td>
    <td><span id="spMetricunit"></span></td>
    </tr>
    <tr>
    <td>类别：</td>
    <td><input name="kind"></td>
    <td></td>
    </tr>
    <tr>
    <td>产地：</td>
    <td><input name="birthplace"></td>
    <td></td>
    </tr>
    <tr>
    <td>单价（万）：</td>
    <td><input name="unitcost" onblur="ckUnitcost(this)"></td>
    <td><span id="spUnitcost"></span></td>
    </tr>
    <tr>
    <td>备注：</td>
    <td><input name="others"></td>
    <td></td>
    </tr>
    </table>
    <input type="submit" value="提交" class="button">&nbsp;
    <input type="reset" value="重置" class="button">
    </form>
    </div>
  </body>
 

</html>
