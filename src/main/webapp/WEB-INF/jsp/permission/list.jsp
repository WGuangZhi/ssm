<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=request.getContextPath();
	request.setAttribute("path", path);
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>权限管理</title>
		<!-- 自适应设置 -->
  		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<!-- Tell the browser to be responsive to screen width -->
	  	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	  	<link rel="stylesheet" href="${path}/static/css/bootstrap/css/bootstrap.min.css">
	  	<!-- Font Awesome -->
	  	<link rel="stylesheet" href="${path}/static/css/font-awesome/css/font-awesome.min.css">
	  	<!-- Ionicons -->
	  	<link rel="stylesheet" href="${path}/static/css/Ionicons/css/ionicons.min.css">
	  	<!-- Theme style -->
	  	<link rel="stylesheet" href="${path}/static/css/plugins/css/AdminLTE.css">
	  	<link rel="stylesheet" href="${path}/static/css/plugins/css/skins/skin-blue.min.css">
	  	<link rel="stylesheet" type="text/css" href="${path}/static/css/zTreeStyle/zTreeStyle.css">
  		<!-- Google Font -->
  		<link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	</head>
	<body>
		<!-- 用户列表开始 -->
    <%@ include file="table.jsp" %>
    <!-- 用户列表结束 -->
    
	<!-- 添加用户开始 -->
	<%@ include file="add.jsp" %>
	<!-- 添加用户结束 -->
    
	<!-- 查看用户用户开始 -->
	<%@ include file="show.jsp" %>
	<!-- 查看用户结束 -->
	
	<!-- 修改用户开始 -->
	<%@ include file="update.jsp" %>
	<!--修改用户结束  -->
	
	<script src="${path}/static/js/jquery.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-sweetalert/1.0.1/sweetalert.js"></script>
    <script src="${path}/static/css/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${path}/static/js/jquery.ztree.all.min.js"></script>
    <script src="${path}/static/css/plugins/js/adminlte.js"></script>
    <script src="${path}/static/js/permission.js" %>"></script>
    <script type="text/javascript">
  //查看
    $(function() { // 当页面载入完毕后执行
        $(".look").on("click", function() {
        var id = $(this).find("input").val(); // 得到设置在input的id值
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/permission/show/" + id,//restful风格
                success: function(data){
                	//console.log(data);
                    $(".inputName").html(data.per.name);
                    $(".inputIcon").html(data.per.icon);
                    $(".inputType").html(data.per.type);
                    $(".inputSort").html(data.per.sort);
                    $(".inputUrl").html(data.per.url);
                    $(".inputParent").html(data.per.parentId);
                },
                error: function(err){
                	alert("请求异常！")
                }
            })
        })
    })
    	    
    //修改
    $(function() { // 当页面载入完毕后执行
        $(".update").on("click", function() {
        var id = $(this).find("input").val(); // 得到设置在input的id值
        $.ajax({
                type: "get",
                url: "${pageContext.request.contextPath}/permission/update/" + id,//restful风格
                success: function(data){
                	//console.log(data);
                    $(".inputId").val(data.per.id);
                    $(".inputName").val(data.per.name);
                    $(".inputIcon").val(data.per.icon);
                    $(".inputType").val(data.per.type);
                    $(".inputSort").val(data.per.sort);
                    $(".inputUrl").val(data.per.url);
                	//console.log(data.per.parentId);
                	//构造html
                	var html="";
                	for(var i=0;i<data.pers.length;i++){
                		if(data.pers[i].id==data.per.parentId){
                			html+='<input type="radio" checked=\"checked\" name="parentId" value="'+data.pers[i].id+'">'+data.pers[i].name;
                		}else{
	                		html+='<input type="radio" name="parentId" value="'+data.pers[i].id+'">'+data.pers[i].name;
                		}
                	}
                	$(".pers").html(html);
                },
                error: function(err){}
            })
        })
       $('.updateForm').on('click',function(){
    	   //var update=permissionUpdate();
    	   //var checkedrole=$("input:checkbox[name='role']:checked").length
			var currentPage=$('input[name="currentPage"]').val();
   	    	var pageNum=$('input[name="pageNum"]').val();
   	    	//console.log(update);
    	   //if(update=="true"){
    		    $.ajax({
    			   type:"post",
    			   data:$("#updateForm").serialize(),
    			   url:"${pageContext.request.contextPath}/permission/update",
					success:function(data){
						if(data.message>0){
							alert("修改成功！");
							window.location = "${pageContext.request.contextPath}/permission/list?pageNum=" + currentPage+"&pageSize="+pageNum;
						}else{
							alert("修改失败！");
							window.location = "${pageContext.request.contextPath}/permission/list?pageNum=" + currentPage+"&pageSize="+pageNum;
						}
					},
					error(){
						alert("请求服务器异常！");
						window.location = "${pageContext.request.contextPath}/permission/list?pageNum=" + currentPage+"&pageSize="+pageNum;
					}
    		   })
    		   //alert("格式正确！")
    	  // }
  		})
    })
    	    
    //增加模块jq
    $(function(){
    	//获取角色列表
    	 $('.addbtn').on('click',function(){
    		 $.ajax({
                    type: "get",
                    url: "${pageContext.request.contextPath}/permission/add?json",
                    success: function(data){
                    	//console.log(data.parentPers);
                    	var html="";
                    	for(var i = 0; i < data.parentPers.length; i++){
                    		if(data.parentPers[i].id==1){
                    			html+="<input type=\"radio\" checked=\"checked\" name=\"parentId\" value=\""+data.parentPers[i].id+"\"/><span>"+data.parentPers[i].name+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                    		}else{
                    			html+="<input type=\"radio\"  name=\"parentId\" value=\""+data.parentPers[i].id+"\"/><span>"+data.parentPers[i].name+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                    		}
                    		
                    	} 
                        $(".pers").html(html) 
                    },
                    error: function(err){}
                })
    	 })
    	 //提交
    	 $(".addFrom").on("click",function(){
    		//var panduan=inputval2();
    		//var data = new FormData($("#addForm")[0])
    		//if(panduan=="true"){
    	    	var currentPage=$('input[name="currentPage"]').val();
   	    	var pageNum=$('input[name="pageNum"]').val();
    	    	//var pageNum=$('.showEmail').val();
    	    	 $.ajax({
    	    		type:"post",
    	    		url:"${pageContext.request.contextPath}/permission/add",
    	    		data:$("#addForm").serialize(),//将表单的数据打包序列化，一次性传值，提高效率
    	    	    success:function(data){
    	    	    	//console.log(data);
    	    	    	//ssm中的jackson已经帮我们把数据转为json数据了，在这里直接用就可以了
    					if(data.message>0){
    						alert("添加成功！");
    						window.location = "${pageContext.request.contextPath}/permission/list?pageNum=" + currentPage+"&pageSize="+pageNum
    					}else{
    						alert("添加失败！");
    						window.location = "${pageContext.request.contextPath}/permission/list?pageNum=" + currentPage+"&pageSize="+pageNum
    					}	    	    	    	
    	    	    },
    	    	    error:function(){ alert("服务器异常")  }
    	    	}) 
    		//}
    	 })
    })
    //增加模块结束
    	    
    //删除
    $(function(){
    	$(".delete").on("click",function(){
    		var id=$(this).attr("value");//jq获取标签属性值
    		var currentPage=$('input[name="currentPage"]').val();
   	    	var pageNum=$('input[name="pageNum"]').val();
    		console.log(currentPage+","+id+","+pageNum);
    		 $.ajax({
    			type:"get",
    			data:id,
    			url:"${pageContext.request.contextPath}/permission/delete/"+id+"?json",//restful风格
    			success:function(data){
    				console.log(data);
    				if(data.message>0){
    					alert("删除成功！");
    					window.location = "${pageContext.request.contextPath}/permission/list?pageNum=" + currentPage+"&pageSize="+pageNum;
    				}else{
    					alert("删除失败！");
    					window.location = "${pageContext.request.contextPath}/permission/list?pageNum=" + currentPage+"&pageSize="+pageNum;
    				}
    			},
    			error:function(){
    				alert("服务器异常！");
    				window.location = "${pageContext.request.contextPath}/permission/list?pageNum=" + currentPage+"&pageSize="+pageNum;
    			}
    		})		
    	})
    })
    </script>
    </body>
</html>