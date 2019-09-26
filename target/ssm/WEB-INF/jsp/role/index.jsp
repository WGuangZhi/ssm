<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=request.getContextPath();
	request.setAttribute("path", path);
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
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
	<style>
		.pers{
			list-style:none;
		}
	</style>
	<body>
		<!-- 用户列表开始 -->
    <%@ include file="list.jsp" %>
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
    <script src="${path}/static/js/userJs.js" %>"></script>
    <script type="text/javascript">
  //查看
    $(function() { // 当页面载入完毕后执行
        $(".look").on("click", function() {
        var id = $(this).find("input").val(); // 得到设置在input的id值
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/role/getShowMassage/" + id+"?json",//restful风格
                success: function(data){
                	var name = "";
                   for(var i = 0; i < data.role.pers.length; i++){
                        name += data.role.pers[i].name + " | ";
                    }
                   $(".showId").html(data.role.id);
                   $(".showName").html(data.role.name);
                   $(".showDescription").html(data.role.description);
                   $(".showMenu").html(name);
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
                type: "post",
                url: "${pageContext.request.contextPath}/role/getUpdateMassage/" + id+"?json",//restful风格
                success: function(data){
                	var name = "";
                	var roleId="";
                	var roleId2="";
                	for(var i = 0; i < data.pers.length; i++){
                		roleId2+="<li><input type=\"checkbox\" name=\"permission\" value=\""+data.pers[i].id+"\"/>"+data.pers[i].name +"</li>"
                	}
                    for(var i = 0; i < data.role.pers.length; i++){
                    	roleId+= "<li><input type=\"checkbox\" name=\"permission\" checked=\"checked\" value=\""+data.role.pers[i].id+"\"/>"+data.role.pers[i].name +"</li>"
                        name += data.role.pers[i].name + "| ";
                    }
                    if(name == "undefined"){
                        name = "无";
                    }
                    $(".inputId").val(data.role.id);
                    $(".inputName").val(data.role.name);
                    $(".inputDescription").val(data.role.description);
                    $(".inputMenu").html(name);
                    $(".pers").html(roleId+roleId2)
                },
                error: function(err){}
            })
        })
       $('.updateForm').on('click',function(){
    	   //var update=inputvalUpdate();
    	   //var checkedrole=$("input:checkbox[name='role']:checked").length
			var currentPage=$('.currentPage').val();
   	    	var pageNum=$('.pageNum').val();
    	   //if(update=="true"){
    		   $.ajax({
    			   type:"post",
    			   data:$("#updateForm").serialize(),
    			   url:"${pageContext.request.contextPath}/role/updateForm?json",
					success:function(data){
						if(data.message>0){
							alert("修改成功！");
							window.location = "${pageContext.request.contextPath}/role/index?currentPage=" + currentPage+"&pageNum="+pageNum;
						}else{
							alert("修改失败！");
							window.location = "${pageContext.request.contextPath}/role/index?currentPage=" + currentPage+"&pageNum="+pageNum;
						}
					},
					error(){
						alert("请求服务器异常！");
						window.location = "${pageContext.request.contextPath}/role/index?currentPage=" + currentPage+"&pageNum="+pageNum;
					}
    		   })
    	  // }
  		})
    })
    	    
    //增加模块jq
    $(function(){
    	//获取角色列表
    	 $('.addbtn').on('click',function(){
    		 $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/role/getAddMassage?json",
                    success: function(data){
                    	console.log(data.pers);
                    	var roleId="";
                    	for(var i = 0; i < data.pers.length; i++){
                    		if(data.pers[i].name=="商品管理"||data.pers[i].name=="商品列表"){
                    			roleId+="|<input type=\"checkbox\" checked=\"checked\" name=\"permission\" value=\""+data.pers[i].id+"\"/><span>"+data.pers[i].name+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                    		}else{
                    			roleId+="|<input type=\"checkbox\"  name=\"permission\" value=\""+data.pers[i].id+"\"/><span>"+data.pers[i].name+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                    		}
                    		
                    	}
                        $(".pers").html(roleId) 
                    },
                    error: function(err){}
                })
    	 })
    	 //提交
    	 $(".addFrom").on("click",function(){
    		//var panduan=inputval2();
    		//var data = new FormData($("#addForm")[0])
    		//if(panduan=="true"){
    	    	var currentPage=$('.currentPage').val();
    	    	var pageNum=$('.pageNum').val();
    	    	//var pageNum=$('.showEmail').val();
    	    	 $.ajax({
    	    		type:"post",
    	    		url:"${pageContext.request.contextPath}/role/addForm?json",
    	    		data:$("#addForm").serialize(),//将表单的数据打包序列化，一次性传值，提高效率
    	    	    success:function(data){
    	    	    	console.log(data);
    	    	    	//ssm中的jackson已经帮我们把数据转为json数据了，在这里直接用就可以了
    					if(data.message>0){
    						alert("添加成功！");
    						window.location = "${pageContext.request.contextPath}/role/index?currentPage=" + currentPage+"&pageNum="+pageNum
    					}else{
    						alert("添加失败！");
    						window.location = "${pageContext.request.contextPath}/role/index?currentPage=" + currentPage+"&pageNum="+pageNum
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
    		var currentPage=$('.currentPage').val();
    		var pageNum=$('.pageNum').val();
    		console.log(currentPage+","+id+","+pageNum);
    		 $.ajax({
    			type:"post",
    			data:id,
    			url:"${pageContext.request.contextPath}/role/delete/"+id+"?json",//restful风格
    			success:function(data){
    				console.log(data);
    				//var msg=JSON.parse(data).message;//解析json数据
    				if(data.message>0){
    					alert("删除成功！");
    					window.location = "${pageContext.request.contextPath}/role/index?currentPage=" + currentPage+"&pageNum="+pageNum;
    				}else{
    					alert("删除失败！");
    					window.location = "${pageContext.request.contextPath}/role/index?currentPage=" + currentPage+"&pageNum="+pageNum;
    				}
    			},
    			error:function(){
    				alert("服务器异常！");
    				window.location = "${pageContext.request.contextPath}/role/index?currentPage=" + currentPage+"&pageNum="+pageNum;
    			}
    		})		
    	})
    })
    </script>
    </body>
</html>
