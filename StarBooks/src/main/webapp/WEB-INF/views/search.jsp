<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section id="searchWrap">
	<article class="search">
<%-- 		<c:if test="${not empty count }"> --%>
		<h2>'${search }' 도서 검색 결과 (총 ${count != null ? count : 0} 개)</h2>
<%-- 		</c:if>
		<c:if test="${empty count }">
		<h2>'${search }'에 대한 검색 결과가 없습니다. (총 0 개)</h2>
		</c:if> --%>
		<div class="search-tab">
		<c:if test="${not empty bookjson }">
			<div class="search-tab-menu">
				<ul class="clearfix">
				<!-- li 불러오기 방식 : 전체는 언제나 1, 그외 분류에서 검색어가 많은 경우 순으로 배치하기
					sql할때 그룹으로 해서 조회하면 될듯.....
				 -->
					<li class="stm on" title="0">전체</li>
					<!-- 여기부터는 forEach로 처리하면 될듯 -->
					<c:forEach var="i" begin="1" end="8" step="1">					
						<li class="stm" title="${i }">제목 ${i }</li>
					</c:forEach>
				</ul>
			</div>
			
			<div class="search-tab-content">
				<c:forEach var="i" begin="0" end="8">
					<div class="stCont${i } ${i == 0 ? 'view' : '' }">
						<h2>목록 ${i }</h2>
						<ul>
						<c:forEach var="j" begin="0" end="19" items="${bookjson }">
							<li>
								<div class="clearfix">
									<img src="${j.image }">
									<div>
									<h4>${j.title }</h4>
									<p>작가 : ${j.author} || 출판사 : ${j.publisher} || 출판일자 : ${j.pubdate }</p>
									<p> 
										${j.description } 
									</p>
									</div>
								</div>
							</li>
						</c:forEach>
						</ul>
					</div>
				</c:forEach>
			</div>
			<div class="paging clearfix" id="paging">
				
				<c:if test="${paging.prev }">
					<div class="page-prev">
					<a href="${cpath }/search/${search }?start=${paging.begin -1 }">이전</a>
					</div>
				</c:if>
				<div class="page-current clearfix">
				<c:forEach var="i" begin="${paging.begin }" end="${paging.end }" >				
					<a href="${cpath }/search/${search }?start=${i }" ${paging.page == i ? 'class="ch"' : '' }>
						${i }
					</a>
				</c:forEach>
				</div>
				
				<c:if test="${paging.next }">
					<div class="page-next">
					<a href="${cpath }/search/${search }?start=${paging.end +1}">다음</a>
					</div>
				</c:if>
				
			</div>
			</c:if>
			
			<c:if test="${empty bookjson }">
				<div style="width : 340px; margin : 50px auto;">
					<i class="xi-eye-off-o xi-5x" style="display : block;width : 100px; margin : 20px auto 10px; color : #ccc; font-size : 100px"></i>
					<h3 style="display : block; width : 274px; margin : 0 auto 20px;color : #ccc; font-size : 30px">검색결과가 없습니다.</h3>
				</div>
			</c:if>
		</div>
		
		
	</article>
</section>
<script type="text/javascript">
// 페이징 css - 너비
const width = document.getElementById('paging');
const count = width.childElementCount;
const parent = document.querySelector('.page-current');
const countA = parent.childElementCount;
console.log(count)
if(count == 1){
	width.style.width = (countA * 42) +'px';
}else if(count == 2){
	width.style.width = (countA * 42 + 45) +'px';
}else if(count == 3){
	width.style.width = (countA * 42 + 90) +'px';
}

/* 텍스트 수에 따른 너비 지정시 사용 (div.paging > a 만 있을 경우)
const width = document.getElementById('paging');
const childValue = width.children;
let count = 0;
console.log(count);
for(let i = 0; i < childValue.length; i++ ){
	count += childValue[i].outerText.length;
}
if(count > 39){
	width.style.width = '550px';
}else if(count > 25){
	width.style.width = '450px';
}else if(count > 15){
	width.style.width = '300px';
}else {
	width.style.width = '170px';
}
*/

</script>
<script type="text/javascript">
/* const bks= "${bookjson}"
const books = JSON.parse(bks);
console.log (books) */
const stabMenu = document.querySelectorAll('.stm');

stabMenu.forEach(stabMenu=>stabMenu.onclick=function(e){
	const stm = document.querySelector('.search-tab-menu > ul > li.on');
	stm.classList.remove('on');
	e.target.classList.add('on');
	const sview = document.querySelector('.search-tab-content > .view');
	const title = e.target.title;
	console.log(title);
	const sCont = document.querySelector('.stCont'+title);
	sview.classList.remove('view');
	sCont.classList.add('view');
});

</script>
<%@ include file="footer.jsp" %>