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
</head>

<body>
	<form action="CartController?type=insertItem" method="post" id="submitForm">
		<table border="1" style="height: 300px; width: 400px;">
			<tr>
				<td>
					<img src="" width="340" height="300">
				</td>
				<td align="center">
					<table border="1" style="height: 300px; width: 400px;">
					<c:if test="${not empty info}">
						<tr align="center">
							<td width="15%">상품번호</td>
							<td>${info.getProductno()}</td>
						</tr>
						<tr align="center">
							<td width="20%">상품명</td>
							<td>${info.getProductname()}</td>
						</tr>
						<tr align="center">
							<td width="20%">가격</td>
							<td>${info.getPrice()}원</td>
						</tr>
						<tr align="center">
							<td width="20%">재고</td>
							<td>${info.getStock()}</td>
						</tr>
						<tr align="center">
							<td width="20%">상품설명</td>
							<td>${info.getInfo()}</td>
						</tr>
						<tr align="center">
							<td colspan="2">
									<input type="hidden" name="productno" value="${info.getProductno()}">
									<select name="amount">
										<c:forEach begin="1" end="10" var="i">
											<option value="${i}">${i}</option>
										</c:forEach>
									</select>&nbsp;개
								<input type="submit" value="장바구니에 담기">
								<input type="submit" value="주문하기"><br><br>
							</td>
						</tr>
						</c:if>
						<c:if test="${empty info}">
							<tr>
								<td colspan='5'>현재 판매중인 상품이 아닙니다</td>
							</tr>
						</c:if>	
					</table>
					<input type="button" value="상품목록으로 가기" onclick="history.go(-1);">
				</td>
			</tr>
		</table>
	</form>
	
<%-- 상품에 대한 리뷰 작성 영역 --%>
<form action="ans_write_ok.jsp" method="post">
	<p>이름 : <input type="text" name="writer">
		비밀번호 : <input type="password" name="pwd"></p>
	<p>내용 : <textarea name="content" rows="4" cols="55"></textarea>
	<input type="submit" value="리뷰 저장">
	<input type="hidden" name="b_idx" value="${bvo.b_idx }">
</form>

<hr>
<p>리뷰</p>
<hr>
<%-- 상품에 작성된 리뷰 표시 영역 --%>
<c:forEach var="vo" items="${clist }">
<div class="comment">
	<form action="ans_del.jsp" method="post">
		<p>이름 : ${commVO.writer } &nbsp; 날짜: ${commVO.write_date }</p>
		<p>내용 : ${commVO.content }</p>
		<input type="submit" value="리뷰 삭제">
		<input type="hidden" name="" value="${commVO.c_idx }">
		<input type="hidden" name="pwd" value="${commVO.pwd }">
		<%-- 리뷰 삭제처리후 상품 상세페이지로 이동 --%>
		<input type="hidden" name="b_idx" value="${commVO.b_idx }">
	</form>
</div>
<hr>
</c:forEach>

</body>
</html>