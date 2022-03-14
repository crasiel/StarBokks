package com.spring.book;

public class Paging {
	private final int perPage = 20;
	private int page;						// 사용자가 요청한 페이지 번호
	private int searchCount;
	private int pageCount;
	private int offset;					// 첫번째 글에서 몇개의 글을 건너뛸지 결정하는 개수
	
	private final int perSection = 10;
	private int begin;
	private int end;
	private int section;					// <c:if test="${true}">
	
	// 이전 section과 다음 section의 존재 여부
	private boolean prev;
	private boolean next;
	
	public Paging(int page, int searchCount) {		// 매개변수 : 사용자 요청 페이지, 총 게시물
		this.page = page;
		this.searchCount = searchCount;
		
		pageCount = searchCount / perPage;
		pageCount += (searchCount % perPage) == 0 ? 0 : 1;
		
		section = (page -1) / perSection;
		begin = perSection * section +1;
		end = begin + perSection - 1;
		end = (end < pageCount) ? end : pageCount;
		
		prev = section != 0;
		next = searchCount > perPage * end;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getSearchCount() {
		return searchCount;
	}

	public void setSearchCount(int searchCount) {
		this.searchCount = searchCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getSection() {
		return section;
	}

	public void setSection(int section) {
		this.section = section;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPerPage() {
		return perPage;
	}

	public int getPerSection() {
		return perSection;
	}
}
