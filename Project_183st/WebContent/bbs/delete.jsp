<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
</head>
<body>
<form method="post">
	<input type="button" value="삭 제" onclick="del_go(this.form)">
	<input type="hidden" name="type" value="deleteResult" />
	<input type="hidden" name="bbs_no" value="${bbs_no}" />
	<input type="hidden" name="cPage" value="${cPage}" />
</form>
</body>
<script>
	function del_go(frm) {
			var isDelete = confirm("정말 삭제하시겠습니까?");
			if (isDelete) {
				frm.action="bbsController?type=bbs";
				frm.submit();
			} else {
				frm.action = "bbsController?type=bbs";
				frm.submit();
			} 
		}
</script>
</html>