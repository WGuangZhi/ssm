<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
	<meta charset="UTF-8">
	<title>文件上传</title>
	</head>
<body>
<h1>文件上传</h1>
<hr>
<form action="${path}/userinfo/upload" method="post" id="fileupload" enctype="multipart/form-data">
	文件名：<input type="text" name="filename">
	文件：<input type="file" class="file" name="file"><br>
	文件名：<input type="text" name="filename">
	文件：<input type="file" class="file" name="file"><br>
	<input class="fileupload" type="submit" value="上传">
</form>
<script src="${path}/static/js/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$(".fileupload11").on("click",function(){
		var form = new FormData();//创建formData
        //var filename = $("input[name='filename']").val();
		//console.log($("input[name='filename']")[0].value);//获取多值的时候不能使用jq里面的val()方法
		for(var i=0;i<$(".file").length;i++){
        	form.append("file", $(".file")[i].files[i]);//将文件放入formData
		}
		for(var i=0;i<$("input[name='filename']").length;i++){//class不能多值获取
        	form.append("filename",$("input[name='filename']")[i].value);
		}
		$.ajax({
			enctype: "multipart/form-data",//必须
			type:"post",
	        contentType: false,//必须
	        processData: false,//必须
	        dataType: "json",//必须
			data:form,
			url:"${path}/userinfo/upload",
			success:function(data){
				console.log(data);
			},
			error:function(){
				alert("上传异常!");
			}
		})
	})	
})
</script>
</body>
</html>