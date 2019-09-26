<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setAttribute("path",request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录</title>
</head>
<body>
<form action="${path}/login/loginForm" method="post" id="login-form">
	用户名：<input name="userName" type="text"><br/>
	密码：<input type="password" name="password"><br/>
	<input class="login-btn" type="button" value="提交">
</form>
<script src="https://cdn.bootcss.com/jquery/1.8.1/jquery.js"></script>
<script src="${path}/static/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$(".login-btn").on("click",function(){
			$.ajax({
				type:"post",
				url:"${pageContext.request.getContextPath()}/login/loginForm",
				data:$("#login-form").serialize(),
				success:function(data){
					if("message" in data){
						window.location="${path}/permission/index";
					}else{
						alert(data.e.message);
					}
				},
				error:function(){
					alert("提交异常！");
				}
			})
		})
	})
</script>
</body>
</html>