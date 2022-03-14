<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section id="mystarWRap" class="clearfix">
<%@ include file="../order/leftwrap.jsp" %>
   <div class="rightWrap" id="mysratHome">
   <h2>마이스타홈</h2>

   	<article class="infoWrap clearfix">
   		<div class="myinfo">
   			<h3>${login.user_id }님</h3>
   			<p style="font-size: 14px;">${login.user_email }</p>
   			<p><button onclick="location.href='${cpath}/member/logout'">로그아웃</button></p>
   		</div>
   		<div class="mystar-info">
   			<ul class="clearfix">
   				<li>
   					<i class="xi-money xi-2x"></i>
   					<p>스타캐시</p>
   					<h3 style="color : #1f8ce6;">0원</h3>
   					<a href="${cpath }/order/cash">스타캐시충전<span>>></span></a>
   				</li>
   				<li>
   					<i class="xi-star-o xi-2x"></i>
   					<p>스타포인트</p>
   					<h3 style="color : #1f8ce6;">0원</h3>
   					<span>소멸예정 0원</span>
   				</li>
   				<li>
   					<i class="xi-coupon xi-2x"></i>
   					<p>쿠폰</p>
   					<h3 style="color : #1f8ce6;">0개</h3>
   					<a href="${cpath }/order/coupon">쿠폰등록<span>>></span></a>
   				</li>
   			</ul>
   		</div>
   </article>
   <article class="mystar-recents">
   		<h3>최근조회한 작품</h3>
   </article>
   </div>
</section>
</body>
</html>