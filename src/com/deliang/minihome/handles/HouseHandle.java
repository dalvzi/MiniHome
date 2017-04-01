package com.deliang.minihome.handles;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.deliang.minihome.entities.House;
import com.deliang.minihome.entities.Question;
import com.deliang.minihome.entities.Reply;
import com.deliang.minihome.entities.User;
import com.deliang.minihome.service.HouseService;
import com.deliang.minihome.service.QuestionService;
import com.deliang.minihome.service.ReplyService;

@Controller
public class HouseHandle {

	@Autowired
	private HouseService houseService;
	
	@Autowired 
	private QuestionService questionService;
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("serachWithParam")
	public String serachWithParam(
			@RequestParam(value="location", required=false, defaultValue="") String location,
			@RequestParam(value="minSize", required=false, defaultValue="0") double minSize,
			@RequestParam(value="maxSize", required=false, defaultValue="9999999999") double maxSize,
			@RequestParam(value="minPrice", required=false, defaultValue="0") double minPrice,
			@RequestParam(value="maxPrice", required=false, defaultValue="9999999999") double maxPrice,
			Map<String, Object> map) {

		List<House> criteriaHouses = houseService.getCriteriaHouse(location,
				minSize, maxSize, minPrice, maxPrice);

		map.put("criteriaHouses", criteriaHouses);
		return "serachWithResultPage";
	}
	
	@RequestMapping("serach")
	public String serach() {
		return "serachPage";
	}
	
	@RequestMapping("item/{id}")
	public String item(
			@PathVariable("id") Integer id,
			Map<String, Object> map,
			HttpSession session) {
		
		House house = houseService.getHouseById(id);
		map.put("house", house);
		
		Map<Question, List<Reply>> questionWithReply = new HashMap<Question, List<Reply>>();
		List<Question> questions = questionService.getList(house);
		
		for(Question question : questions) {
			List<Reply> list = replyService.getList(question);
			questionWithReply.put(question, list);
		}
		map.put("questionWithReply", questionWithReply);
		session.setAttribute("house", house);
		
		return "itemPage";
	}
	
	@RequestMapping(value="saveHouse", method=RequestMethod.POST)
	public String saveHouse(
			@RequestParam("location") String location,
			@RequestParam("layout") String layout,
			@RequestParam("price") double price,
			@RequestParam("size") double size,
			@RequestParam("floor") byte floor,
			@RequestParam("houseDesc") String houseDesc,
			@RequestParam("imgPath") MultipartFile file,
			HttpServletRequest request
			) throws IllegalStateException, IOException {
		
		Date createTime = new Date();
		
		String filePathRoot = "E:/upload/";
		String filePath = "/upload/";
        String fileName = file.getOriginalFilename();  
        //对文件改名
        fileName = UUID.randomUUID().toString() + "_" + fileName;
        System.out.println(filePathRoot);
        File targetFile = new File(filePathRoot + fileName);  
        System.out.println(targetFile);
        String testUpload = filePath + fileName;
        //保存  
        try {  
            file.transferTo(targetFile);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
//      model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);  
  
		User user = (User) request.getSession().getAttribute("user");
		House house = new House(location, layout, price, size, floor, houseDesc,
				testUpload, createTime, (byte) 1, user);
		houseService.save(house);
		return "redirect:/zufang";
	}
	
	/**
	 * 跳转: 到注册房源界面
	 * @return
	 */
	@RequestMapping("registerHouse")
	public String registerHouse() {
		return "registerHouse";
	}
	
	/**
	 * 跳转: 携带分页信息, 到租房页面
	 * @return
	 */
	@RequestMapping("zufang")
	public String rentHouse(
			@RequestParam(value="pageNo", required=false, defaultValue="1") String pageNoStr,
			Map<String, Object> map) {
		
		int pageNo = 1;
		try {
			//对 pageNo 的校验
			pageNo = Integer.parseInt(pageNoStr);
			if(pageNo < 1){
				pageNo = 1;
			}
		} catch (Exception e) { }
		
		Page<House> page = houseService.getPage(pageNo, 10);
		map.put("page", page);
		
		return "zufangPage";
	}
	
	@RequestMapping("upload")
	public String upload(@RequestParam("desc") String desc,
			@RequestParam("file") MultipartFile file) {
		
		String path="e:/upload/"+new Date().getTime()+file.getOriginalFilename();
        
        File newFile=new File(path);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        try {
			file.transferTo(newFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(file.getSize());
		System.out.println("desc" + desc);
		return "redirect:/zufang";
	}
	
}
