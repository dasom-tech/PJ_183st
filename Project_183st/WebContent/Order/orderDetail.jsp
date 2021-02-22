<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 확인</title>
</head>
<body>
	<h1>주문 상세</h1>
	<p>${OrderInfo.name }님의 주문 내역입니다</p>
	
	<ul>
		<c:forEach var="list" items="${OrderDetail }">
			<li>
				<div>
					<p>상품명 : ${list.productname }</p>
					<p>가격 : ${list.price}</p>
					<p>주문 수량 : ${list.o_amount }
				</div>
			</li>
		</c:forEach>
	</ul>
	<p>사용한 포인트 : ${OrderInfo.point }</p>
	<p>총 결제 금액 : ${OrderInfo.totalprice }</p>
	<hr>
	<h3>배송 정보</h3>
	<div>
		<p>이름 : ${OrderInfo.name }</p>
		<p>주소 : ${OrderInfo.addr }</p>
		<p>전화번호 : ${OrderInfo.phone }</p>
	</div>
	
</body>
</html>