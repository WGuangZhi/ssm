package com.hx.rm.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hx.rm.entity.User;

@Controller
@RequestMapping("/userinfo")
public class UserInfoController {
	private SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
	@GetMapping("/upload")
	public String upload() {
		return "userinfo/fileupload";
	}
	
	@PostMapping("/upload")
	@ResponseBody
	public void upload(@RequestParam("file") MultipartFile[] file,String filename,HttpServletRequest req) throws IOException {
		User user=new User();
		user=(User) req.getSession().getAttribute("user");
		List<Map> userInfos=new ArrayList<Map>();
		Map map=null;
		String[] filePath=null;
		for(MultipartFile f:file) {
			map=new HashMap();
			map.put("uid",user.getId());
			String path="E:\\wangguangzhi\\java\\demoFile\\ssm\\images";
			String fname=sdf.format(new Date())+f.getOriginalFilename().substring(f.getOriginalFilename().lastIndexOf("."));
			path+="/"+fname;
			System.out.println(path);
			File newFile=new File(path);
			//FileUtils.copyInputStreamToFile(f.getInputStream(), newFile);
			f.transferTo(newFile);//不管是用spring里面的transfrerTo还是用fileUtils都要导入两个文件上传的包
			map.put("fileurl","upload/images/"+fname);
			userInfos.add(map);
		}
		//return map;
	}
}
