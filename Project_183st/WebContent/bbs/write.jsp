<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function list_go(frm) {
			frm.action="bbsController?type=bbs";
			frm.submit();
	}
	
	function sendData() {
		var firstForm = document.forms[0];
		for (var i=0; i<firstForm.elements.length; i++) {
			console.log(firstForm.elements[i]);
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + "을(를) 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		
		firstForm.submit();
	}
</script>
</head>
<body>
<div id="bbs">
<form action="bbsController?type=writeResult" method="post">
<input type="hidden" name="cPage" value="${cPage}" >
	<table>
		<caption>게시판 글쓰기</caption>
		<tbody>
			<tr>
				<th>상품번호</th>
				<td>
					<select name="productno" title="상품번호">
						<option selected disabled value="">::상품번호</option>
						<c:forEach var="no" items="${plist }">
						<option>${no }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" size="45" title="제목">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input readonly type="text" name="id" size="12" title="작성자" value="${sessionScope.id }">
				</td>
			</tr>
			<tr>
				<th>문의종류</th>
				<td>
					<select name="category" title="문의종류">
						<option selected disabled value="">::문의종류</option>
						<option value="배송문의">배송문의</option>
						<option value="상품문의">상품문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="35" cols="50" title="내용"></textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="저 장" onclick="sendData()">
					<input type="button" value="목 록" onclick="list_go(this.form)">
				</td>
			</tr>
		</tfoot>
	</table>
</form>

</div>
</body>
</html>