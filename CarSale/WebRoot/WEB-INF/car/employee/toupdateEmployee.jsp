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
    
    <title>My JSP 'toupdateEmployee.jsp' starting page</title>
    
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
  <span class="current">当前位置：<span class="manage">职工信息管理</span>-><span class="view">修改职工信息</span></span>
  <div class="main">
  <form action="employee/toUpdateEmployee" method="post" class="form">
			姓名：<input type="text" name="name"> 
			<input type="submit" value="查询" class="check">
		</form>
    <table class="hovertable">
    <tr>
    <th>职工编号</th>
    <th>姓名</th>
    <th>性别</th>
    <th>籍贯</th>
    <th>学历</th>
    <th>类别</th>
    <th>工资</th>
    <th>联系电话</th>
    <th>联系地址</th>
    <th>身份证号</th>
    <th>聘用日期</th>
    <th>备注</th>
    <th>操作</th>
    </tr>
    <c:forEach items="${empList }" var="e">
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>${e.staffid }</td>
    <td>${e.name }</td>
    <td>${e.sex }</td>
    <td>${e.home }</td>
    <td>${e.diploma }</td>
    <td>${e.empkind }</td>
    <td>${e.salary }</td>
    <td>${e.phone }</td>
    <td>${e.adress }</td>
    <td>${e.idcard }</td>
    <td><f:formatDate value="${e.begindate }" pattern="yyyy-MM-dd"/></td>
    <td>${e.empothers }</td>
    <td><a href="employee/UpdateEmployee?staffid=${e.staffid }"><img src="res/img/bg_button_update.gif"></a></td>
    </tr>
    </c:forEach>
    </table>
    <jsp:include page="../Page.jsp"></jsp:include>
    </div>
  </body>
</html>
