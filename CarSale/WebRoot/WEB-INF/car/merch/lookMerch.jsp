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
    
    <title>My JSP 'lookMerch.jsp' starting page</title>
    
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
height: 140px;

}
.inputtable input{
height: 25px;
font-size: 15px;
}
.inputtable tr td:FIRST-CHILD {
	width: 80px;
}
.check{
width: 60px;
height: 25px;
margin-left: 84px;
}
.reset{
width: 60px;
height: 25px;
margin-left: 10px;
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
    <span class="current">当前位置：<span class="manage">车辆信息管理</span>-><span class="view">查看车辆信息</span></span>
  <div class="main">
  <form action="merch/toLookMerch" method="post" class="form">
  <table class="inputtable">
  <tr>
  <td>供货商号：</td>
  <td><input name="profferid"></td>
  </tr>
  <tr>
  <td>车辆名称：</td>
  <td><input name="fullname"></td>
  </tr>
  <tr>
  <td>发动机号：</td>
  <td><input name="enginenumber"></td>
  </tr>
  <tr>
  <td>车架号：</td>
  <td><input name="vin"></td>
  </tr>  
  </table>
  <input class="check" type="submit" value="查询">
  <input class="reset" type="reset" value="重置">
  </form>
    <table class="hovertable">
    <tr>
    <th>车辆编号</th>
    <th>供货商号</th>
    <th>名称</th>
    <th>发动机号</th>
    <th>车架号</th>
    <th>颜色</th>
    <th>计量单位</th>
    <th>类别</th>
    <th>产地</th>
    <th>单价（万）</th>
    <th>备注</th>
    </tr>
    <c:forEach items="${merchbillList }" var="m">
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>${m.merchid }</td>
    <td>${m.profferid }</td>
    <td>${m.fullname }</td>
    <td>${m.enginenumber }</td>
    <td>${m.vin }</td>
    <td>${m.color }</td>
    <td>${m.metricunit }</td>
    <td>${m.kind }</td>
    <td>${m.birthplace }</td>
    <td>${m.unitcost }</td>
    <td>${m.others }</td>
    </tr>
    </c:forEach>
    </table>
    <jsp:include page="../Page.jsp"></jsp:include>
    </div>
  </body>
</html>
