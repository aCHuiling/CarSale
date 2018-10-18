<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	
  
    <!-- <link href="res/css/index.css" type=text/css rel=stylesheet> -->
    <link href="res/css/style_left.css" type=text/css rel=stylesheet>
    <script type="text/javascript">
	window.onload=function()
	{ 
		if(document.readyState=="complete")
		{
		  	document.getElementById("LoginName").focus(); 
		}
	}
</script>
</head>
  
  <%-- <body class="login_bg">
    <section class="loginBox">
        <header class="loginHeader">
            <h1>汽车销售管理系统</h1>
        </header>
        <section class="loginCont">
	        <form class="loginForm" action="login"  name="actionForm" id="actionForm"  method="post" >
				<div class="info">${msg }</div>
				<div class="inputbox">
                    <label for="user">用户名：</label>
					<input type="text" class="input-text" id="" name="username" placeholder="请输入用户名" required/>
				</div>	
				<div class="inputbox">
                    <label for="mima">密码：</label>
                    <input type="password" id="" name="password" placeholder="请输入密码" required/>
                </div>
                <div>
                <input name="ismanage" type="radio" checked="checked" value="2">普通用户
                <input name="ismanage" type="radio" value="1">管理员
                </div>	
				<div class="subBtn">
                    <input type="submit" value="登录"/>&nbsp;
                    <input type="reset" value="重置"/>
                </div>	
			</form>
        </section>
    </section>
    
</body> --%>



<BODY id=loginbody>
<FORM name=AdminLogin action="login" method=post>
  <DIV id=adminboxall style="background: url(res/images/logbj.gif) #fff repeat-x; TEXT-ALIGN: center">
  <DIV class=adminboxtop style="background: url(res/images/admin_top1.gif) no-repeat center top; HEIGHT: 167px"></DIV>
  <DIV id=adminboxmain style="background:url(res/images/admin_main.gif) no-repeat center top; HEIGHT: 39px">
    <DIV style="MARGIN-TOP: 5px; MARGIN-LEFT: 380px">
      <INPUT id=IbtnEnter 
style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; WIDTH: 76px; HEIGHT: 26px; BORDER-RIGHT-WIDTH: 0px" 
type=image src="res/images/admin_menu.gif" name=IbtnEnter>
    </DIV>
  </DIV>
  <DIV class=adminboxbottom style="background: url(res/images/admin_bottom.gif) no-repeat center top; HEIGHT: 87px">
    <DIV id=login>
      
      <UL>
        <LI class=text>用户名：<BR>
          <DIV class=box1>
            <INPUT class=smallInput id=LoginName style="WIDTH: 80px" 
  name="username">
          </DIV>
        </LI>
        <LI class=text>密 码：<BR>
          <DIV class=box2>
            <INPUT class=smallInput id=LoginPassword style="WIDTH: 80px" 
  type=password name="password">
          </DIV>
        </LI>
        <LI class=text>身份：<BR>
          <DIV class=box4>
             <input name="ismanage" type="radio" checked="checked" value="3">普通用户
             <input name="ismanage" type="radio" value="1">管理员
             <input name="ismanage" type="radio" value="2">经理
          </DIV>
        </LI>
        <li>
    <div class="info" style="color: red">${msg }</div>
    </li>
      </UL>
    </DIV>
  </DIV>
  </DIV>
</FORM>
</BODY>

</html>
