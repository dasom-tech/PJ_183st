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
<script>
	function modify_go(frm) {
		frm.action="bbsController?type=modify";
		frm.submit();
	}
	
	function delete_go(frm) {
		var chk = confirm("해당 게시글을 삭제 하시겠습니까?");
		
		if(chk){
			frm.action="bbsController?type=deleteResult";
			frm.submit();
		} else{
			return;
		}
	}
	
	function list_go(frm) {
		frm.action="bbsController?type=bbs";
		frm.submit();
	}
</script>
</head>
<body>
<div id="bbs">
<form method="post">
<input type="hidden" name="bbs_no" value="${bbs_no}" />
<input type="hidden" name="cPage" value="${cPage}" />
	<table>
		<caption>상세보기</caption>
		<tbody>
			<tr>
				<th>상품번호</th>
				<td>${vo.productno }</td>
			</tr>
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
		<tfoot>
			<tr>
				<td colspan="2">
				<c:if test="${empty sessionScope.id || sessionScope.id != vo.id }">
					<input type="button" value="목 록" onclick="list_go(this.form)">
				</c:if>
				<c:if test="${!empty sessionScope.id && sessionScope.id == vo.id }">
					<input type="button" value="수 정" onclick="modify_go(this.form)">
					<input type="button" value="삭 제" onclick="delete_go(this.form)">
					<input type="button" value="목 록" onclick="list_go(this.form)">
					<input type="hidden" value="tag">
				</c:if>
				</td>
			</tr>
		</tfoot>
	</table>
</form>
</div>

</body>
</html>

