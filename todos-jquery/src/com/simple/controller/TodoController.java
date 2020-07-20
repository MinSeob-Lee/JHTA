package com.simple.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.simple.service.TodoService;
import com.simple.service.UserService;
import com.simple.util.NumberUtil;
import com.simple.vo.Todo;
import com.simple.vo.User;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class TodoController {

	private TodoService todoService = new TodoService();
	private UserService userService = new UserService();
	private JSONView jsonView = new JSONView();
	
	/*
	 * 화면이 리로딩될 때 마다 로그인여부를 조회한다.
	 * 요청방식 : GET
	 * 요청파라미터 : 없음
	 * 응답 :
	 * 		{status:"loginBefore"} 
	 * 		{status:"loginAfter"}
	 */
	@RequestMapping("/home.hta")
	public ModelAndView home(HttpServletRequest req, HttpServletResponse resp) 
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		// 로그인 정보를 조회해서 사용자정보의 존재 여부에 따라서  응답상태를 보낸다.
		HttpSession session = req.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser != null) {
			dataMap.put("status", "loginAfter");
		} else {
			dataMap.put("status", "loginBefore");			
		}
		
		return mav;
	}
	
	/*
	 * 신규회원 가입
	 * 요청방식 : POST
	 * 요청파라미터 : id, name, password, email
	 * 응답 : 
	 * 		{status:"success", username:"홍길동"}
	 * 		{status:"fail", message:"동일한 아이디가 이미 사용중입니다."}
	 */
	@RequestMapping("/register.hta")
	public ModelAndView registerUser(HttpServletRequest req, HttpServletResponse resp)
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		try {
			// 요청파라미터값을 조회한다.
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String pwd = req.getParameter("pwd");
			String email = req.getParameter("email");
			
			// User객체에 사용자정보를 저장한다.
			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setPassword(pwd);
			user.setEmail(email);
			
			// 서비스의 addNewUser(User user)를 호출해서 사용자 정보를 저장한다.
			userService.addNewUser(user);
			
			dataMap.put("status", "success");
		} catch (Exception e) {
			dataMap.put("status", "fail");
		}
		
		return mav;
	}
	
	/*
	 * 요청방식 : POST
	 * 요청파라미터 : id, password
	 * 응답
	 * 		{status:"success", username:"홍길동"}
	 * 		{status:"fail", message:"아이디 혹은 비밀번호가 올바르지 않습니다."}
	 */
	@RequestMapping("/login.hta")
	public ModelAndView loginUser(HttpServletRequest req, HttpServletResponse resp)
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		try {
			// 요청파라미터 값 조회한다.
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			
			User user = userService.getLoginUser(id, pwd);
			
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", user);
			
			dataMap.put("status", "success");
			dataMap.put("username", user.getName());
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("status", "fail");
		}
		
		return mav;
	}
	
	/*
	 * 요청방식 : GET
	 * 요청파라미터 : 없음
	 * 응답
	 * 		{status:"success"}
	 */
	@RequestMapping("/logout.hta")
	public ModelAndView logoutUser(HttpServletRequest req, HttpServletResponse resp)
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		// 세션을 무효화 시킨다.
		HttpSession session = req.getSession();
		session.invalidate();
		
		dataMap.put("status", "success");
		
		return mav;
	}
	
	/*
	 * 요청방식 : GET
	 * 요청파라미터 : 없음
	 * 응답
	 * 		{status:"success", todos:[{no:1,title:"장보기"....},{},{}]}
	 */
	@RequestMapping("/mytodos.hta")
	public ModelAndView myTodos(HttpServletRequest req, HttpServletResponse resp)
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		HttpSession session = req.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			dataMap.put("status", "fail");
		} else {
			List<Todo> todos = todoService.getMyTodos(loginUser.getId());
			dataMap.put("status", "success");
			dataMap.put("todos", todos);
		}
		
		return mav;
	}
	
	/*
	 * 요청방식 : GET
	 * 요청파라미터 : todoNo
	 * 응답
	 * 		{status:"success", todo:{no:1, title:"장보기", ...}}
	 */
	@RequestMapping("/todo.hta")
	public ModelAndView todoDetail(HttpServletRequest req, HttpServletResponse  resp)
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		int todoNo = NumberUtil.stringToInt(req.getParameter("todoNo"));
		Todo todo = todoService.getTodoDetail(todoNo);
		
		dataMap.put("status", "success");
		dataMap.put("todo", todo);
		
		return mav;
	}
	
	/*
	 * 요청방식 : POST
	 * 요청파라미터 : title, content, day
	 * 응답
	 * 		{status:"success", todo:{no:1, title:"장보기", ...}}
	 */
	@RequestMapping("/addtodo.hta")
	public ModelAndView addTodo(HttpServletRequest req, HttpServletResponse  resp) 
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap);
		
		// 요청처리
		
		return mav;
	}
	
	/*
	 * 요청방식 : POST
	 * 요청파라미터 : no, title, content, day, status
	 * 응답
	 * 		{status:"success", todo:{no:1, title:"장보기", ...}}
	 */
	@RequestMapping("/modifytodo.hta")
	public ModelAndView modifyTodo(HttpServletRequest re, HttpServletResponse resp)
		throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		ModelAndView mav = new ModelAndView();
		mav.setView(jsonView);
		mav.addAttribute("data", dataMap); 
		
		// 요청처리
		
		return mav;
	}
}










