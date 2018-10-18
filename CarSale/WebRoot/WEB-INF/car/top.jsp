<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="res/css/css.css">
	

  </head>
  
  <body>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="header">
  <tr>
    <td rowspan="2" align="left" valign="top" id="logo"><img src="res/img/logo.png" width="74" height="64"></td>
    <td align="left" valign="bottom" id="header-name">汽车销售管理系统</td>
    <td align="left" valign="bottom">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" valign="top" id="header-right">
        	<a href="manage/toExit" target="topFrame" onFocus="this.blur()" class="admin-out">退出</a>      	
            <span>
        <!-- 日历 -->
        <SCRIPT type=text/javascript src="res/js/clock.js"></SCRIPT>
        <SCRIPT type=text/javascript>showcal();</SCRIPT>
            </span>
        </td>
      </tr>
      <h3>${sessionScope.currEmpModel.name }
      <span style="color: black; font-size: 12px;">
      <c:if test="${userModel.ismanage==1 }">（系统管理员）</c:if>
      <c:if test="${userModel.ismanage==3 }">（普通用户）</c:if>
      <c:if test="${userModel.ismanage==2 }">（经理）</c:if>
      </span>
      ，欢迎您！</h3>
    </table></td>
  </tr>
</table>
  </body>
</html>
