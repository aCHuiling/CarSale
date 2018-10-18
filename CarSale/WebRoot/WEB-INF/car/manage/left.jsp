<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'carMain.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- <script type="text/javascript" src="res/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="res/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
  $(".title").toggle(
function(){$(this).find("~.child").show();},
function(){$(this).siblings().hide();}
);
  });
  </script>

<style type="text/css">
.menu{
width: 200px;
height: 600px;
background-color: #193b4e;
float: left;
}
.right{
float: left;
}
.title{
color: white;
width: 194px;
height: 30px;
border:1px solid white;
background-color: #265673;
padding-left: 5px;
font-family:"Microsoft YaHei","Tahoma","Arial",'宋体';
}

.child{
text-align: center;
}

li.title:hover{
cursor:pointer;
}
</style> -->



<style type="text/css">
/*通用设置*/
* {
	margin: 0;
	padding: 0;
}

html,body {
	height: 100%;

}

a:link,a:visited {
	text-decoration: none;
}

/*菜单个性设置*/
.box {
	width: 204px;
	height: 100%;
	background: url(res/images/menuboxbg.gif) repeat-y left top;
	float: left;
}

.box ul {
	list-style: none;
	text-align: left;
}

.box h2 {
	width: 204px;
	margin: 0 auto;
	height: 33px;
	background:url(res/images/menuhead.gif) no-repeat left top;
	text-indent: -9999px;
}
/*一级菜单*/
.menu li.level1 a {
	display: block;
	line-height: 31px;
	height: 31px;
	padding-left: 50px;
	font-size: 12px;
	color: #fff;
	background: url(res/images/menubg.gif) no-repeat left top;
}
/*一级菜单两态样式,供JS调用*/
.menu li.level1 a.hove {
	background-position: left -31px;
}

.menu li.level1 a.cur {
	background-position: left -62px;
}

/*二级菜单*/
.menu li ul {
	padding-left: 10px;
	padding-right: 15px;
}

.menu li ul.level2 li {
	height: 26px;
	line-height: 26px;
}

.menu li ul.level2 li a {
	display: block;
	height: 26px;
	line-height: 26px;
	background: #E7E3E7 url(res/images/t1.gif) no-repeat 30px center;
	padding-left: 50px;
	color: #42556B;
	border-top: 1px #B8C2CB solid;
	overflow: hidden;
}
/*二级菜单两态样式,供JS调用*/
.menu li ul.level2 li a.hove1 {
	background: #F6F6F6 url(res/images/t2.gif) no-repeat 30px center;
}

/* .right{
background-image:url("res/img/back.jpg");
width:1135px;
height:605px;
margin-left: 208px;
margin-top: 27px;
background-position: -200px -380px;
opacity:0.7;
filter:alpha(opacity=70);
} */
</style>
</head>

<body>
	<%-- <div class="menu">
    <c:forEach items="${sessionScope.menuLeft }" var="f">
    <c:if test="${f.parentid==0 }">
    </ul>
    <ul>
    <li class="title"><img src="res/img/root_node.gif" style="margin-top: 3px">${f.functitle }</li>
    </c:if>
    <c:if test="${f.parentid!=0 }">
    <li class="child" style="display: none"><a href="${f.funcurl }">${f.functitle }</a></li>
    </c:if>
    </c:forEach>
    </div> --%>




	<div class="box">
		<h2>汽车销售管理平台</h2>
		<ul class="menu">
			<c:forEach items="${sessionScope.menuLeft }" var="f">
				<li class="level1">
				    <c:if test="${f.parentid==0 }">
						<a>${f.functitle }</a>
					</c:if>
					<ul class="level2">
						<c:if test="${f.parentid!=0 }">
							<li><a href="${f.funcurl }">${f.functitle }</a></li>
						</c:if>
					</ul>
				</li>
			</c:forEach>
		</ul>
	</div>
	
	<div class="right"></div>


</body>
<%-- <script type="text/javascript">
     var url=location.href;
     url=(url.substring(url.indexOf('<%=request.getContextPath()%>')*1+'<%=request.getContextPath()%>'.length*1+1));
     $("a[href='"+url+"']").parent().parent().find("li").show();
     </script> --%>
<script type="text/javascript" src="res/js/menu.js"></script>
</html>

