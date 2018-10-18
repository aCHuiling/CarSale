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
    
    <title>My JSP 'lookStore.jsp' starting page</title>
    
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
  <span class="current">当前位置：<span class="manage">库存信息管理</span>-><span class="view">查看库存信息</span></span>
    <div class="main" >
    <form action="store/toLookStore" method="post" onsubmit="retrun ckSelect()" class="form">
			车辆编号：<input type="text" name="tomerchid"> 
			<input type="submit" value="查询" class="check">
		</form> 
    <table class="hovertable">
    <tr>
    <th>车辆编号</th>
    <th>车辆名称</th>
    <th>发动机号</th>
    <th>车架号</th>
    <th>车辆颜色</th>
    <th>类别</th>
    <th>数量</th>
    </tr>
    <c:forEach items="${storeList }" var="s" >
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>${s.tomerchid }</td>
    <td>${s.merchbill.fullname }</td>
    <td>${s.merchbill.enginenumber }</td>
    <td>${s.merchbill.vin }</td>
    <td>${s.merchbill.color }</td>
    <td>${s.merchbill.kind }</td>
    <td>${s.storenum }</td>
    </tr>
    </c:forEach>
    </table>
  <jsp:include page="../Page.jsp"></jsp:include>
    </div>
  </body>
</html>
