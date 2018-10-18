
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<style type="text/css">
.pageMain{
position:absolute;
font-size: 17px;
}
 #page{
float: right;
position:relative;
top:-23px;
left: 200px;

}

#page a{
font-size: 15px;
}
</style>

 <div class="pageMain">
 <div class="Shu">
<span>共  ${pageModel.totalCount }  条记录</span>
<span>第  ${pageModel.currPage }/${pageModel.totalPage }  页</span>
</div> 
<ul id="page" style="list-style: none;">
	<c:if test="${pageModel.currPage==1 }">
		<li style="float: left; margin-left: 20px;"><a href="?pageIndex=1${requestScope.parm }">首页</a></li>
		<li style="float: left; margin-left: 20px;"><a
			href="?pageIndex=1${requestScope.parm }">上一页</a>
		</li>
	</c:if>
	<c:if test="${pageModel.currPage>1 }">
		<li style="float: left; margin-left: 20px;"><a href="?pageIndex=1${requestScope.parm }">首页</a></li>
		<li style="float: left; margin-left: 20px;"><a
			href="?pageIndex=${pageModel.currPage-1}${requestScope.parm }">上一页</a>
		</li>
	</c:if>
	<c:if test="${pageModel.currPage<pageModel.totalPage }">
		<li style="float: left; margin-left: 20px;"><a
			href="?pageIndex=${pageModel.currPage+1}${requestScope.parm }">下一页</a>
		</li>
		<li style="float: left; margin-left: 20px;"><a
			href="?pageIndex=${pageModel.totalPage}${requestScope.parm }">末页</a>
		</li>
	</c:if>
	<c:if test="${pageModel.currPage==pageModel.totalPage }">
		<li style="float: left; margin-left: 20px;"><a
			href="?pageIndex=${pageModel.totalPage}${requestScope.parm }">下一页</a>
		</li>
		<li style="float: left; margin-left: 20px;"><a
			href="?pageIndex=${pageModel.totalPage}${requestScope.parm }">末页</a>
		</li>
	</c:if>
</ul>
</div> 
<script type="text/javascript">
	var ul = document.getElementById("page");
	var lis = ul.children;
	//alert(lis.length);
	for ( var i = 0; i < lis.length; i++) {
		var aHref = lis[i].children[0].attributes[0].nodeValue;//li->a->a属性->值
		//alert(lis[i].children[0].attributes[0].nodeValue);
		var url = location.href.split("?")[0];//当前地址
		lis[i].children[0].attributes[0].nodeValue = url + aHref;
		//alert(url+aHref);
	}
</script>

