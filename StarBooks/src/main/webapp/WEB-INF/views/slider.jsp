<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<section id="slider">
 	<div class="slider-main clearfix">
    	<div class="slider-item" style="background: yellow;">your content</div>
   	 	<div class="slider-item"  style="background:green;">your content</div>
    	<div class="slider-item"  style="background:skyblue;">your content</div>
    	<div class="slider-item"  style="background:blue;">your content</div>
    	<div class="slider-item"  style="background:teal;">your content</div>
    	<div class="slider-item"  style="background:coral;">your content</div>
    	<div class="slider-item"  style="background:orange;">your content</div>
  </div>
	<script type="text/javascript">
	$(document).ready(function(){
    $('.slider-main').slick({
    	slide : 'div',
    	infinite : true,
    	slidesToShow: 3,
    	slidesToScroll: 1,
    	arrows : true,
    	autoplay: true,
    	prevArrow : "<div class='arrowLeft'><div class='prev'></div></div>",
    	nextArrow : "<div class='arrowRight'><div class='next'></div></div>",
    	autoplaySpeed: 1500,
    	pauseOnhover : true,
    	centerMode:true,
    	centerPadding : '300w',
    	responsive : [
    		{
    			breakpoint : 1440,
    			settings : {
    				centerPadding : '20w',
    			}
    		},
    		{
    			breakpoint : 1040,
    			settings : {
    				slidesToShow: 2,
    				centerPadding : '0',
    				arrows : false,
    			}
    		},
    		{
    			breakpoint : 760,
    			settings :{
    				slidesToShow: 1,
    				centerPadding : '0',
    				arrows : false,
    			}
    		}
    	]
    	});
	});

	</script>
</section>
    
<section id="iconMenu">
	<article class="iconWrap">
		<ul class="clearfix">
			<li><a href="${cpath }/books/newBook"><div style="background-color : #e8cb99"><i class="xi-new-o xi-3x"></i></div><span>신간</span></a></li>
			<li><a href="${cpath }/books/bestSeller"><div style="background-color : #b9bef1"><i class="xi-trophy xi-3x"></i></div><span>베스트셀러</span></a></li>
			<li><a href="${cpath }/event/event"><div style="background-color : #99d1cb"><i class="xi-gift-o xi-3x"></i></div><span>이벤트</span></a></li>
			<li><a href="${cpath }/books/"><div style="background-color : #f0b9b9"><i class="xi-library-bookmark xi-3x"></i></div><span>선호작품</span></a></li>
			<li><a href="${cpath }/books/"><div style="background-color : #99c0e1"><i class="xi-rotate-right xi-3x"></i></div><span>기다리면무료</span></a></li>
			<li><a href="${cpath }/books/"><div style="background-color : #e8b4ce"><i class="xi-face xi-3x"></i></div><span>매일랜덤티켓</span></a></li>
			<li><a href="${cpath }/books/"><div style="background-color : #f1c0a7"><i class="xi-calendar xi-3x"></i></div><span>신작캘린더</span></a></li>
			<li><a href="${cpath }/books/"><div style="background-color : #abdcba"><i class="xi-thumbs-up xi-3x"></i></div><span>MD추천</span></a></li>
			<li><a href="${cpath }/books/"><div style="background-color : #d5adeb"><i class="xi-coupon xi-3x"></i></div><span>위클리쿠폰</span></a></li>
		</ul>
	</article>
</section>