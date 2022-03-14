package com.spring.exception;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice				// 전역에서 발생하는 예외에 대해서 처리
public class ExceptionController {
	
	@ExceptionHandler(NoSuchAlgorithmException.class)
	public ModelAndView nsa(NoSuchAlgorithmException e) {
		e.printStackTrace();
		ModelAndView mav = new ModelAndView("alert");
		mav.addObject("msg", "nas-해당 정보가 없습니다.");
		return mav;
	}
	
	@ExceptionHandler(UnsupportedEncodingException.class)
	public ModelAndView usee() {
		ModelAndView mav = new ModelAndView("alert");
		mav.addObject("msg", "usee-해당 정보가 없습니다.");
		return mav;
	}
	
	@ExceptionHandler(NullPointerException.class)
	public ModelAndView npe(NullPointerException e) {
		ModelAndView mav = new ModelAndView("alert");
		mav.addObject("msg", "해당 정보가 없습니다.");
		return mav;
	}

	@ExceptionHandler(EmptyResultDataAccessException.class)
	public ModelAndView notfound() {
		ModelAndView mav = new ModelAndView("alert");
		mav.addObject("msg", "id나 비밀번호가 일치하지 않습니다.");
		return mav;
	}
	
	@ExceptionHandler(DataIntegrityViolationException.class)
	public ModelAndView dive(DataAccessException e) {
		e.printStackTrace();
		ModelAndView mav = new ModelAndView("alert");
		mav.addObject("msg", "회원 가입 실패, 잠시후 다시 시도해주세요.");
		return mav;
	}
	
}
