<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<section id="mystarWRap" class="clearfix" style="height : 780px">
<%@ include file="../order/leftwrap.jsp" %>
   <div class="rightWrap" id="modify">
   <h2>정보변경</h2>
   <table class="modify">
   <tbody>
   	<tr>
   		<th>이름</th>
   		<td style="position: relative;">${dto.user_name } 
   			<button id="deleteBtn" class="delBtn">회원탈퇴</button>
   		</td>
   	</tr>
   	<tr>
   		<th>아이디</th>
   		<td>${dto.user_id }</td>
   	</tr>
   	<tr>
   		<th>이메일</th>
   		<td>${dto.user_email }</td>
   	</tr>
   	<tr>
   		<th>비밀번호변경</th>
   		<td>
   			<form method="post" id="changePW">
   				<p><input type="hidden" name="user_id" value="${login.user_id }"></p>
   				<p><input type="password" name="old_pw" onkeyup="oldPwCheck(this.value)"><output class="old_pw"></output></p>
   				<p><input type="password" name="user_pw" onkeyup="pwCheck(this.value)"><output class="user_pw"></output></p>
   				<p><input type="password" name="user_pw2" onkeyup="pwCheck2(this.value)"><output class="user_pw2"></output></p>
   				<p><input type="submit" value="비밀번호변경" class="cBtn"></p>
   			</form>
   			<div>
   				<h4>비밀번호 변경시 유의사항</h4>
   				<p>1. 비밀번호는 총 8 ~ 15자로 작성해주세요.</p>
   				<p>2. 영문,숫자,특수문자를 조합해서 작성해주세요.</p>
   			</div>
   		</td>
   	</tr>
   	<tr>
   		<th>성별</th>
   		<td>${dto.user_gender }</td>
   	</tr>
   	<tr>
   		<th>마케팅 정보 수신 관리</th>
   		<td>
   			<div class="chkbox">
				<p><input type="checkbox" name="accChk" value="1"  ${dto.accChk == 1? 'checked' : '' }>이용약관 동의(필수)</p>
				<p><input type="checkbox" name="infoChk" value="1" ${dto.infoChk == 1 ? 'checked' : '' }>개인 정보 수집 및 이용 동의(필수)</p>
				<p><input type="checkbox" name="eventChk" value="1" ${dto.eventChk == 1 ? 'checked' : '' }>이벤트,혜택알림 수신 동의(선택)</p>
				<p><input type="checkbox" name="otherChk" value="1" ${dto.otherChk == 1 ? 'checked' : '' }>성별,생년 정보 제공 동의(선택)</p>
			</div>
   		</td>
   	</tr>
   	</tbody>
   </table>
   </div>
 </section>
 <%@ include file="../footer.jsp" %>
 <script>
 const deleteBtn = document.getElementById('deleteBtn');
 deleteBtn.onclick = function(){
	 const flag = confirm('회원탈퇴를 하시겠습니까?');
	 const id = '${login.user_id}';
	 if(flag){
		 const user_pw = prompt('회원 탈퇴를 위해 비밀번호 입력해 주세요.');

				const url='${cpath}/member/modify/pwCheck';
				console.log(url);
				const opt = {
					method : 'POST',
					body : JSON.stringify({oldpw : user_pw, id : id}),
					headers : {
						'Content-Type' : 'application/json'
					}
				}
				fetch(url, opt)
				.then(resp=>resp.text())
				.then(text=>{
					const flag = text == 'OK';
					//flag ? alert('회원 탈퇴를 진행하겠습니다.'): 
					if(flag == true){	
						const url2 = '${cpath}/member/delete/'+ id;
						const opt2 = {
								method : 'DELETE'
						};
						fetch(url2, opt2)
						.then(resp=>resp.text())
						.then(text=>{
							console.log(typeof text);
							console.log(text);
							if(text == '1'){
								alert(id+'님 계정이 삭제되었습니다.');
								location.href='${cpath}/';
							}else{
								alert(id + '님은 없는 계정입니다.');
								location.reload();
							}
						});
					}else{
						alert('비밀번호가 다릅니다. 확인 후 입력바랍니다.');
					}
			});
 }
 }
 </script>
 <script type="text/javascript">
 	let opFlag = false;
 	let upFlag = false;
	const old_pw=  document.querySelector('input[name="old_pw"]');
	const id = '${login.user_id}';
	const msg = document.querySelector('.old_pw');
	
	function oldPwCheck(oldpw){
		console.log(oldpw);
		const url='${cpath}/member/modify/pwCheck';
		console.log(url);
		const opt = {
			method : 'POST',
			body : JSON.stringify({oldpw : oldpw, id : id}),
			headers : {
				'Content-Type' : 'application/json'
			}
		}
		fetch(url, opt)
		.then(resp=>resp.text())
		.then(text=>{
			msg.value = text;
			const flag = text == 'OK';
			flag ? msg.style.color = 'green': msg.style.color='red';
			flag ? old_pw.style.borderColor = 'green': old_pw.style.borderColor = 'red';
			if(flag == true){	
				msg.style.color = 'green';
				opFlag = true;
			}else{
				opFlag = false;
			}
	});
	}
	
	let test1 = /[0-9]/;
	let test2 = /[A-Za-z]/;
	let test3 = /[\{\}\[\]\/?.,;:|\(\)~!@#$%^&*\\\=\'\"]/;	
	const inputPw = document.querySelector('input[name="user_pw"]');
	function pwCheck(pw){	
		const msg = document.querySelector('.user_pw');
		if(!test1.test(pw) || !test2.test(pw) || !test3.test(pw) || !(pw.length >= 8 && pw.length <= 15)){
			msg.value = "비밀번호 유의 사항에 맞게 적어주세요..";
			msg.style.color = 'red';
		}else{
			msg.value = "";
			inputPw.style.borderColor = 'green';
		}
	}
	
	const inputPw2 = document.querySelector('input[name="user_pw2"]');
	function pwCheck2(pw2) {
		const pw = inputPw.value;
		const msg = document.querySelector('.user_pw2');
		if(pw != pw2){
			msg.value = "비밀번호가 일치하지 않습니다.";
			inputPw2.style.borderColor = 'red';
			msg.style.color = 'red';
			upFlag = false;
		}else{
			msg.value = "";
			inputPw2.style.borderColor = 'green';
			upFlag = true;
		}
	}
	

	const chngePwForm = document.getElementById('changePW');
	chngePwForm.onsubmit = function(e){
		e.preventDefault();
		if(opFlag && (inputPw.value==inputPw2.value)){
			//const user_pw = document.querySelector('input[name="user_pw"]');
			chngePwForm.submit();
		}else{
			alert('비밀번호 유의사항에 맞게 작성 후 버튼을 눌러주세요.')
		}
	}
	
</script>  