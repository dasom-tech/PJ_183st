<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
<style type="text/css">
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
	#bbs table th {
		background-color: lightsteelblue;
		border: 1px solid black;
		padding: 4px 10px;
		width: 15%;
	}
	#bbs table td {
		text-align: center;
		border: 1px solid black;
		padding: 4px 10px;
	}
</style>
</head>
<body>
	<div id="bbs">
<%-- 게시글 내용 표시 --%>
<form method="post">
	<table>
		<caption>상세보기</caption>
		<tbody>
			<tr>
				<th>제목</th>
				<td>${vo.subject }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${vo.id }</td>
			</tr>
			<tr>
				<th>문의종류</th>
				<td>${vo.category }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${vo.contact }</td>
			</tr>
		</tbody>
	</table>
</form>
</div>

</body>
</html>














