package com.spring.book;

import org.apache.ibatis.annotations.Select;

public interface StarBooksDAO {

	@Select("select now()")
	String test();

}
