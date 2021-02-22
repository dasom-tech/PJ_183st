<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<script>

</script>
</head>
<body>

	<h1>주문 내역</h1>
	<table>
	<tr>
		<th>주문번호</th>
		<th>상품명</th>
		<th>결제금액</th>
	</tr>
	<c:forEach var="list" items="${OrderList }">
	<tr>
		<td><a href="OrderController?type=orderDetail&orderid=${list.orderid }">${list.orderid }</a></td>
		<td>${list.productname }</td>
		<td>${list.totalprice }</td>
	</tr>
	</c:forEach>
	</table>
	<button onclick="location.href='main.jsp'">돌아가기</button>


</body>
</html>