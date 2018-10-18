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
    
    <title>My JSP 'roleList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="res/css/main.css">
<script type="text/javascript">
	
	//修改
	function updateRole(){
	var roleCk=document.getElementsByName("ckRole");
	var count=0;
	var currCk;
	for(var i=0;i<roleCk.length;i++){
	if(roleCk[i].checked){
	count++;
	roleCk[i].checked=false;//弹窗后将勾去掉
	if(count>1){
	alert("只能修改一个！");
	return;
	}
	currCk=roleCk[i];
	}
	}
	if(count==0){
	alert("请选择一个进行修改！");
	return;
	}
	location.href='manage/toUpdateRole?rowid='+currCk.attributes[2].nodeValue;;
	
	}
	
	//删除
	function delRole() {
		var cks = document.getElementsByName("ckRole");//取出的是一个数组
		var ids = "";
		var count = 0;
		for ( var i = 0; i < cks.length; i++) {
			if (cks[i].checked)//是否选中
			{
			    count++;
				ids += cks[i].attributes[2].nodeValue + ",";
				}
		}
		if (count == 0) {
			alert("请选择一个进行删除！");
			return;
		}
		location.href = "manage/toDelRole?ids=" + ids;
	}
	
	

	//全选
	function selectAll() {
		var cks = document.getElementsByName("ckRole");//取出的是一个数组
		for ( var i = 0; i < cks.length; i++) {
			cks[i].checked = true;
		}
	}
	
	//功能配对
	function mapFunction() {
		var cks = document.getElementsByName("ckRole");//取出的是一个数组
		var count = 0;
		var id = "";
		for ( var i = 0; i < cks.length; i++) {
			if (cks[i].checked) {//是否选中
				if (count > 0) {
					alert("只能选择一个进行功能配对，请重新选择！");
					return;
				}
				id = cks[i].attributes[2].nodeValue;
				count++;
			}
		}
		if (count == 0) {
			alert("至少选择有一个功能进行配对！");
			return;
		}
		location.href = "manage/userFuncList?id=" + id;

	}
	
	</script>
	
<style type="text/css">
.form{
width: 800px;
height: 95px;
margin-top: 5px;
}
.form input{
height: 25px;
font-size: 15px;
}
.check{
width: 50px;
height: 25px;
margin-bottom: 5px;
}
.check2{
height: 25px;
margin-bottom: 5px;
}
.current{
position: absolute;
top:95px;
left: 206px;
}
.manage{
color: #f47920;
font-weight:bold;
}
  </style>
  </head>
  
  <body>
    <div class="">
    <jsp:include page="carMain.jsp"></jsp:include>
  </div>
  <span class="current">当前位置：<span class="manage">角色管理</span></span>
    <div class="main">
    <form action="manage/RoleList" method="post" class="form">
    <table>
    <tr>
    <td>角色名称：<input type="text" name="rolename"></td>
    </tr>
    <tr>
    <td>角色代码：<input name="rolecode"><br></td>
    </tr>
    <tr>
    <td><input type="submit" value="查询" class="check"></td>
    </tr>
    </table>
    </form>
    <input type="button" value="全选" onclick="selectAll()" class="check">&nbsp;
    <input type="button" value="新增" onclick="javascript:location.href='manage/toAddRole'" class="check">&nbsp;
    <input type="button" value="修改" onclick="updateRole()" class="check">&nbsp;
    <input type="button" value="删除" onclick="delRole()" class="check">
    <input type="button" value="功能配对" onclick="mapFunction()" class="check2">
    <table class="hovertable">
    <tr>
    <th>角色名称</th>
    <th>角色代码</th>
    <th>功能名称</th>
    <th>操作</th>
    </tr>
    <c:forEach items="${roleList }" var="rl">
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>${rl.rolename }</td>
    <td>${rl.rolecode }</td>
    <td>${rl.funcname }</td>
    <td><input type="checkbox" name="ckRole" rowId="${rl.rowid }"></td>
    </tr>
    </c:forEach>
    </table>
    <jsp:include page="../Page.jsp"></jsp:include>
    </div>
  </body>
</html>
