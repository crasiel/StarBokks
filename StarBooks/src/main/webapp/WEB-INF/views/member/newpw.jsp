<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mem_header.jsp" %>
<c:if test="${not empty login }">
	<script>
		location.href='${cpath}/';
	</script>
</c:if>

<section id="newpwWrap">
<c:if test="${pageContext.request.method == 'GET' }">
<h2 style="width : 133px;">비밀번호 재설정</h2>
	<form id="newpwForm" method="POST">
		<p><input type="text" name="user_id" placeholder="아이디(ID)"></p>
		<p><input type="text" name="user_email" placeholder="이메일주소" style="margin-top : 0;"></p>
		<p><input type="submit" value="비밀번호재발급"></p>
	</form>
	<div>
		<p class="alt"">새 비밀번호를 설정할 수 있도록 이메일로 메시지가 전송됩니다.</p>
	</div>
	
		<script type="text/javascript">		
		const form = document.getElementById('newpwForm');
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
		<fieldset style="display: block;width: 500px; margin-top : 20px; padding : 20px;text-align: center;">
			<c:if test="${not empty newPw }">
				<c:if test="${empty alert }">
					<h2 style="width : 100%;">새로 발급된 임시 비밀번호는 메일로 전송하였습니다.</h2>
				</c:if>
				<c:if test="${not empty alert }">
					<script type="text/javascript">
						alert('${alert}')
					</script>
					<h2 style="width : 100%;">메일 미발송 : 임시 비밀번호는 [ ${newPw } ] 입니다.</h2>				
				</c:if>
			</c:if>
			<c:if test="${empty newPw }">
			<h2 style="width : 100%;">일치하는 회원정보가 없습니다.</h2>
			<div style="margin-top : 10px;">
				<p class="alt"><a href="${cpath }/member/newpw" style="font-size : 14px; font-weight: bold;">← 뒤로가기</a></p>
				<p class="alt">이메일이 기억나지 않으세요? > 고객센터문의</p>
			</div>
			</c:if>
			<button onclick="location.href='${cpath}/member/login'">로그인</button>
		</fieldset>
		
		
	</c:if>
</section>
</body>
</html>