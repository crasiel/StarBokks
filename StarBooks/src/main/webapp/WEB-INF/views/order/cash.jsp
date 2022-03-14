<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section id="mystarWRap" class="clearfix">
<%@ include file="leftwrap.jsp" %>
   <div class="rightWrap">
   <h2>스타캐시</h2>
	<form id="cashForm">
	<div class="table-wrap">
	<h3>내 스타캐시 <strong>0원</strong></h3>
		<ul class="cash-table">
       <li class="clearfix"><p style="text-align: center">스타캐시 충전</p><p>적립률</p><p>스타포인트 적립</p></li>
        <li class="clearfix">
            <p><input type="radio" name="cash" id="cash2000" value="2000"><label for="cash2000">2,000원</label></p>
            <p><label for="cash2000">3%</label></p>
            <p><label for="cash2000">60원</label></p>
        </li>
        <li class="clearfix">
            <p><input type="radio" name="cash" id="cash5000" value="5000"><label for="cash5000">5,000원</label></p>
            <p><label for="cash5000">3%</label></p>
            <p><label for="cash5000">150원</label></p>
        </li>
        <li class="clearfix">
            <p><input type="radio" name="cash" id="cash10000" value="10000"><label for="cash10000">10,000원</label></p>
            <p><label for="cash10000">3%</label></p>
            <p><label for="cash10000">300원</label></p>
        </li>
        <li class="clearfix">
            <p><input type="radio" name="cash" id="cash20000" value="20000"><label for="cash20000">20,000원</label></p>
            <p><label for="cash20000">3%</label></p>
            <p><label for="cash20000">600원</label></p>
        </li>
        <li class="hr-line"></li>
        <li class="clearfix">
            <p><input type="radio" name="cash" id="cash30000" value="30000"><label for="cash30000">30,000원</label></p>
            <p><label for="cash30000">3%</label></p>
            <p><label for="cash30000">600원</label></p>
        </li>
        <li class="clearfix active">
            <p><input type="radio" name="cash" id="cash50000" value="50000" checked><label for="cash50000">50,000원</label></p>
            <p><label for="cash50000">3%</label></p>
            <p><label for="cash50000">600원</label></p>
        </li>
        <li class="clearfix">
            <p><input type="radio" name="cash" id="cash70000" value="70000"><label for="cash70000">70,000원</label></p>
            <p><label for="cash70000">3%</label></p>
            <p><label for="cash70000">600원</label></p>
        </li>
        <li class="hr-line"></li>
        <li class="clearfix">
            <p><input type="radio" name="cash" id="cash100000" value="100000"><label for="cash100000">100,000원</label></p>
            <p><label for="cash100000">5%</label></p>
            <p><label for="cash100000">5,000원</label></p>
        </li>
        <li class="clearfix">
            <p><input type="radio" name="cash" id="cash200000" value="200000"><label for="cash200000">200,000원</label></p>
            <p><label for="cash200000">5%</label></p>
            <p><label for="cash200000">10,000원</label></p>
        </li>
        <li class="clearfix">
            <p><input type="radio" name="cash" id="cash300000" value="300000"><label for="cash300000">300,000원</label></p>
            <p><label for="cash300000">5%</label></p>
            <p><label for="cash300000">15,000원</label></p>
        </li>
    </ul>
		</div>
		<p style="position : relative; width : 200px;">
			<input type="submit" value="캐시충전">
			<i class="xi-money xi-x" style="position : absolute; top : 12px; left : 45px; color : white"></i>
		</p>
	</form>
	</div>
</section>

<script>
    const radio = document.querySelectorAll('input[name="cash"]')
    radio.forEach(radio=>radio.onchange=function(e){
        console.log(e.target.checked)

        const li = e.target.parentNode.parentNode;
        const prevli = document.querySelector('.active');
        prevli.classList.remove('active');

        if(e.target.checked == true){
            li.classList.add('active');
        }
    });
</script>

</body>
</html>