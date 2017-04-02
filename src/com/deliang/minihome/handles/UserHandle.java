package com.deliang.minihome.handles;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.deliang.minihome.entities.House;
import com.deliang.minihome.entities.User;
import com.deliang.minihome.service.HouseService;
import com.deliang.minihome.service.UserService;

@Controller
public class UserHandle {

	@Autowired
	private UserService userService;
	
	@Autowired
	private HouseService houseService;
	
	public User resetSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		User user2 = userService.get(user.getId());
		session.removeAttribute("user");
		session.setAttribute("user", user2);
		return user2;
	}
	
	@RequestMapping(value="saveHeadImg", method=RequestMethod.POST)
	public String updateHeadImg(
			@RequestParam("file") MultipartFile file,
			@RequestParam("id") Integer id,
			HttpServletRequest request) {
		
		String filePathRoot = "E:/upload/";
		String filePath = "/upload/";
		String headImgPathToDataBase = filePath + file.getOriginalFilename();
		System.out.println("------------"+headImgPathToDataBase);
		String headImgPathToHardDisk = filePathRoot + file.getOriginalFilename();
		
		User user = userService.get(id);
		user.setHeadImgPath(headImgPathToDataBase);
		userService.save(user);
		resetSession(request);
		try {
			file.transferTo(new File(headImgPathToHardDisk));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:userCenter";
	}
	
	@RequestMapping(value="updateUserWithParam/{id}", method=RequestMethod.PUT)
	public String updateUserWithParam(User user) {
		userService.save(user);
		return "redirect:/userCenter";
	}
	
	@RequestMapping(value="updateUser/{id}", method=RequestMethod.GET)
	public String updateUser(
			@PathVariable("id") Integer id,
			Map<String, Object> map) {
		
		User user = userService.get(id);
		map.put("user", user);
		return "register";
	}
	
	@RequestMapping("userCenter")
	public String userCenter(
			HttpServletRequest request,
			Map<String, Object> map) {
		
		User user = (User) request.getSession().getAttribute("user");
		List<House> houses = houseService.getHousesByUserId(user);
		
		map.put("houses", houses);
		
		return "userCenterPage";
	}
	
	/**
	 * 用户注销
	 * @param request
	 * @return 跳到租房页面
	 */
	@RequestMapping("logout")
	public String logou(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		return "redirect:/zufang";
	}
	
	/**
	 * 注册: user入库,并保存到session
	 * @param user
	 * @return 跳转到租房页面
	 */
	@RequestMapping("saveUser")
	public String register(User user, HttpSession session){
		user.setHeadImgPath("/upload/baseHead.jpg");
		userService.save(user);
		session.setAttribute("user", user);
		return "redirect:/zufang";
	}
	
	/**
	 * 注册: ajax验证用户名是否存在
	 * @param username
	 * @return 不存在返回"0",存在返回用户名
	 */
	@ResponseBody
	@RequestMapping(value="validateRegisterUsername", produces="text/html;charset=UTF-8")
	public String validate(@RequestParam("username") String username) {
		User user = userService.get(username);
		System.out.println(user);
		if(user == null) {
			return "0";
		}
		return user.getUsername();
	}
	
	/**
	 * 登录: ajax验证用户名和密码匹配
	 * @param username
	 * @param password
	 * @return 成功跳转到租房首页,失败
	 */
	@ResponseBody
	@RequestMapping(value="validate", method=RequestMethod.POST)
	public String validateLogin(@RequestParam(value="username") String username,
			@RequestParam(value="password") String password, HttpSession session) {
		
		System.out.println("进行到了");

		User user = userService.get(username, password);
		if(user != null && username.equals(user.getUsername()) && password.equals(user.getPassword())) {
			//session
			session.setAttribute("user", user);
			return "success";
		}else
		return "error";
	}
	
	/**
	 * 登录: 跳转到登录页面
	 */
	@RequestMapping(value="login")
	public String login() {
		return "login";
	}
	
	/**
	 * 注册: 跳转到注册页面
	 * @param map
	 * @return
	 */
	@RequestMapping("register")
	public String register(Map<String, Object> map) {
		map.put("user", new User());
		return "register";
	}
	
}
