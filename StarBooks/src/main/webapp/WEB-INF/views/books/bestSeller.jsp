<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section id="bestSeller" class="wideGridWarp">

					<h1>베스트셀러 TOP30</h1>
					<div class="book-grid">
							<c:forEach var="best" begin="0" end="29" items="${bestSeller }">
								<div onclick="link('${best.link}')">
									<img src="${best.coverLargeUrl}"  style="" alt="${best.title }" title="${best.title }">
									<div>
										<h3>${best.title }</h3>
										<h4>${best.author }</h4>
									</div>
								</div>
							</c:forEach>
						</div>

</section>




<%@ include file="../footer.jsp" %>