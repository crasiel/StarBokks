<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mem_header.jsp" %>
<c:if test="${not empty login }">
	<script>
		location.href='${cpath}/';
	</script>
</c:if>
<section id="joinWrap">
	<form id="joinForm" method="POST">
		<p>
			<span class="offfocus"></span>
			<input type="text" name="user_id" placeholder="아이디(ID)" onkeyup="idCheck(this.value)">
			<output class="idCheck"></output>
		</p>
		<p>
			<span class="offfocus"></span>
			<input type="password" name="user_pw" placeholder="비밀번호" onkeyup="pwCheck(this.value)">
			<output class="pwCheck"></output>
		</p>
		<p>
		    <span class="offfocus" style="top : 0;">비밀번호 재입력</span>
			<input type="password" name="user_pw2" placeholder="비밀번호 재입력"  style="margin-top:-1px;" onkeyup="pwCheck2(this.value)">
			<output class="pwCheck2"></output>
		</p>
		<p>
		    <span class="offfocus">이름 입력</span>
			<input type="text" name="user_name" placeholder="이름" onkeyup="nameCheck(this.value)">
			<output class="nameCheck"></output>
		</p>
		<p>
		    <span class="offfocus"></span>
			<input type="text" name="user_email" placeholder="이메일 주소" onkeyup="emailCheck(this.value)">
			<output class="emailCheck"></output>
		</p>
		<div class="clearfix" style="height : 70px;">
		<p style="float : left">
			<span class="offfocus"></span>
			<input type="text" name="user_birth" placeholder="생년월일" style="width : 240px;" onkeyup="birthCheck(this.value)">
			<output class="birthCheck" style="width: 350px;position: absolute;top: 60px;"></output>
		</p>
		<div class="button-wrap clearfix">
			<input class="hidden radio-label" id="female-button" type="radio" name="user_gender" checked="checked" value="여">
    		<label class="button-label" for="female-button">
      			<h4>여자</h4>
    		</label>
    		<input class="hidden radio-label" id="malebutton" type="radio" name="user_gender" value="남">
    		<label class="button-label" for="malebutton">
      			<h4>남자</h4>
    		</label>
    		</div>
		</div>
		<div class="chkWrap">
			<h2>이용약관 동의</h2>
			<hr>
			<div class="chkbox">
				<p><input type="checkbox" name="accChk" value="1">이용약관 동의(필수)</p>
				<p><input type="checkbox" name="infoChk" value="1">개인 정보 수집 및 이용 동의(필수)</p>
				<p><input type="checkbox" name="eventChk" value="1">이벤트,혜택알림 수신 동의(선택)</p>
				<p><input type="checkbox" name="otherChk" value="1">성별,생년 정보 제공 동의(선택)</p>
			</div>
		</div>
		<p><input type="submit" value="회원가입"></p>
	</form>
</section>
<script>
let flagId = false;
let flagPw = false;
let flagEmail = false;
let flagName = false;
let flagBirth = false;

let emailTest = /[A-Za-z0-9_\.\-]+@[A-z-a-z\-]+\.[A-Za-z\-]/;
let test1 = /[0-9]/;
let test2 = /[A-Za-z]/;
let test3 = /[\{\}\[\]\/?.,;:|\(\)~!@#$%^&*\\\=\'\"]/;
let birthTest = /[0-9]/;

	function idCheck(id){
		const inputId = document.querySelector('input[name="user_id"]');
		const msg = document.querySelector('.idCheck');
		if(!test1.test(id) || !test2.test(id) && (id.length >= 5 && id.length <= 20)){
			msg.value="5~20자. 영문,숫자조합해주세요."
			inputId.classList.add('nocheck');
		}else{
			
			const url = '${cpath}/member/join/idCheck';
			const opt = {
					method : 'POST',
					body : JSON.stringify({id: id}),
					headers : {
						'Content-Type' : 'application/json'
					}
			}
			fetch(url, opt)
			.then(resp=>resp.text())
			.then(text=>{
				msg.value = text;
				const flag = text == '사용가능한 id 입니다.';
				flag ? msg.style.color = 'green': msg.style.color='red';
				flag ? inputId.style.borderColor = 'green': inputId.style.borderColor = 'red';
				if(flag == false){
					inputId.focus();
					flagId =false;
				}else{
					msg.style.color = 'green';
					inputId.classList.remove('nocheck');
					inputId.classList.add('check');
					flagId = true;
				}
			
		});
			
		}
	}

	function pwCheck(pw){
		//console.log(pw)
		const inputPw = document.querySelector('input[name="user_pw"]');
		if(!test1.test(pw) || !test2.test(pw) || !test3.test(pw) || !(pw.length >= 8 && pw.length <= 15)){
			document.querySelector('.pwCheck2').value = "8~15자. 영문,숫자,특수문자를 조합해주세요.";
			inputPw.setAttribute('class', 'nocheck');
		}else{
			document.querySelector('.pwCheck2').value = "";
			inputPw.setAttribute('class','check');	
			//flagPw = true;
		}
	}
	
	function pwCheck2(pw2) {
		const pw = document.querySelector('input[name="user_pw"]').value;
		const inputPw2 = document.querySelector('input[name="user_pw2"]')

			if(pw != pw2){
				document.querySelector('.pwCheck2').value = "비밀번호가 일치하지 않습니다.";
				inputPw2.setAttribute('class', 'nocheck');
				flagPw = false;
			}else{
				document.querySelector('.pwCheck2').value = "";		
				inputPw2.setAttribute('class','check');
				flagPw = true;
			}
	}
	
	function nameCheck(name){
		const inputName = document.querySelector('input[name="user_name"]');
		console.log(test1.test(name))
		console.log(test3.test(name))
		if(test1.test(name) || test3.test(name)){
			document.querySelector('.nameCheck').value="이름에 숫자나 특수문자는 사용불가합니다."
			inputName.classList.add('nocheck');
			flagName =false;
		}else{
			document.querySelector('.nameCheck').value="";
			inputName.classList.remove('nocheck');
			inputName.classList.add('check');
			flagName = true;
		}
	}
	
	function emailCheck(email){
		const inputEmail = document.querySelector('input[name="user_email"]');
		const msg = document.querySelector('.emailCheck');
		if(!emailTest.test(email)){
			msg.value= "올바른 이메일 형식이 아닙니다.";
			inputEmail.setAttribute('class', 'nocheck');
			flagEmail =false;
		}else{
			
			const url = '${cpath}/member/join/emailCheck';
			const opt = {
					method : 'POST',
					body : JSON.stringify({email: email}),
					headers : {
						'Content-Type' : 'application/json'
					}
			}
			fetch(url, opt)
			.then(resp=>resp.text())
			.then(text=>{
				msg.value = text;
				const flag = text == '사용가능한 email 입니다.';
				flag ? msg.style.color = 'green': msg.style.color='red';
				flag ? inputEmail.style.borderColor = 'green': inputEmail.style.borderColor = 'red';
				if(flag == false){
					inputEmail.focus();
					flagEmail =false;
				}else{		
					msg.style.color = 'green';
					inputEmail.classList.remove('nocheck');
					inputEmail.classList.add('check');
					flagEmail = true;
				}
			
		});
			
		}
	}
	
	function birthCheck(birth){
		const inputBirth = document.querySelector('input[name="user_birth"]');
		console.log(birth.length)
		if(!birthTest.test(birth) || (birth.length != 8)){
			document.querySelector('.birthCheck').value = "생년월일을 8자리 숫자로만 입력하세요(19900101)";
			inputBirth.classList.add('nocheck');
			flagBirth = false;
		}else{
			document.querySelector('.birthCheck').value = "";
			inputBirth.classList.remove('nocheck');
			inputBirth.classList.add('check');	
			flagBirth = true;
		}
	}		// birth 체크
	
	// 회원 가입 submit();
	const form = document.getElementById('joinForm');
	form.onsubmit = function(e){
		e.preventDefault();
		const accChk = document.querySelector('input[name="accChk"]');
		const infoChk = document.querySelector('input[name="infoChk"]');

		if(!(accChk.checked && infoChk.checked)){						// checkbox 필수 동의 체크여부
			alert('이용약관의 필수사항을 동의해주세요.');
			return false;
		}
		
		if(flagName && flagId && flagPw && flagEmail && flagBirth){				
			form.submit();
		}else{
			alert('양식에 맞게 작성 후 회원가입 버튼을 눌러주세요.');
			return;
		}
	}
</script>
<script type="text/javascript">
	const input = document.querySelectorAll('input');
	input.forEach(input=>input.onfocus=function(e){
		const target = e.target;
        target.placeholder='';
        console.log(target.name)
        const span = target.previousElementSibling;
        span.classList.remove('offfocus');
        span.classList.add('onfocus');
        switch(target.name){
            case 'user_id' : span.innerText='아이디 : 5~20자 영문,숫자조합';break;
            case 'user_pw' : span.innerText = '비밀번호 : 8~15자 영문,숫자,특수문자 조합';break;
            case 'user_birth' : span.innerText = '생년월일(예: 19900101)';break;
            case 'user_email':span.innerText = 'E-Mail (예:starbooks@naver.com)';break;
        }
            
	});
    
    input.forEach(input=>input.onblur=function(e){
        const target = e.target;
        const span = target.previousElementSibling;
        
        if(target.value.length == 0){
            span.classList.remove('onfocus');
            span.classList.add('offfocus');

            switch(target.name){
                case 'user_id' : target.placeholder='아이디(ID)'; break;
                case 'user_pw' : target.placeholder='비밀번호'; break;
                case 'user_pw2' :target.placeholder='비밀번호 재입력'; break;
                case 'user_name' : target.placeholder = '이름'; break;
                case 'user_email' : target.placeholder = '이메일 주소'; break;
                case 'user_birth' : target.placeholder='비밀번호 재입력'; break;
                case 'user_email' :target.placeholder='생년월일'; break;
            }   
        }
    });
</script> 

<<script type="text/javascript">

</script>
</body>
</html>