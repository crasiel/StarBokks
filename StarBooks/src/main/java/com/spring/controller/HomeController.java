package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.spring.book.BookDTO;
import com.spring.book.Paging;
import com.spring.book.StarBookDTO;
import com.spring.service.BookService;
import com.spring.service.StarBooksService;

@Controller
public class HomeController {
	@Autowired private StarBooksService sbs;
	@Autowired private BookService book;
	
	@GetMapping({"", "/"})
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
//		String time = sbs.testDB();
//		mav.addObject("time", time);
		
		List<StarBookDTO> best  = sbs.bestSeller();
		if(best!=null) {
			mav.addObject("best", best);
		}
		List<StarBookDTO> newBook  =sbs.newBook();
		if(newBook != null) {
			mav.addObject("newBook", newBook);
		}
		List<StarBookDTO> recommend  =sbs.recommend();
		if(recommend != null) {
			mav.addObject("recommend", recommend);
		}
		List<StarBookDTO> history  =sbs.weekPick(105);
		if(history != null) {
			mav.addObject("history", history);
		}
		mav.setViewName("index");
		return mav;
	}
	
	@GetMapping("/search/{search}")
	public ModelAndView search(@PathVariable String search, Integer start) {
		System.out.println("search-controller : " + start);
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("search");		
		mav.addObject("search", search);						// 검색 단어		
		System.out.println(start);
		if(start == null || start == 0) start = 1;
		List<BookDTO> list = book.search(search, start);
		System.out.println( "검색결과 : " + list.get(0).getCount());
		System.out.println("home list : " + list + (list == null ? " / null" : " / not null"));
		if(list != null) {
			mav.addObject("bookjson", list);		// 검색 결과
			int page = list.get(0).getCount()/20;
//			page += (list.get(0).getCount() % 20 == 0) ? 0 : 1;
//			mav.addObject("page", page);			//페이징 처리 해서 넣기
			Paging paging = new Paging(start,  list.get(0).getCount());
			mav.addObject("paging", paging);
			mav.addObject("count", list.get(0).getCount());		// 검색 결과 수
//			System.out.println("homeController count : " + list.get(0).getCount());
		}
		return mav;
	}
}
