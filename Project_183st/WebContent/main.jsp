<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<body>
	<h1>테스트를 위한 메인 페이지</h1>
	<hr>
	<c:if test="${!empty sessionScope.id && !empty sessionScope.pwd }">
	<h2>${sessionScope.id } 님 환영합니다</h2>
	<a id="logout" href="memberController?type=logout">로그아웃</a>
	<a id="modify" href="memberController?type=modifyMove">정보 수정</a>
	<a href="Member/leave.jsp">회원 탈퇴</a>
	<a href="CartController?type=cart">장바구니</a>
	<a href="OrderController?type=orderList">주문내역확인</a>
	</c:if>
	<c:if test="${empty sessionScope.id && empty sessionScope.pwd }">
	<a id="login" href="memberController?type=loginMove">로그인</a>
	<a id="join" href="memberController?type=joinMove">회원 가입</a>
	<a id="bbs" href="bbsController?type=bbs">테스트</a>
	</c:if>
	
</body>
</html>