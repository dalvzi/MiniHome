package com.deliang.minihome.handles;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		System.out.println("jjjj");
		return "redirect:/zufang";
	}
	
	/**
	 * 注册: user入库,并保存到session
	 * @param user
	 * @return 跳转到租房页面
	 */
	@RequestMapping("saveUser")
	public String register(User user, HttpSession session){
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

		User user = userService.get(username, password);
		if(user != null &&username.equals(user.getUsername()) && password.equals(user.getPassword())) {
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
