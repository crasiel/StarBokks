<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${cpath }/resources/css/member.css">
</head>
<body>
<h1>STARBOOKS</h1>
<hr>

<script type="text/javascript">
	const h1 = document.querySelector('h1');
	h1.onclick = function(){
	    location.href='${cpath}/'
	}
</script>
