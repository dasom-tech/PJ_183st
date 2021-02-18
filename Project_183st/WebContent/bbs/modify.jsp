<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script>
	function sendData(frm) {
		
		frm.action="bbsController?type=modifyResult";
		frm.submit();
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
		<caption>게시글수정</caption>
		<tbody>
			<tr>
				<th>상품번호</th>
				<td>
					<input type="text" name="productno" size="10" title="상품번호"
							value="${vo.productno }" readonly>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" size="45" title="제목"
							value="${vo.subject }">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="id" size="12" title="작성자"
							value="${vo.id }" readonly>
				</td>
			</tr>
			<tr>
				<th>문의종류</th>
				<td>
					<select name="category" title="문의종류">
						<option selected disabled>::문의종류</option>
						<option value="배송문의" <c:if test="${vo.category == '배송문의' }"> selected </c:if>>배송문의</option>
						<option value="상품문의" <c:if test="${vo.category == '상품문의' }"> selected </c:if>>상품문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="contant" rows="35" cols="50" title="내용">${vo.contact }</textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수 정" onclick="sendData(this.form)">
					<input type="reset" value="다시 작성">
					<input type="button" value="목 록" onclick="list_go(this.form)">
				</td>
			</tr>
		</tfoot>		
	</table>
</form>

</div>

</body>
</html>


