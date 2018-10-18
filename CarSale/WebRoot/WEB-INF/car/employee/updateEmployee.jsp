<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateEmployee.jsp' starting page</title>
    
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
  
  
  //验证学历
  function ckDiploma(obj){
  var vl=obj.value;
  var content=document.getElementById("spDiploma");
  if(vl==""){
  content.innerHTML="学历不能为空！"
  return false;
  }else{
  return true;
  }
  }
  
  
  //进货身份证号
  function ckCard(obj){
  var vl=obj.value;
  var content=document.getElementById("spCard");
  var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
  if(reg.test(vl) === false)  
  {  
  content.innerHTML="身份证输入不合法";  
  exists=false;
  }else{
  exists=true;
  }
  }
  
  
  function ckAllForm(){
  var content1=document.getElementById("spName");
  var content2=document.getElementById("spSex");
  var content3=document.getElementById("spDiploma");
  var content4=document.getElementById("spCard");
  var name=$("input[name=name]").val();
  var sex=$("input[name=sex]").val();
  var diploma=$("input[name=diploma]").val();
  var idcard=$("input[name=idcard]").val();
  if(name==""){
  content1.innerHTML="姓名不能为空！"
  return false;
  }
  if(sex==""){
  content2.innerHTML="性别不能为空！"
  return false;
  }
  if(diploma==""){
  content3.innerHTML="学历不能为空！"
  return false;
  }
  if(idcard==""){
  content4.innerHTML="身份证号不能为空！"
  return false;
  }
  return exists;
  }
  </script>
  <style type="text/css">
  .form{
  width: 600px;
  height: 400px;
  margin: 80px auto;
  background-color: #E3E3E3;
  padding-left: 60px;
  padding-top: 30px;
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
  <span class="current">当前位置：<span class="manage">职工信息管理</span>-><span class="view">修改职工信息</span>-><span class="view2">修改职工信息</span></span>
  <div class="main">
  <form action="employee/UpdateEmployeeT" onsubmit="return ckAllForm()" class="form">
  <input type="hidden" name="staffid" value="${empModel.staffid }">
    <table>
     <tr>
    <td>姓名：</td>
    <td><input name="name" onblur="ckName(this)" value="${empModel.name }"><span id="spName"></span></td>
    </tr>
     <tr>
    <td>性别：</td>
    <!-- <td><input name="sex" onblur="ckSex(this)"><span id="spSex"></span></td> -->
    <td>
    <select name="sex" class="select">
    <c:choose>
    <c:when test="${empModel.sex=='男' }">
    <option value="男" selected="selected">男</option>
    <option value="女">女</option>
    </c:when>
    <c:otherwise>
    <option value="男">男</option>
	<option value="女" selected="selected">女</option>
	</c:otherwise>
    </c:choose>

    </select>
    </td>
    </tr>
     <tr>
    <td>籍贯：</td>
    <td><input name="home" value="${empModel.home }"></td>
    </tr>
     <tr>
    <td>学历：</td>
    <!-- <td><input name="diploma" onblur="ckDiploma(this)"><span id="spDiploma"></span></td> -->
    <td>
    <select name="diploma" class="select">
    
    <option value="${empModel.diploma }">${empModel.diploma }</option>
    <option value="大专">大专</option>
    <option value="本科">本科</option>
    <option value="研究生">研究生</option>
    <option value="硕士">硕士</option>
    <option value="博士">博士</option>
    </select>
    </td>
    </tr>
     <tr>
    <td>类别：</td>
    <td><input name="kind" value="${empModel.empkind }"></td>
    </tr>
     <tr>
    <td>工资：</td>
    <td><input name="salary" value="${empModel.salary }"></td>
    </tr>
     <tr>
    <td>联系电话：</td>
    <td><input name="phone" value="${empModel.phone }"></td>
    </tr>
     <tr>
    <td>联系地址：</td>
    <td><input name="adress" value="${empModel.adress }"></td>
    </tr>
     <tr>
    <td>身份证号：</td>
    <td><input name="idcard" onblur="ckCard(this)" value="${empModel.idcard }"><span id="spCard"></span></td>
    </tr>
    <tr>
    <td>聘用日期：</td>
    <td><input class="date" name="begindate" type="Date" value='<f:formatDate value="${empModel.begindate }" pattern="yyyy-MM-dd"/>' ></td>
    </tr>
    <tr>
    <td>备注</td>
    <td><input name="others" value="${empModel.empothers }"></td>
    </tr>
    </table>
    <input type="submit" value="提交" class="button">&nbsp;
    <input type="reset" value="重置" class="button">&nbsp;
    <input type="button" value="返回上一级" onclick="javascript:location.href='employee/toUpdateEmployee'">
    </form>
    </div>
  </body>
</html>
