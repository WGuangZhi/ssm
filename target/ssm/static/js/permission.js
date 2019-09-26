function permissionUpdate(){
	var name=$('.inputName').value;//jq去掉两端的空字符串
	var icon=$('input[name="icon"]').val().trim();
	var type=$('input[name="type"]').val().trim();
	var sort=$('input[name="sort"]').val().trim();
	var url=$('input[name="url"]').val().trim();
	var judge="false";
	if(!name){
		$('.errorName').html('用户名不能为空！');
		$('.inputName').focus();
	}else if(name.length>20){
		$('.errorName').html('用户名长度不能超过20！');
		$('.inputName').focus();
	}else{
		 console.log(name);
		$('.errorName').html('');
		if(!icon){
			$('.errorIcon').html('图标不能为空！');
			$('input[name="icon"]').focus();
		}else if(icon.length>20){
			$('.errorIcon').html('图标长度不能超过20！');
			$('input[name="icon"]').focus();
		}else{
			 console.log(icon);
			$('.errorIcon').html('');
			if(!type){
				$('.errorType').html('类型不能为空！');
				$('input[name="type"]').focus();
			//}else if(typeof(type)!="number"){//判断是否是一个int类型
			//	$('.errorType').html('类型必须为整型！');
			//	$('input[name="type"]').focus();
			}else if(type.length>3){
				$('.errorType').html('类型长度不超过3！');
				$('input[name="type"]').focus();
			}else{
				 console.log(type);
				$('.errorType').html('');
				if(!sort){
					$('.errorSort').html('排序序号不能为空！');
					$('input[name="sort"]').focus();
				//}else if(typeof(sort)!="number"){//判断是否是一个int类型
				//	$('.errorSort').html('排序序号必须为整型！');
				//	$('input[name="sort"]').focus();
				}else if(sort.length>10){
					$('.errorSort').html('排序序号长度不超过10！');
					$('input[name="sort"]').focus();
				}else{
					 console.log(sort);
					$('.errorSort').html('');
					if(!url){
						$('.errorUrl').html('Url不能为空！');
						$('input[name="url"]').focus();
					}else if(url.length>10){
						$('.errorUrl').html('排序序号长度不超过10！');
						$('input[name="url"]').focus();
					}else{
						console.log(url);
						$('.errorUrl').html('');
						judge="true";
					}
				}
			}
		}
	}
	return judge;
}