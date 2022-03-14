<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mem_header.jsp" %>
<c:if test="${not empty login }">
	<script>
		location.href='${cpath}/';
	</script>
</c:if>

<section id="loginWrap">
<c:if test="${not empty cookieId }">
	<c:set var="checked" value="checked" />
</c:if>
	<form id="loginForm" method="POST">
		<p><input type="text" name="user_id" placeholder="아이디(ID)" value="${cookieId}"></p>
		<p><input type="password" name="user_pw" placeholder="비밀번호" style="margin-top : 0; border-bottom : none; border-top : none;"></p>
		<p style="width : 400px;height : 45px; line-height : 45px; border : 1px solid #d6deeb; background-color : #f7fbff;  color :#303538;  padding-left:10px;">
			<input type="checkbox" id="idCookie" name="isCookie" value="y" ${checked } style="width : 17px;height : 17px;">
			<label for="idCheck" style="font-size : 14px;">ID 기억하기</label>
			
			<a href="${cpath }/member/findid"  style="margin-left : 80px; font-size : 13px;">아이디 찾기</a> | 
			<a href="${cpath }/member/newpw"  style="font-size : 13px;">비밀번호 재설정</a>
		</p>
		<p><input type="submit" value="로그인"></p>
	</form>
		<p><button onclick="location.href='${cpath}/member/join'">회원가입</button></p>
</section>

</body>
</html>