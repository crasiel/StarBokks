<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<section id="newBook" class="wideGridWarp">

					<h1>신간도서 TOP30</h1>
					<div class="book-grid">
							<c:forEach var="newBook" begin="0" end="29" items="${newBook }">
								<div onclick="link('${newBook.link}')">
									<img src="${newBook.coverLargeUrl}" alt="${newBook.title }" title="${newBook.title }">
									<div>
										<h3>${newBook.title }</h3>
										<h4>${newBook.author }</h4>
									</div>
								</div>
							</c:forEach>
						</div>

</section>















<%@ include file="../footer.jsp" %>