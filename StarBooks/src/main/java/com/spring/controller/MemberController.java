package com.spring.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.member.MemberDTO;
import com.spring.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired private MemberService ms;
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public ModelAndView join(MemberDTO dto) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		int row = ms.insertMember(dto);
		if(row == 1) {
		mav.setViewName("access");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("msg","회원 가입 성공! 로그인 해주세요.");
		map.put("href", "/member/login");
		mav.addObject("map", map);
		return mav;	
		}
		mav.setViewName("alert");
		mav.addObject("msg", "회원가입 실패했습니다. 잠시 후 다시 이용해주세요.");
		return mav;
	}
	
	@PostMapping(value="/join/idCheck", consumes = "application/json; charset=utf-8", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String idCheck(@RequestBody HashMap<String, String> map) {
		System.out.println("map : " + map);
		
		boolean flag = ms.idCheck(map.get("id"));
		System.out.println(flag);
		return flag ? "사용가능한 id 입니다." : "이미 사용중인 id 입니다.";
	}
	
	@PostMapping(value="/join/emailCheck", consumes = "application/json; charset=utf-8", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String emailCheck(@RequestBody HashMap<String, String> map) {
		System.out.println("map : " + map);
		
		boolean flag = ms.emailCheck(map.get("email"));
		System.out.println(flag);
		return flag ? "사용가능한 email 입니다." : "이미 사용중인 email 입니다.";
	}
	
	@GetMapping("/login")
	public ModelAndView login(@CookieValue(value="cookieId", required = false) String userid){
		ModelAndView mav = new ModelAndView("member/login");
		if(userid != null) {			// 저장된 쿠키값이 있으면 불러오기
			System.out.println(userid);
			mav.addObject("cookieId", userid);
		}
		return mav;
	}
	
//	@PostMapping("/login")
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(MemberDTO dto,HttpSession session, HttpServletResponse response, HttpServletRequest request, String url) throws NoSuchAlgorithmException, IOException{
		System.out.println("login : " + url);
		String viewName = "redirect:";
		viewName += url == null ? "/" : url;
		
		
		ModelAndView mav = new ModelAndView();
		MemberDTO login = ms.loginMember(dto);
		if(login != null) {
			session.setAttribute("login", login);
			session.setMaxInactiveInterval(60*60*3);

			if(dto.getIsCookie() == 'y' ) {			// id저장 체크 - 쿠키생성
				Cookie cookie = new Cookie("cookieId", dto.getUser_id());
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 3); 		// 3일
				response.addCookie(cookie);
			}else {												// id저장 체크 해제 - 쿠키 삭제
				Cookie cookie = new Cookie("cookieId", null);
				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			mav.setViewName(viewName);
			
			return mav;
		}
		mav.setViewName("alert");
		mav.addObject("msg", "id나 비밀번호가 틀렸습니다.");
		return mav;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/modify")
	public ModelAndView modify(HttpSession session) {
		ModelAndView mav = new ModelAndView("member/modify");
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		mav.addObject("dto", dto);
		return mav;
	}

	@PostMapping(value="/modify/pwCheck", consumes = "application/json; charset=utf-8", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String pwCheck(@RequestBody HashMap<String, String> map) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		System.out.println("map : " + map);
		
		boolean flag = ms.pwCheck(map.get("oldpw"), map.get("id"));
		System.out.println(flag);
		return flag ? "OK" : "현재 비밀번호와 일치하지 않습니다.";
	}
	
	@PostMapping("/modify")
	public ModelAndView modify(MemberDTO  dto, HttpSession session) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		System.out.println("modify : " + dto.getUser_id());
		ModelAndView mav = new ModelAndView();
		int row = ms.changePW(dto);
		if(row == 1) {
		session.invalidate();
		mav.setViewName("access");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("msg","비밀번호 변경! 다시 로그인 해주세요.");
		map.put("href", "/member/login");
		mav.addObject("map", map);
		return mav;	
		}
		mav.setViewName("alert");
		mav.addObject("msg", "회원가입 실패했습니다. 잠시 후 다시 이용해주세요.");
		return mav;
	}
	
	@PutMapping(value="/modify/{id}")
	@ResponseBody
	public String chkUpdate(@PathVariable String id, Integer eventChk, Integer otherChk, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");				
		System.out.println(id + ", " + eventChk + ", " + otherChk);
		int row = ms.chkUpdate(dto, id, eventChk, otherChk);
		return row + "";
	}
	
//	@RequestMapping(value="/delete/{id}", method = RequestMethod.DELETE)
	@DeleteMapping("/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id, HttpSession session) {
		System.out.println("delete_member : " + id);
		int row = 0;
		boolean flag = ms.insertDeleteMem(id);
		if(flag) {
			session.invalidate();
			row = ms.delete(id);
		}
		return row+"";
	}
	
	@GetMapping("/findid")
	public void findid() {}
	
	
//	@PostMapping("/findid")
	@RequestMapping(value="/findid", method = RequestMethod.POST)
	public ModelAndView findid(HttpServletRequest request, MemberDTO dto) {
			
		ModelAndView mav = new ModelAndView("member/findid");
		StringBuffer format = new StringBuffer();
		String id = ms.findId(dto);
		
		if(id == null) {
			mav.addObject("msg", null);
			return mav;
		}
		
		// 메일 발송 관련 코드  
		boolean sendEmailFlag = ms.sendEmail(dto.getUser_email(),"ID", id);
		if(sendEmailFlag){}
		else{
			mav.addObject("alert", "일시적인 오류로 메일을 발송할 수 없습니다.");
		}
		
		
		// jsp 화면 띄우기
		format.append(id);
		String star="";
		for(int i=2; i < format.length()-2; i++)star+="*";
		format = format.replace(2, format.length()-2, star);
		String msg =String.format("당신의 ID는 [%s] 입니다",  format.toString());
		System.out.println(msg);
		mav.addObject("msg", msg);
		return mav;
	}
	
	@GetMapping("/newpw")
	public void newpw() {}
	
	@PostMapping("/newpw")
	public ModelAndView newpw(MemberDTO dto) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView("member/newpw");
		String newPw = ms.reNewPw(dto);
		
		// 메일 발송 관련 코드 
		boolean sendEmailFlag = ms.sendEmail(dto.getUser_email(),"비밀번호", newPw);
		if(sendEmailFlag){}
		else{
			mav.addObject("alert", "일시적인 오류로 메일을 발송할 수 없습니다.");
		}
		
		mav.addObject("newPw", newPw);
		return mav;
	}
	
	@GetMapping("/mystar")
	public void mystar() {}
	

}


