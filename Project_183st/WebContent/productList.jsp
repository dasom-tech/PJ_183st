<%@page import="com.bc.product.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% 
	String producttype = request.getParameter("producttype");
	if(producttype == null) {
		producttype = "";
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<style>
	#titleArea{position:relative;border-bottom:1px solid #c2c2c2;background-color:#fff;}
	#titleArea h2{padding:0 61px 10px 61px;line-height:20px;font-size:15px;color:#2e2e2e;text-align:center;}
	
	.join_form { border:1px solid black; border-collapse:collapse; border-style: solid;}
	.join_form tr { border:1px solid black; border-style: solid none; }
</style>
<style>
	#bbs table {
		width: 580px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bbs table th, #bbs table td {
		text-align: center;
		border: 1px solid black;
		padding: 4px 10px;
	}
	#bbs .align-left { text-align: left; }
	
	.title { background-color: lightsteelblue; }
	
	.no { width: 10%; }
	.writer { width: 15%; }
	.regdate { width: 20%; }
	.hit { width: 15%; }
	
	/***** 페이지 표시 부분 스타일(시작) ****/
	.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #ff4aa5;
	}
	.paging li a:hover {
		background-color: #00B3DC;
		color: white;
	}
	.center {
		text-align: center;
	}
	/***** 페이지 표시 부분 스타일(끝) ****/
</style>
<script>
	function all_search(frm) {
		frm.action = "product_controller?viewType=list&cPage=1";
		frm.submit();
	}
	function top_search(frm) {
		producttype = "T";
		frm.action = "product_controller?viewType=list&producttype=T&cPage=1";
		frm.submit();
	}
	function bottom_search(frm) {
		producttype = "B";
		frm.action = "product_controller?viewType=list&producttype=B&cPage=1";
		frm.submit();
	}
	function detail_view(productno){
		var frm = document.getElementById("submitForm");
		frm.action="product_controller?viewType=info&productno="+productno;
		frm.submit();
	}
	function paging_click(producttype, pageNo){
		var frm = document.getElementById("submitForm");
		frm.action = "product_controller?viewType=list&producttype="+producttype+"&cPage="+pageNo;		
		frm.submit();
	}	

</script>

</head>

<body>
<form method="post" id="submitForm">
	<input type="button" value="All" onclick="all_search(this.form)">
	<input type="button" value="Top" onclick="top_search(this.form)">
	<input type="button" value="Bottom" onclick="bottom_search(this.form)">
	
	<div id="bbs">
		<table>
			<thead>
				<tr>
					<th width="15%">상품번호</th>
					<th width="20%">상품명</th>
					<th width="20%">가격</th>
				<tr>
			</thead>
			<tbody>
				<c:if test="${not empty list}">
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.getProductno() }</td>
							<td>
								<a href="#" onclick="detail_view('${vo.getProductno()}');">${vo.getProductname()}</a>
							</td>
							<td>${vo.getPrice()}원</td>
						</tr>	
					</c:forEach>
				</c:if>	
				<c:if test="${empty list}">
				</c:if>	
			</tbody>
			<tfoot>
				<tr align="center">
					<td colspan="5" align="center">
						<ol class="paging" id="paging">
							<c:forEach var="i" begin="1" end="${totalPage}">
								<c:choose>
									<c:when test="${i == cPage}">
										<li class="now">
											${i}
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="#" onclick="paging_click('<%=producttype%>',${i});">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ol>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</form>
</body>
</html>