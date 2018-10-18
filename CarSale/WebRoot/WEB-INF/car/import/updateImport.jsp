<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateImport.jsp' starting page</title>
    
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
  <span class="current">当前位置：<span class="manage">进货信息管理</span>-><span class="view">修改进货信息</span>-><span class="view2">修改进货信息</span></span>
  <div class="main">
  <form action="import/UpdateImportT" onsubmit="return ckAllForm()" class="form">
  <input type="hidden" name="importbillid" value="${impModel.importbillid }">
  <input type="hidden" name="preimportnum" value="${impModel.quantity }">
  <input type="hidden" name="merchbillid" value="${impModel.merchbillid }">
    <table>
    <tr>
    <td>进货单号：</td>
    <td style="width: 196px;background-color: #c3dde0;">${impModel.importbillid }</td>
    </tr>
    <tr>
    <td>车辆编号：</td>
    <td style="width: 196px;background-color: #c3dde0;">${impModel.merchbillid }</td>
    </tr>
    <tr>
    <td>车辆名称：</td>
    <td style="width: 196px;background-color: #c3dde0;">${impModel.merchname }</td>
    </tr>
    <tr>
    <td>进货价（万）：</td>
    <td><input name="importprice" onblur="ckImportPrice(this)" value="${impModel.importprice }" ></td>
    <td><span id="spImportPrice"></span></td>
    </tr>
    <tr>
    <td>数量：</td>
    <td><input name="quantity" onblur="ckQuantity(this)" value="${impModel.quantity }"></td>
    <td><span id="spQuantity"></span></td>
    </tr>
    <tr>
    <td>进货日期：</td>
    <td><input class="date" type="Date" name="importdate" onblur="ckImportDate(this)" value='<f:formatDate value="${impModel.importdate }" pattern="yyyy-MM-dd"/>'></td>
    <td><span id="spImportDate"></span></td>
    </tr>
    <tr>
    <td>金额（万）：</td>
    <td><input name="totalmoney" id="totalmoney" value="${impModel.totalmoney }"></td>
    </tr>
    <tr>
    <td>备注：</td>
    <td><input name="other" value="${impModel.impothers }"></td>
    </tr>
    </table>
    <input type="submit" value="提交" class="button">&nbsp;
    <input type="reset" value="重置" class="button">&nbsp;
    <input type="button" onclick="javascript:location.href='import/toUpdateImport'" value="返回上一级">
    </form>
    </div>
  </body>
</html>
