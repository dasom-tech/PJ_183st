<%@page import="com.bc.product.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<script>
</script>

</head>
<body>
<form method="get" id="submitForm">
<input type="button" value="돌아가기" onclick="history.go(-1);">
	<table>
		<thead>
			<tr>
				<th width="15%">상품번호</th>
				<th width="20%">상품명</th>
				<th width="20%">가격</th>
				<th width="20%">재고</th>
				<th width="20%">상품설명</th>
			<tr>
		</thead>
		<tbody>
			<c:if test="${not empty info}">
				<tr>
					<td>${info.getProductno()}</td>
					<td>${info.getProductname()}</td>
					<td>${info.getPrice()}원</td>
					<td>${info.getStock()}</td>
					<td>${info.getInfo()}</td>
				</tr>	
			</c:if>	
			<c:if test="${empty info}">
				<tr>
					<td colspan='5'>현재 판매중인 상품이 아닙니다</td>
				</tr>
			</c:if>	
		</tbody>
	</table>
</form>
</body>
</html>