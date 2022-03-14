<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section id="cartWrap">
	<h2>카트</h2>
	<div class="cartTab-wrap">
		<div class="tabMenu">
		<ul class="clearfix">
			<li class="active">대여가능</li>
			<li>구매가능</li>
		</ul>
		</div>
		<div class="tabCont">
			<div class="block">
 				<c:if test="${empty cart }">
					<i class="xi-cart-add xi-3x"></i>
					<p>카트가 비어있습니다.</p>
				</c:if>
				<c:if test="${not empty cart }">
					<div class="rent">
						<ul>
							<li class="contOn">대여목록</li>
						</ul>
					</div>
					<div class="buy">
						<ul>
							<li>구매목록</li>
						</ul>
					</div>
 				</c:if>
			</div>
			<div>
			</div>	
		</div>
	</div>
</section>
<script>
	const tabBtn = document.querySelectorAll('.tabMenu >ul >li');
	tabBtn.forEach(tabBtn=>tabBtn.onclick = function(e){
		const acLi = document.querySelector('.active');
		acLi.classList.remove('active');
		e.target.classList.add('active');
		if(e.target.innerText == "대여가능"){
			document.querySelector('.buy').style.display = 'none';
			document.querySelector('.rent').style.display = 'block';
		}else if(e.target.innerText == "구매가능"){
			document.querySelector('.rent').style.display = 'none';
			document.querySelector('.buy').style.display = 'block';
		};
	});
</script>
<%@ include file="../footer.jsp" %>