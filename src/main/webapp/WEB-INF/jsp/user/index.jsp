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
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="https://cdn.bootcss.com/bootstrap-sweetalert/1.0.1/sweetalert.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/Ionicons/css/ionicons.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/plugins/css/AdminLTE.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/plugins/css/skins/skin-blue.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>
</head>
<style>
.modal-body li{
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
    <script src="${path}/static/css/plugins/js/adminlte.js"></script>
    <script src="${path}/static/js/userJs.js" %>"></script>
    <script type="text/javascript">
  //查看
    $(function() { // 当页面载入完毕后执行
        $(".look").on("click", function() {
        var id = $(this).find("input").val(); // 得到设置在input的id值
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/user/getShowMassage/" + id+"?json",//restful风格
                success: function(data){
                	var name = "";
                    for(var i = 0; i < data.roles.length; i++){
                        name += data.roles[i].description + " , ";
                    }
                    if (name.length > 0) {
                        name = name.substr(0, name.length - 3);
                    }
                    if(name == "undefined"){
                        name = "无";
                    }
                    $(".showId").html(data.id);
                    $(".showName").html(data.userName);
                    $(".showMenu").html(name);
                    $(".showPhone").html(data.phone);
                    $(".showEmail").html(data.email);
                },
                error: function(err){}
            })
        })
    })
    	    
    //修改
    $(function() { // 当页面载入完毕后执行
        $(".update").on("click", function() {
        var id = $(this).find("input").val(); // 得到设置在input的id值
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/user/getUpdateMassage/" + id+"?json",//restful风格
                success: function(data){
                	var name = "";
                	var roleId="";
                	var roleId2="";
                	for(var i = 0; i < data.roles2.length; i++){
                		roleId2+="<li>"+data.roles2[i].description +"<input type=\"checkbox\" name=\"role\" value=\""+data.roles2[i].id+"\"/></li>"
                	}
                    for(var i = 0; i < data.user.roles.length; i++){
                    	roleId+= "<li>"+data.user.roles[i].description +"<input type=\"checkbox\" name=\"role\" checked=\"checked\" value=\""+data.user.roles[i].id+"\"/></li>"
                        name += data.user.roles[i].description + " , ";
                    }
                    if(name == "undefined"){
                        name = "无";
                    }
                    $(".inputIdU").val(data.user.id);
                    $(".inputNameU").val(data.user.userName);
                    $(".inputPasswordU").val(data.user.password);
                    $(".inputPhoneU").val(data.user.phone);
                    $(".inputEmailU").val(data.user.email);
                    $(".showMenu").html(name);
                    $(".roles").html(roleId+roleId2)
                },
                error: function(err){}
            })
        })
       $('.updateForm').on('click',function(){
    	   var update=inputvalUpdate();
    	   //var checkedrole=$("input:checkbox[name='role']:checked").length
			var currentPage=$('.currentPage').val();
   	    	var pageNum=$('.pageNum').val();
    	   if(update=="true"){
    	   console.log(currentPage+","+pageNum+","+update);
    		   $.ajax({
    			   type:"post",
    			   data:$("#updateForm").serialize(),
    			   url:"${pageContext.request.contextPath}/user/updateForm?json",
					success:function(data){
						if(data.message>0){
							alert("修改成功！");
							window.location = "${pageContext.request.contextPath}/user/index?currentPage=" + currentPage+"&pageNum="+pageNum;
						}else{
							alert("修改失败！");
							window.location = "${pageContext.request.contextPath}/user/index?currentPage=" + currentPage+"&pageNum="+pageNum;
						}
					},
					error(){
						alert("服务器异常！");
						window.location = "${pageContext.request.contextPath}/user/index?currentPage=" + currentPage+"&pageNum="+pageNum;
					}
    		   })
    	   }
  		})
    })
    	    
    //增加模块jq
    $(function(){
    	//获取角色列表
    	 $('.addbtn').on('click',function(){
    		 $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/user/getAddMassage?json",//restful风格
                    success: function(data){
                    	var roleId="";
                    	for(var i = 0; i < data.length; i++){
                    		if(data[i].name=="user"){
                    			roleId+="|<input type=\"checkbox\" checked=\"checked\" name=\"role\" value=\""+data[i].id+"\"/><span>"+data[i].description+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                    		}else{
                    			roleId+="|<input type=\"checkbox\"  name=\"role\" value=\""+data[i].id+"\"/><span>"+data[i].description+"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                    		}
                    		
                    	}
                        $(".roles").html(roleId) 
                    },
                    error: function(err){}
                })
    	 })
    	 //提交
    	 $(".addSubmit").on("click",function(){
    		var panduan=inputval2();
    		//var data = new FormData($("#addForm")[0])
    		if(panduan=="true"){
    	    	var currentPage=$('.currentPage').val();
    	    	var pageNum=$('.pageNum').val();
    	    	//var pageNum=$('.showEmail').val();
    	    	 $.ajax({
    	    		type:"post",
    	    		url:"${pageContext.request.contextPath}/user/addForm?json",
    	    		data:$("#addForm").serialize(),//将表单的数据打包序列化，一次性传值，提高效率
    	    	    success:function(data){
    	    	    	//console.log(data);
    	    	    	//ssm中的jackson已经帮我们把数据转为json数据了，在这里直接用就可以了
    					if(data.message>0){
    						alert("添加成功！");
    						window.location = "${pageContext.request.contextPath}/user/index?currentPage=" + currentPage+"&pageNum="+pageNum
    					}else{
    						alert("添加失败！");
    						window.location = "${pageContext.request.contextPath}/user/index?currentPage=" + currentPage+"&pageNum="+pageNum
    					}	    	    	    	
    	    	    },
    	    	    error:function(){ alert("服务器异常")  }
    	    	}) 
    		}
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
    			url:"${pageContext.request.contextPath}/user/delete/"+id+"?json",//restful风格
    			success:function(data){
    				//console.log(data);
    				//var msg=JSON.parse(data).message;//解析json数据
    				if(data.message>0){
    					alert("删除成功！");
    					window.location = "${pageContext.request.contextPath}/user/index?currentPage=" + currentPage+"&pageNum="+pageNum;
    				}else{
    					alert("删除失败！");
    					window.location = "${pageContext.request.contextPath}/user/index?currentPage=" + currentPage+"&pageNum="+pageNum;
    				}
    			},
    			error:function(){
    				alert("服务器异常！");
    				window.location = "${pageContext.request.contextPath}/user/index?currentPage=" + currentPage+"&pageNum="+pageNum;
    			}
    		})		
    	})
    })
    </script>
</body>
</html>