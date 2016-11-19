<%-- User: fengymi--%>
<%-- Date: 16-11-2--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="zh">
<head>
<meta charset="UTF-8">
	<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录</title>

	<link rel="stylesheet" type="text/css" href="static/login/css/styles.css">

</head>
<body style="background: url('static/img/login_bg.jpg');background-size:cover">

	<div style="height:30px;"></div>

	<div class="login-wrap">
		<div class="login-html">
			<input id="tab-1" type="radio" name="tab" class="sign-in" checked /><label for="tab-1" class="tab">登录</label>
			<input id="tab-2" type="radio" name="tab" class="sign-up" /><label for="tab-2" class="tab">注册</label>
			<div class="login-form">
				<div class="sign-in-htm">
					<div class="group">
						<label for="user" class="label">用户名</label>
						<input id="user" type="text" class="input" />
					</div>
					<div class="group">
						<label for="pass" class="label">密码</label>
						<input id="pass" type="password" class="input" data-type="password" />
					</div>
					<div class="group">
						<input id="check" type="checkbox" class="check" checked />
						<label for="check"><span class="icon"></span> 记住密码</label>
					</div>
					<div class="group">
						<input type="submit" class="button" value="登录" />
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<a href="#forgot">忘记密码?</a>
					</div>
				</div>
				<div class="sign-up-htm">
					<div class="group">
						<label for="user" class="label">用户名</label>
						<input id="user" type="text" class="input" />
					</div>
					<div class="group">
						<label for="pass" class="label">密码</label>
						<input id="pass" type="password" class="input" data-type="password" />
					</div>
					<div class="group">
						<label for="pass" class="label">确认密码</label>
						<input id="pass" type="password" class="input" data-type="password" />
					</div>
					<div class="group">
						<label for="pass" class="label">邮箱</label>
						<input id="pass" type="text" class="input" />
					</div>
					<div class="group">
						<input type="submit" class="button" value="注册" />
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<label for="tab-1">已注册登录?</a>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>