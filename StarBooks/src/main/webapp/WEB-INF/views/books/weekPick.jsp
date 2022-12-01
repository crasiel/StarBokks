<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section id="weekPick" class="wideGridWarp">

					<h1>주간 Pick! 역사기행 30</h1>
					<div class="book-grid">
							<c:forEach var="week" begin="0" end="29" items="${weekPick }">
								<div onclick="link('${week.link}')">
									<img src="${week.coverLargeUrl}" alt="${week.title }" title="${week.title }">
									<div>
										<h3>${week.title }</h3>
										<h4>${week.author }</h4>
									</div>
								</div>
							</c:forEach>
						</div>

</section>

