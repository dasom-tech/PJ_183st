<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="bbs">
<form action="contoroller?type=write" method="post">
	<table>
		<caption>게시판 글쓰기</caption>
		<tbody>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" size="45" title="제목">
				</td>
			</tr>
			<tr>
				<th>문의종류</th>
				<td>
					<input type="text" name="category" size="12" title="작성자">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="id" size="12" title="작성자">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="8" cols="50" title="내용"></textarea>
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="pwd" size="12" title="패스워드">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="submit" value="저 장">
					<input type="reset" value="다시 작성">
					<input type="submit" value="목 록" onclick="controller?type=write">
				</td>
			</tr>
		</tfoot>
	</table>
</form>

</div>
</body>
</html>