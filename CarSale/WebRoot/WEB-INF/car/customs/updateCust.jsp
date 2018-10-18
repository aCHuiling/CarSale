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
  .view2{
  color: #f5a76e;
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
  <span class="current">当前位置：<span class="manage">客户信息管理</span>-><span class="view">修改客户信息</span>-><span class="view2">修改客户信息</span></span>
  <div class="main">
  <form action="customs/UpdateCustomsT" onsubmit="return ckAllForm()" class="form">
  <input type="hidden" name="customsid" value="${custModel.customsid }">
    <table>
     <tr>
    <td>客户姓名：</td>
    <td><input name="custname" onblur="ckName(this)" value="${custModel.custname }"><span id="spName"></span></td>
    </tr>
     <tr>
    <td>客户性别：</td>
    <td>
    <select name="custsex" class="select">
    <c:choose>
    <c:when test="${custModel.custsex=='男' }">
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
    <td>客户年龄：</td>
    <td><input name="custage" onblur="ckAge(this)" value="${custModel.custage }"><span id="spAge"></span></td>
    </tr>
    <tr>
    <td>联系电话：</td>
    <td><input name="custphone" onblur="ckPhone(this)" value="${custModel.custphone }"><span id="spPhone"></span></td>
    </tr>
    </table>
    <input type="submit" value="提交" class="button">&nbsp;
    <input type="reset" value="重置" class="button">&nbsp;
    <input type="button" value="返回上一级" onclick="javascript:location.href='customs/toUpdateCustoms'">
    </form>
    </div>
  </body>
</html>
