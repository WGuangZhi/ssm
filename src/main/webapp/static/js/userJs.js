//判断输入框1
function inputval(){
	var name=$('.showName').val();
	var nickname=$('.showNickname').val();
	var password=$('.showPassword').val();
	var phone=$('.showPhone').val();
	var email=$('.showEmail').val();
	var hImageUrl=$('.showHImageUrl').val();
	var address=$('.showAddress').val();
	var nickname=$('.showNickname').val();
	var description=$('.showDescription').val();
	var judge="false";
	if(!name){
		$('.userName').html('用户名不能为空！');
		$('.showName').focus();
	}else if(name.length>10){
		$('.userName').html('用户名长度不能大于10！！！！');
		$('.showName').focus();
	}else{
		$('.userName').html('');
		if(!nickname){
			$('.userNickname').html("昵称不能为空！")
			$('.showNickname').focus();
		}else if(nickname.length>11){
			$('.userNickname').html('昵称长度不能大于10！！！！');
			$('.showNickname').focus();
		}else{
			$('.userNickname').html("")
			if(!password){
    			$('.userPassword').html("密码不能为空！")
    			$('.showPassword').focus();
    		}else if(nickname.length>16){
    			$('.userPassword').html('密码长度不能大于16！！！！');
    			$('.showPassword').focus();
    		}else{
    			$('.userPassword').html("")
    			var reghone =/^1[345789]\d{9}$/; 
    			//console.log(reghone.test(phone));
    			if(!phone){
	    			$('.userPhone').html("电话号码不能为空！")
	    			$('.showPhone').focus();
	    		}else if(!reghone.test(phone)){
	    			$('.userPhone').html('电话号码格式不正确！');
	    			$('.showPhone').focus();
	    		}else{
	    			var regemail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	    			$('.userPhone').html('');
	    			if(!email){
		    			$('.userEmail').html("邮箱不能为空！")
		    			$('.showEmail').focus();
		    		}else if(!regemail.test(email)){
		    			$('.userEmail').html('邮箱格式不正确！');
		    			$('.showEmail').focus();
		    		}else{
		    			$('.userEmail').html('');
		    			if(!hImageUrl){
		    				$('.userHImageUrl').html("请上传头像！")
		    			}else{
		    				$('.userHImageUrl').html("")
		    			}
		    			var regemail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		    			$('.userPhone').html('');
		    			if(address.length<6){
			    			$('.userAddress').html("地址不能为空或小于6！")
			    			$('.showAddress').focus();
			    		}else if(address.length>50){
			    			$('.userAddress').html('地址长度不能超过50！');
			    			$('.showAddress').focus();
			    		}else{
			    			$('.userAddress').html('');
			    			if(description.length<6){
			    				$('.userDescription').html("对用户的描述不能为空或小于6！")
			    				$('.showDescription').focus();
			    			}else{
			    				$('.userDescription').html("")
			    				var checkedrole=$("input:checkbox[name='role']:checked").length
								if(checkedrole<1){
									$('.userRole').html("至少选择一个角色！")
				    				$("input:checkbox[name='role']").focus();
								}else{
									$('.userRole').html("")
									judge="true";
								}
			    			}
			    		}
		    		}
	    		}
    		}
		}
	}
	return judge;
}
 //添加判断输入框2
function inputval2(){
	var name=$('.inputName').val().trim();//jq去掉两端的空字符串
	var password=$('.inputPassword').val().trim();
	var phone=$('.inputPhone').val().trim();
	var email=$('.inputEmail').val().trim();
	var judge="false";
	if(!name){
		$('.errorName').html('用户名不能为空！');
		$('.inputName').focus();
	}else if(name.length>10){
		$('.errorName').html('用户名长度不能大于10！！！！');
		$('.inputName').focus();
	}else{
		$('.errorName').html('');
		if(!password){
				$('.errorPassword').html("密码不能为空！")
				$('.inputPassword').focus();
			}else if(password.length>16){
				$('.errorPassword').html('密码长度不能大于16！！！！');
				$('.inputPassword').focus();
			}else{
				$('.errorPassword').html("")
				var reghone =/^1[345789]\d{9}$/; 
				if(!phone){
	    			$('.errorPhone').html("电话号码不能为空！")
	    			$('.inputPhone').focus();
	    		}else if(!reghone.test(phone)){
	    			$('.errorPhone').html('电话号码格式不正确！');
	    			$('.inputPhone').focus();
	    		}else{
	    			var regemail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	    			$('.errorPhone').html('');
	    			if(!email){
		    			$('.errorEmail').html("邮箱不能为空！")
		    			$('.inputEmail').focus();
		    		}else if(!regemail.test(email)){
		    			$('.errorEmail').html('邮箱格式不正确！');
		    			$('.inputEmail').focus();
		    		}else{
		    			$('.errorEmail').html('');
			    		var checkedrole=$("input:checkbox[name='role']:checked").length
						if(checkedrole<1){
							$('.errorRole').html("至少选择一个角色！")
				    		$("input:checkbox[name='role']").focus();
						}else{
							$('.errorRole').html("")
							judge="true";
						}
			    	}
		    	}
			}
	}
	return judge;
}

//修改判断输入框2
function inputvalUpdate(){
	var name=$('.inputNameU').val().trim();//jq去掉两端的空字符串
	var password=$('.inputPasswordU').val().trim();
	var phone=$('.inputPhoneU').val().trim();
	var email=$('.inputEmailU').val().trim();
	var judge="false";
	if(!name){
		$('.errorName').html('用户名不能为空！');
		$('.inputNameU').focus();
	}else if(name.length>10){
		$('.errorName').html('用户名长度不能大于10！！！！');
		$('.inputNameU').focus();
	}else{
		$('.errorName').html('');
		if(!password){
				$('.errorPassword').html("密码不能为空！")
				$('.inputPasswordU').focus();
			}else if(password.length>16){
				$('.errorPassword').html('密码长度不能大于16！！！！');
				$('.inputPasswordU').focus();
			}else{
				$('.errorPassword').html("")
				var reghone =/^1[345789]\d{9}$/; 
				if(!phone){
	    			$('.errorPhone').html("电话号码不能为空！")
	    			$('.inputPhoneU').focus();
	    		}else if(!reghone.test(phone)){
	    			$('.errorPhone').html('电话号码格式不正确！');
	    			$('.inputPhoneU').focus();
	    		}else{
	    			var regemail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	    			$('.errorPhone').html('');
	    			if(!email){
		    			$('.errorEmail').html("邮箱不能为空！")
		    			$('.inputEmailU').focus();
		    		}else if(!regemail.test(email)){
		    			$('.errorEmail').html('邮箱格式不正确！');
		    			$('.inputEmailU').focus();
		    		}else{
		    			$('.errorEmail').html('');
			    		var checkedrole=$("input:checkbox[name='role']:checked").length
						if(checkedrole<1){
							$('.errorRole').html("至少选择一个角色！")
				    		$("input:checkbox[name='role']").focus();
						}else{
							$('.errorRole').html("")
							judge="true";
						}
			    	}
		    	}
			}
	}
	return judge;
}