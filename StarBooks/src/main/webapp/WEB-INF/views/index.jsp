<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    


<%@ include file="slider.jsp" %>
    <section id="NewBookSlide"  style="margin-bottom : 70px;">
        <h1 style="width : 70%; margin : 0 auto; cursor: pointer;"  onclick="location.href='${cpath}/books/newBook'" title="신간도서 더보기">신간도서</h1>
        <article class="new-book-slide">
        		<c:if test="${not empty newBook}">
        	<c:forEach var="newBook" items="${newBook }" begin="7" end="26">
        		<div style="width : 180px">
        			<div class="imgbg" style="background: url('${newBook.coverLargeUrl }') center no-repeat;  background-size: cover; "></div>
        			<h3 style="width : 95%; display : -webkit-box; white-space : normal;overflow : hidden; -webkit-line-clamp : 2; -webkit-box-orient : vertical;  margin : 5px auto 5px; color : lightgoldenrodyellow;font-size : 14px; overflow: hidden;">${newBook.title }</h3>
        			<p style="color : #ddd; font-weight: bold; font-size: 12px;">${newBook.author }</p>
        		</div>
        	</c:forEach>
        		</c:if>
        </article>
    </section>
    
    <script type="text/javascript">
    $(document).ready(function(){
      $('.new-book-slide').slick({
    		  dots: true,
    		  infinite: true,
    		  speed: 300,
    		  slidesToShow: 5,
    		  slidesToScroll: 5,
    		  responsive: [
    		    {
    		      breakpoint: 1350,
    		      settings: {
    		        slidesToShow: 4,
    		        slidesToScroll: 4,
    		        infinite: true,
    		        dots: true
    		      }
    		    },
    		    {
    		      breakpoint: 1050,
    		      settings: {
    		        slidesToShow: 3,
    		        slidesToScroll: 3
    		      }
    		    },
    		    {
    		      breakpoint: 700,
    		      settings: {
    		        slidesToShow: 2,
    		        slidesToScroll: 2
    		      }
    		    }
    		    // You can unslick at a given breakpoint now by adding:
    		    // settings: "unslick"
    		    // instead of a settings object
    		  ]
      });
    });
  </script>
    
    <section id="recommendWrap" style="margin-bottom : 70px;">
        <h1>MD픽! 추천 도서</h1>
        <div class="recommend" style="width : 80%; margin : 0 auto;">
					<div class="book-grid" style="display : grid; grid : repeat(1, 100%)/auto-flow 25%;grid-row-gap: 10px;">
							<c:forEach var="book" items="${recommend }" begin="0" end="3">
								<div style=" width : 220px; height : 300px; margin : 0 auto; ">
									<img src="${book.coverLargeUrl }" style="display: block; width: 80%; height : 250px;margin: 0 auto;">
									<div style="width : 90%; margin : 0 auto;">
										<h3 style="line-height:30px;font-size: 16px;">${book.title }</h3>
										<p style="font-size : 13px; color : #aaa">${book.author }</p>
									</div>
								</div>
							</c:forEach>
						</div>
				</div>
    </section>
    
    <section id="bestWrap">
    <h1 onclick="location.href='${cpath}/books/bestSeller'" title="베스트셀러 더보기" style="cursor: pointer;">베스트셀러</h1>
    	<div class="week">
    		<ul  class="grid">
    		<c:forEach var="best" items="${best }" begin="0" end="8">
    			<li class="clearfix">
    				<div class="bookImg"><a href=""><img src="${best.coverSmallUrl}"></a></div>
    				<div class="clearfix">
    					<h3>${best.rank }</h3>
    					<div class="subTitle">
    							<h3 class="fh3">${best.title }</h3>
    							<h4 class="fh4">${best.author }</h4>
    					</div>
    				</div>
    			</li>
    		</c:forEach>
    		</ul>
    	</div>
    </section>
    
     <section id="week-bestWrap">
        <h1 onclick="location.href='${cpath}/books/weekPick/105'" title="주간 PICK 더보기" style="cursor: pointer;">주간 Pick! 역사 기행</h1>
       <div class="week">
    		<ul  class="grid">
    		<c:forEach var="history" items="${history }" begin="0" end="8">
    			<li class="clearfix">
    				<div class="bookImg"><a href=""><img src="${history.coverSmallUrl}"></a></div>
    				<div class="clearfix">
    					<h3>${history.rank }</h3>
    					<div class="subTitle">
    							<h3 class="fh3">${history.title }</h3>
    							<h4  class="fh4">${history.author }</h4>
    					</div>
    				</div>
    			</li>
    		</c:forEach>
    		</ul>
    	</div>
    </section>
     
<!--     <section id="TabWrap">
        <div>
            <div id="tabBtn">
                <ul class="clearfix">
                    <li class="on">tab1</li>
                    <li>tab2</li>
                    <li>tab3</li>
                </ul>
            </div>
            <div>
                <div id="tabCont1" class="on">사람들이 지금 많이 읽고 있는 책</div>
                <div id="tabCont2">베스트셀러</div>
                <div id="tabCont3">cont3</div>
            </div>
        </div>
    </section> -->

<%@ include file="footer.jsp" %>