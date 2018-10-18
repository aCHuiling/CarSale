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
    
    <title>My JSP 'addImport.jsp' starting page</title>
    
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
  
  //验证进货单号
  function ckId(obj){
  var vl=obj.value;
  var content=document.getElementById("spId");
  $.ajax({
  url:"import/ajaxId",
  type:"get",
  data:"importId="+vl,
  success:function(data){
  if(data=="true")
  {
  content.innerHTML="该进货单号已经存在，请重新确认！"
  return false;
  }else{
  if(vl==""){
  content.innerHTML="进货单号不能为空！"
  return false;
  }
  content.innerHTML="该进货单号可以使用！"
  return true;
  }
  }
  });
  }
  
  
  //验证进货价（万）
  function ckImportPrice(obj){
  var vl=obj.value;
  var content=document.getElementById("spImportPrice");
  if(vl==""){
  content.innerHTML="进货价（万）不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  
  //验证数量
  function ckQuantity(obj){
  var vl=obj.value;
  var importprice=$("input[name=importprice]").val();
  var content=document.getElementById("spQuantity");
  $.ajax({
  url:"import/ajaxCkCount",
  type:"get",
  data:"importPrice="+importprice+"&quantity="+vl,
  dataType:"json",
  success:function(data){
  if(data.empModel=="true")
  //给form表单的id赋值
  alert("金额："+data.totalmoney);
  document.getElementById("totalmoney").value=data.totalmoney;
  }
  });
  if(vl==""){
  content.innerHTML="数量不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  
  //进货日期
  function ckImportDate(obj){
  var vl=obj.value;
  var content=document.getElementById("spImportDate");
  if(vl==""){
  content.innerHTML="进货日期不能为空！"
  exists=false;
  }else{
  exists=true;
  }
  }
  
  
  function ckAllForm(){
  var content1=document.getElementById("spId");
  var content2=document.getElementById("spImportPrice");
  var content3=document.getElementById("spQuantity");
  var content4=document.getElementById("spImportDate");
  var importbillid=$("input[name=importbillid]").val();
  var importprice=$("input[name=importprice]").val();
  var quantity=$("input[name=quantity]").val();
  var importdate=$("input[name=importdate]").val();
  if(importbillid==""){
  content1.innerHTML="进货单号不能为空！"
  return false;
  }
  if(importprice==""){
  content2.innerHTML="进货价（万）不能为空！"
  return false;
  }
  if(quantity==""){
  content3.innerHTML="数量不能为空！"
  return false;
  }
  if(importdate==""){
  content4.innerHTML="进货日期不能为空！"
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
document.getElementById("importbillid").value=str;
}
  </script>
  <style type="text/css">
  #spId,#spImportPrice,#spQuantity,#spImportDate,#totalmoney{
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
.select,.date{
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
  <span class="current">当前位置：<span class="manage">进货信息管理</span>-><span class="view">添加进货信息</span></span>
  <div class="main">
  <form action="import/AddImport" onsubmit="return ckAllForm()" class="form">
    <table>
    <tr>
    <td>进货单号</td>
    <td><input id="importbillid" name="importbillid" onblur="ckId(this)"></td>
    <td><button onclick="randomWord(true, 4, 20)">点击随机生成进货单号</button><span id="spId"></span></td>
    </tr>
    <tr>
    <td>车辆编号</td>
    <td>
    <select name="merchbillid" class="select">
    <c:forEach items="${merchbillList }" var="m">
    <option value="${m.merchid }">${m.merchid }</option>
    </c:forEach>
    </select>
    </td>
    </tr>
    <tr>
    <td>进货价（万）</td>
    <td><input name="importprice" onblur="ckImportPrice(this)"></td>
    <td><span id="spImportPrice"></span></td>
    </tr>
    <tr>
    <td>数量</td>
    <td><input name="quantity" onblur="ckQuantity(this)"></td>
    <td><span id="spQuantity"></span></td>
    </tr>
    <tr>
    <td>进货日期</td>
    <td><input type="Date" name="importdate" onblur="ckImportDate(this)" class="date"></td>
    <td><span id="spImportDate"></span></td>
    </tr>
    <tr>
    <td>金额（万）</td>
    <td><input name="totalmoney" id="totalmoney"></td>
    </tr>
    <tr>
    <td>备注</td>
    <td><input name="impothers"></td>
    </tr>
    </table>
    <input type="submit" value="提交" class="button">&nbsp;
    <input type="reset" value="重置" class="button">
    </form>
    </div>
  </body>
</html>
