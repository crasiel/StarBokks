package com.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.book.BookDTO;
import com.spring.book.Paging;
import com.spring.book.StarBookDTO;
import com.spring.service.BookService;
import com.spring.service.StarBooksService;

@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired private StarBooksService sbs;
	@Autowired private BookService bs;
	
	@GetMapping("/list")
	public void list() {}
	
	@GetMapping("/category/{num}")					//굳이 @RequestParam String str 로 사용안해도 될듯 싶은데....
	public ModelAndView category(@PathVariable int num, String str, Integer start, int type) {
		
		ModelAndView mav = new ModelAndView();
		if(start == null || start == 0) start = 1;
		List<BookDTO> dto = bs.bookList(str, num, start);					// category -> 전체
		List<BookDTO> cdto = bs.bookListC(str, num, start);				// category -> 베스트셀러
		List<BookDTO> ndto = bs.bookListNew(str, num, start);		// category -> 신간
		
		mav.setViewName("books/category");
		
		mav.addObject("category", str);
		
		if(dto != null) {
			mav.addObject("list",dto);		// 검색 결과
			int page = dto.get(0).getCount()/20;
			Paging paging = new Paging(start,  dto.get(0).getCount());
			mav.addObject("paging", paging);
			mav.addObject("count", dto.get(0).getCount());		// 검색 결과 수
		}
		
		if(cdto != null) {			
			mav.addObject("clist", cdto);		// 검색 결과
			int page = cdto.get(0).getCount()/20;
			Paging paging = new Paging(start,  cdto.get(0).getCount());
			mav.addObject("cpaging", paging);
			mav.addObject("ccount", cdto.get(0).getCount());		// 검색 결과 수
		}
		
		if(ndto != null) {
			mav.addObject("nlist", ndto);		// 검색 결과
			int page = cdto.get(0).getCount()/20;
			Paging paging = new Paging(start,  cdto.get(0).getCount());
			mav.addObject("npaging", paging);
			mav.addObject("ncount", cdto.get(0).getCount());		// 검색 결과 수
		}
		return mav;
	}
	
	@GetMapping("/bestSeller")
	public ModelAndView bestSeller() {
		ModelAndView mav = new ModelAndView();
		List<StarBookDTO> dto = sbs.bestSeller();
		mav.setViewName("books/bestSeller");
		mav.addObject("bestSeller", dto);
		return mav;
	}
	
	@GetMapping("/newBook")
	public ModelAndView newBook() {
		ModelAndView mav = new ModelAndView();
		List<StarBookDTO> dto = sbs.newBook();
		mav.setViewName("books/newBook");
		mav.addObject("newBook", dto);
		return mav;
	}
	@GetMapping("/weekPick/{num}")
	public ModelAndView weekPick(@PathVariable int num) {
		ModelAndView mav = new ModelAndView();
		List<StarBookDTO> dto = sbs.weekPick(num);
		mav.setViewName("books/weekPick");
		mav.addObject("weekPick", dto);
		return mav;
	}
}
