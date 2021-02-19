<%@page import="com.bc.product.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 전달받은 제품번호를 사용해서 DB데이터 조회 후 화면 표시 --%>
	<%-- 액션태그 useBean scope 상에 id명 속성값이 
		있으면 사용하고, 없으면 클래스 속성 타입의 객체 생성 + scope 등록--%>
	<jsp:useBean id="dao" class="com.bc.product.ProductDAO" scope="session" />
<%
	//전달 받은 값 추출(파라미터 값)
	String productno = request.getParameter("productno");
	//EL, JSTL 사용을 위한 속성값 설정
	pageContext.setAttribute("vo", dao.selectProductInfo(productno));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<style>
	table {
		width: 600px;
		margin: 30px auto 0; /* 상 좌우 하 */
		border: 1px solid navy;
		border-collapse: collapse;
		font-size: 0.8em;
	}
	th, td { border: 1px solid navy; padding: 4px; }
	th { background-color: #ddd; }
	.red { color: red; }
	
	.title { width: 30%; }
	tfoot { text-align: center; height: 3em; }
</style>
</head>

<body>
	<form action="CartController?type=insertItem" method="post" id="submitForm">
		<table border="1" style="height: 300px; width: 400px;">
			<tr>
				<td>
					<img src="images/${vo.getImage_s()}" alt="제품이미지" width="340" height="300">
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
				</td>
			</tr>
		</table>
		<div>
			<img src="images/${vo.getImage_l() }" alt="제품이미지">
		</div>		
	</form>
</body>
</html>