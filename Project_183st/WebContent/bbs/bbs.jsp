<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA게시판</title>
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
	/***** 페이지 표시 부분 스타일(끝) ****/
</style>
</head>
<body>
<div id="bbs">
<table>
	<caption>문의게시판</caption>
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>문의종류</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan="5">
				<p>현재 등록된 게시글이 없습니다</p>
			</td>
		</tr>
	</c:if>
	<c:if test="${not empty list }">
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.bbs_no }</td>
				<td>
					<a href="bbsController?type=detail&bbs_no=${vo.bbs_no }&cPage=${page.nowPage }">${vo.subject }</a>
				</td>
				<td>${vo.id }</td>
				<td>${vo.category }</td>
				<td>${vo.q_reg.substring(0,10) }</td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">
				<ol class="paging">
			<%--[이전으로]에 대한 사용 여부처리 : 시작페이지 1인 경우 비활성화 --%>	
			<c:choose>
				<c:when test="${page.beginPage == 1 }">
					<li class="disable">이전으로</li>
				</c:when>
				<c:otherwise>
					<li><a href="bbsController?type=bbs&cPage=${page.beginPage - 1 }">이전으로</a></li>
				</c:otherwise>
			</c:choose>
			<%-- 블록내에 표시할 페이지 태그 작성(시작페이지 ~ 끝페이지)
				현재페이지와 페이지 번호 같으면 현재페이지 처리 --%>
			<c:forEach var="pageNo" begin="${page.beginPage }" end="${page.endPage }">
				<c:if test="${pageNo == page.nowPage }">
					<li class="now">${pageNo }</li>	
				</c:if>
				<c:if test="${pageNo != page.nowPage }">
					<li>
						<a href="bbsController?type=bbs&cPage=${pageNo }">${pageNo }</a>
					</li>
				</c:if>
			</c:forEach>
			<%--[다음으로]에 대한 사용여부 처리 : endPage가 전체페이지수(totalPage)보다 작은경우 활성화--%>
			<c:if test="${page.endPage < page.totalPage }">
				<li>
					<a href="bbsController?type=bbs&cPage=${page.endPage + 1 }">다음으로</a>
				</li>
			</c:if>
			<c:if test="${page.endPage >= page.totalPage }">
				<li class="disable">다음으로</li>
			</c:if>
				</ol>
			</td>
			<td>
			<form action="bbsController?type=write" method="post">
				<input type="submit" value="글쓰기">
				<input type="hidden" name="cPage" value="${page.nowPage }"/>	
			</form>
			</td>
		</tr>
	</tfoot>
</table>

</div>
	
</body>
</html>