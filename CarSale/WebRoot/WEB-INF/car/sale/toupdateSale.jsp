<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>My JSP 'toupdateSale.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="res/css/main.css">
<style type="text/css">
.form{
width: 800px;
height: 40px;
margin-top: 5px;
}
.form input{
height: 25px;
font-size: 15px;
}
.check{
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
    <span class="current">当前位置：<span class="manage">销售信息管理</span>-><span class="view">修改销售信息</span></span>
  <div class="main">
  <c:if test="${userModel.ismanage==2 }">
  <form action="sale/toUpdateSale" method="post" class="form">
	销售单号：<input type="text" name="salebillid"> 
	<input type="submit" value="查询" class="check">
	</form>
    <table class="hovertable">
    <tr>
    <th>销售单号</th>
    <th>车辆编号</th>
    <th>销售数量</th>
    <th>销售日期</th>
    <th>客户姓名</th>
    <th>销售人姓名</th>
    <th>操作</th>
    </tr>
    <c:forEach items="${saleList }" var="s">
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>${s.salebillid }</td>
    <td>${s.merch }</td>
    <td>${s.salenum }</td>
    <td><f:formatDate value="${s.saledate }" pattern="yyyy-MM-dd"/></td>
    <td>${s.customs.custname }</td>
    <td>${s.employee.name }</td>
    <td><a href="sale/UpdateSale?salebillid=${s.salebillid }&customname=${s.customs.custname }&employeename=${s.employee.name }"><img src="res/img/bg_button_update.gif"></a></td>
    </tr>
    </c:forEach>
    </table>
    <jsp:include page="../Page.jsp"></jsp:include>
    </c:if>
    <c:if test="${userModel.ismanage==3 }">
  <form action="sale/toUpdateSale" method="post" class="form">
	销售单号：<input type="text" name="salebillid"> 
	<input type="submit" value="查询" class="check">
	</form>
    <table class="hovertable">
    <tr>
    <th>销售单号</th>
    <th>车辆编号</th>
    <th>销售数量</th>
    <th>销售日期</th>
    <th>客户姓名</th>
    <th>销售人姓名</th>
    <th>操作</th>
    </tr>
    <c:forEach items="${salePeople }" var="s">
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>${s.salebillid }</td>
    <td>${s.merch }</td>
    <td>${s.salenum }</td>
    <td><f:formatDate value="${s.saledate }" pattern="yyyy-MM-dd"/></td>
    <td>${s.customs.custname }</td>
    <td>${s.employee.name }</td>
    <td><a href="sale/UpdateSale?salebillid=${s.salebillid }&customname=${s.customs.custname }&employeename=${s.employee.name }"><img src="res/img/bg_button_update.gif"></a></td>
    </tr>
    </c:forEach>
    </table>
    <jsp:include page="../Page.jsp"></jsp:include>
    </c:if>
    </div>
  </body>
</html>
