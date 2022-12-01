<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section id="categoryWrap" class="clearfix">
<%@ include file="leftCategory.jsp" %>
	<article class="right-content">
		<div class="contentWrap">
			<h2>${category } 전체</h2>
			<div class="tab-category">
				<ul class="clearfix">
					<li class="tm c1 on" title="1">홈</li>
					<li class="tm c2" title="2">전체</li>
					<li class="tm c3" title="3">신간</li>
					<li class="tm c4" title="4">인기도서</li>
					<!-- <li class="tm c5" title="5">무료책</li> -->
				</ul>
			</div>
			<div class="tab-content">
				<div class="cont1 view">
					<div style="margin-bottom : 50px;">
						<div class="sub-category clearfix">
							<h2>${category } 전체보기</h2>
							<div class="btn-wrap">
								<button style="display: inline-block; border-radius: 5px" onclick="tabChoice(2)">전체보기 &nbsp; <span style="font-size: 10px;letter-spacing: -2px;">>></span></button>
							</div>
						</div>
						<div class="book-grid book10">
							<c:forEach var="book" begin="0" end="9" items="${list }" >
								<div onclick="link('${book.link}')">
									<img src="${book.image}" alt="${book.title }" title="${book.title }">
									<p>${book.title }</p>
									<p>${book.author }</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div  style="margin-bottom : 50px;">
						<div  class="sub-category clearfix">
							<h2 style="display: inline-block;">${category } 신간</h2>
							<div class="btn-wrap">
								<button style="display: inline-block; border-radius: 5px" onclick="tabChoice(3)">전체보기 &nbsp; <span style="font-size: 10px;letter-spacing: -2px;">>></span></button>
							</div>
						</div>
						<div class="book-grid">
							<c:forEach var="book" begin="0" end="4" items="${nlist }" >
								<div onclick="link('${book.link}')">
									<img src="${book.image }" alt="${book.title }" title="${book.title }">
									<p style="">${book.title }</p>
									<p style="">${book.author }</p>
								</div>
							</c:forEach>
						</div>
					</div>	
					<div style="margin-bottom : 50px;">
						<div class="sub-category clearfix" >
							<h2 style="display: inline-block;">${category } 인기도서</h2>
							<div class="btn-wrap">
								<button style="display: inline-block; border-radius: 5px" onclick="tabChoice(4)">전체보기 &nbsp; <span style="font-size: 10px;letter-spacing: -2px;">>></span></button>
							</div>						
						</div>
						<div class="book-grid">
							<c:forEach var="book" begin="0" end="4" items="${clist }" >
								<div onclick="link('${book.link}')">
									<img src="${book.image }" alt="${book.title }" title="${book.title }">
									<p style="">${book.title }</p>
									<p style="">${book.author }</p>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
				<div class="cont2 wide-grid">
					<h2>전체보기</h2>
					<div class="book-grid">
							<c:forEach var="book" begin="0" end="19" items="${list }" >
								<div onclick="link('${book.link}')">
									<img src="${book.image}" alt="${book.title }" title="${book.title }">
									<p>${book.title }</p>
									<p>${book.author }</p>
								</div>
							</c:forEach>
						</div>
						
						<div class="paging clearfix" id="paging" title="all">		
							<c:if test="${paging.prev }">
								<a href="${cpath }/books/category/${num }?str=${category }&start=${paging.begin -1 }">◀</a>
							</c:if>
							
							<c:forEach var="i" begin="${paging.begin }" end="${paging.end }" >				
								<a href="${cpath }/books/category/${num }?str=${category }&start=${i }" ${paging.page == i ? 'class="ch"' : '' } >${i }</a>
							</c:forEach>
			
							<c:if test="${paging.next }">
								<a href="${cpath }/books/category/${num }?str=${category }&start=${paging.end +1}">▶</a>
							</c:if>
						</div>
				</div>
				<div class="cont3 wide-grid">
					<h2>신간</h2>
					<div class="book-grid">
							<c:forEach var="book" begin="0" end="19" items="${nlist }" >
								<div onclick="link('${book.link}')">
									<img src="${book.image }" alt="${book.title }" title="${book.title }">
									<p style="">${book.title }</p>
									<p style="">${book.author }</p>
								</div>
							</c:forEach>
						</div>
				
						<div class="paging clearfix" id="paging" title="newBook">		
							<c:if test="${npaging.prev }">
								<a href="${cpath }/books/category/${num }?str=${category }&start=${npaging.begin -1 }">◀</a>
							</c:if>
							
							<c:forEach var="i" begin="${npaging.begin }" end="${npaging.end }" >				
								<a href="${cpath }/books/category/${num }?str=${category }&start=${i }" ${npaging.page == i ? 'class="ch"' : '' } >${i }</a>
							</c:forEach>
			
							<c:if test="${npaging.next }">
								<a href="${cpath }/books/category/${num }?str=${category }&start=${npaging.end +1}">▶</a>
							</c:if>
						</div>
				</div>
				<div class="cont4 wide-grid">
					<h2>인기도서</h2>
					<div class="book-grid">
							<c:forEach var="book" begin="0" end="19" items="${clist }" >
								<div onclick="link('${book.link}')">
									<img src="${book.image }" alt="${book.title }" title="${book.title }">
									<p style="">${book.title }</p>
									<p style="">${book.author }</p>
								</div>
							</c:forEach>
						</div>
				
						<div class="paging clearfix" id="paging" title="best">		
							<c:if test="${cpaging.prev }">
								<a href="${cpath }/books/category/${num }?str=${category }&start=${cpaging.begin -1 }">◀</a>
							</c:if>
							
							<c:forEach var="i" begin="${cpaging.begin }" end="${cpaging.end }" >				
								<a href="${cpath }/books/category/${num }?str=${category }&start=${i }" ${cpaging.page == i ? 'class="ch"' : '' } >${i }</a>
							</c:forEach>
			
							<c:if test="${cpaging.next }">
								<a href="${cpath }/books/category/${num }?str=${category }&start=${cpaging.end +1}">▶</a>
							</c:if>
						</div>
				
				</div>
				<%-- <div class="cont5 wide-grid">
					<h2>무료책</h2>
					<div class="book-grid">
							<c:forEach var="book" begin="1" end="20" >
								<div>
									<img style="">
								</div>
							</c:forEach>
						</div>
				</div> --%>
			</div>
		</div>
	</article>
</section>
<script>
/* 텍스트 수에 따른 너비 지정시 사용 (div.paging > a 만 있을 경우) */
const width = document.getElementById('paging');
const childValue = width.children;
// let count = 0;
let countNum = 0;
for(let i = 0; i < childValue.length; i++ ){
	countNum += 1;
	//	count += childValue[i].outerText.length; a 크기 안정해져 있고 글자수에 따른 너비 정할때 사용
}
console.log('countNum : ' + countNum);
// console.log(count);
width.style.width = '0';
if(countNum > 10){
	width.style.width = '355px';
}else if(countNum > 9){
	width.style.width = '320px';
}else if(countNum > 7){
	width.style.width = '265px';
}else if(countNum > 5){
	width.style.width = '205px';
}else if(countNum > 3){
	width.style.width = '145px';
}else if(countNum > 1){
	width.style.width = '90px';
}else {
	width.style.width = '30px';
}

</script>

<script>
window.onload = function() {								// 페이지 로딩시 탭메뉴 구분을 위한 함수
	 console.log(window.location.search)
	 const url = new URL(window.location.href)
	 const urlParam = url.searchParams;
	 const type = urlParam.get('type');
	 console.log(type)
	 if(type != null){
		 if(type == 4){
			 tabChoice(4)
		 }else if(type == 3){
			 tabChoice(3)
		 }else if(type == 2){
			 tabChoice(2)
		 }else if(type == 1){
			 tabChoice(1)
		 }
	 }else{
		 tabChoice(1)
	 }
	};
	function tabChoice(num){
		const tm = document.querySelector('.tab-category > ul > li.on');
		if(tm!= null)
			tm.classList.remove('on');
		document.querySelector('.c'+num).classList.add('on');
		const view = document.querySelector('.tab-content > .view');
		const tabCont = document.querySelector('.cont'+num);
		view.classList.remove('view');
		tabCont.classList.add('view');
	}
</script>
<script>

const paging = document.querySelectorAll('.paging > a');
paging.forEach(paging=>paging.onclick=function(e){
	e.preventDefault();
	console.log(e.target.parentNode.title);
	const cateType = e.target.parentNode.title;
	let num = 1;
	if(cateType == 'best'){
		num = 4;
	}else if(cateType == 'newBook'){
		num = 3;
	}else if(cateType == 'all'){
		num = 2;
	}
	console.log(num)
	
	location.href = e.target.href + '&type=' + num;
	
});

</script>


<script>
	const tabMenu = document.querySelectorAll('.tm');
	
	tabMenu.forEach(tabMenu=>tabMenu.onclick=function(e){
		const tm = document.querySelector('.tab-category > ul > li.on');
		tm.classList.remove('on');
		e.target.classList.add('on');
		const view = document.querySelector('.tab-content > .view');
		const title = e.target.title;
		const tabCont = document.querySelector('.cont'+title);
		view.classList.remove('view');
		tabCont.classList.add('view');
		
		location.href = '${cpath }/books/category/${num }?str=${category }&start=1&type='+title;			// 탭 클릭시 해당 탭 1페이지로 이동
	});
</script>


<%@ include file="../footer.jsp" %>