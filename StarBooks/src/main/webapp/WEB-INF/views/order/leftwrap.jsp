<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="leftWrap">
     <h2>마이스타</h2>
      <ul class="left-menu">
         <li><a href="${cpath }/member/mystar" class="mystar"> 마이스타홈</a></li>
          <li><i class="xi-book xi-x"></i> 책
              <ul>
                  <li><a href="">선호작품</a></li>
                  <li><a href="">최근 조회한 작품</a></li>
                  <li><a href="">위시리스트</a></li>
                  <li><a href="">독서노트</a></li>
              </ul>
          </li>
          <li><i class="xi-credit-card xi-x"></i> 구매/혜택
              <ul>
                  <li><a href="${cpath }/order/history" class="history">결제내역</a></li>
                  <li><a href="${cpath }/order/cash" class="cash">스타캐시</a></li>
                  <li><a href="${cpath }/order/point" class="point">스타포인트</a></li>
                  <li><a href="${cpath }/order/coupon" class="coupon">쿠폰</a></li>
              </ul>
          </li>
          <li><i class="xi-user xi-x"></i> 개인
              <ul>
                  <li><a href="${cpath }/member/modify" class="modify">정보변경</a></li>
                  <li><a href="">1:1문의</a></li>
                  <li><a href="">내리뷰관리</a></li>
                  <li><a href="">내기기관리</a></li>
              </ul>
          </li>
      </ul>
  </div>
  
  <script>
const path = document.location.href;
const arr = path.split('/');
console.log(arr[arr.length-1]);
const aOn = document.querySelector('ul.left-menu > li .'+ arr[arr.length-1]);
/* console.log(aOn); */
if(aOn != null)
	aOn.classList.add('on');
</script>
<script>
	const a = document.querySelectorAll('ul.left-menu > li a');
	a.forEach(a=>a.onclick=function(e){
		e.preventDefault();
		const on = document.querySelector('.on');
		if(on != null)
			on.classList.remove('class', 'on');
		e.target.classList.add('class', 'on');
		console.log(e.target.href);
		location.href = e.target.href;
	});
</script>