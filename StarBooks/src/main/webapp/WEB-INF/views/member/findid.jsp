<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mem_header.jsp" %>
<c:if test="${not empty login }">
	<script>
		location.href='${cpath}/';
	</script>
</c:if>

<section id="findidWrap">
<c:if test="${pageContext.request.method == 'GET' }">
	<h2>아이디 찾기</h2>
		<form id="findidForm" method="POST">
			<p><input type="text" name="user_email" placeholder="이메일 주소"></p>
			<p><input type="submit" value="아이디 찾기"></p>
		</form>
		<div>
			<p class="alt">이메일이 기억나지 않으세요? > 고객센터문의</p>
		</div>
	<script type="text/javascript">		
		const form = document.getElementById('findidForm');
		form.onsubmit = function(e){
			e.preventDefault();
			const emailTest = /[A-Za-z0-9_\.\-]+@[A-z-a-z\-]+\.[A-Za-z\-]/;
			const eCheck = document.querySelector('input[name="user_email"]').value;
			if(!emailTest.test(eCheck)){
				alert('이메일 양식에 맞지 않습니다');
				return;
			}else{
				form.submit();
			}
		}	
	</script>
</c:if>
	
	<c:if test="${pageContext.request.method == 'POST' }">
		<fieldset style="display: block;width: 400px; margin-top : 20px; padding : 20px;text-align: center;">
		<c:if test="${empty msg }">
		<h2 style="width : 100%;">일치하는 회원정보가 없습니다.</h2>
		<div style="margin-top : 10px;">
			<p class="alt"><a href="${cpath }/member/findid" style="font-size : 14px; font-weight: bold;">← 뒤로가기</a></p>
			<p class="alt">이메일이 기억나지 않으세요? > 고객센터문의</p>
		</div>
		</c:if>
		<c:if test="${not empty msg }">
			<h2 style="width : 100%;">${msg }</h2>
			<p class="alt">개인정보보호를 위해 중간에 마스킹(*) 처리 했습니다.							  
				<c:if test="${empty alert }">
				<br>전체 아이디는 입력하신 메일 주소로 보내드렸습니다.
				</c:if>
				<c:if test="${not empty alert }">
					<script type="text/javascript">
						alert('${alert}')
					</script>
				</c:if>
			</p>	
				<button onclick="location.href='${cpath }/member/login'">로그인</button>
				<p class="alt">비밀번호를 잃어버리셨나요? <a href="${cpath }/member/newpw" style="color : #1f8ce6; font-size : 14px; font-weight: bold">비밀번호재발급</a></p>
			</c:if>
		</fieldset>
		
		
	</c:if>
</section>
</body>
</html>