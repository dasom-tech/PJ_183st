<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA게시판</title>
<link href="css/button.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="path_role" content="MAIN">
<meta name="author" content="183번가">
<meta name="description" content="183번가 - 의류 쇼핑몰">
<meta name="keywords" content="183ST">
<link rel="stylesheet" type="text/css" href="reset.css">
<link rel="stylesheet" type="text/css" href="common.css">
<link rel="stylesheet" type="text/css" href="style.css">
<link href="css/menu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="bbs/bbs.css">
<script src="main.js" defer></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lexend+Mega&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<script>
	function errorWrite(frm) {
		alert("회원에게만 글쓰기 권한이 있습니다. \n 로그인 후 이용해 주세요");
	}
	
	function writeBBS(frm) {
		frm.action="bbsController?type=write"
		frm.submit();
	}
	
	function logoutChk(){
		var chk = confirm("로그아웃 하시겠습니까?");
		
		if(chk){
			location.href="memberController?type=logout";
		} else{
			return;
		}
	}
	
	function needLogin(){
		alert("로그인이 필요한 기능입니다");
		location.href="memberController?type=loginMove";
	}
</script>
</head>
<body>
	<div class="body_wrap">
		<header>
			<div id="loading"></div>
			<div class="wrap">
				<div class="header_menu">
					<a href="#" class="toggle"><i class="fas fa-bars"></i></a>
					<c:if test="${empty sessionScope.id }">
                        <a href="memberController?type=loginMove" style="font-size: 13px">LOGIN</a>
                    </c:if>
                    <c:if test="${!empty sessionScope.id }">
                        <a href="#" onclick="logoutChk()" style="font-size: 13px">LOGOUT</a>
                       	<a href="memberController?type=myPage" style="font-size: 13px">MYPAGE</a>
                    </c:if>
				</div>
				
				<div class="header_logo">
					<a href="shop183st.jsp">183번가</a>
				</div>
				<div class="header_menu">
					<a href=""><i class="fas fa-search"></i></a>
					<c:if test="${!empty sessionScope.id }">
						<a href="CartController?type=cart"><i
							class="fas fa-shopping-cart"></i></a>
					</c:if>
					<c:if
						test="${empty sessionScope.id || sessionScope.id == '' || sessionScope.id == 'null' || sessionScope.id eq null }">
						<a href="#" onclick="needLogin()"><i
							class="fas fa-shopping-cart"></i></a>
					</c:if>
				</div>
			</div>
		</header>

	    <nav class="menu">
	        <div class="wrap">
	            <ul>
	            	<li class="title">
	            		<a href="#none" style="color: black;">STORE</a><br>
	             	<ul class="sub" style="display: block;">
	                  <li><a href="product_controller?viewType=list&cPage=1">ALL</a></li><br>		                        
	                  <li><a href="product_controller?viewType=list&producttype=T&cPage=1">TOP</a></li><br>	
	                  <li><a href="product_controller?viewType=list&producttype=B&cPage=1">BOTTOM</a></li><br>	
	             	</ul>
	             </li>
	             <br><br>
	             <li class="title">
	                	<a href="#none" style="color: black;">BOARD</a><br>
	                	<ul class="sub" style="display: block;">
		                  <li><a href="bbsController?type=bbs">Q&A</a></li><br>		                        
		                 <c:if test="${empty sessionScope.id }">
		                 	<li><a href="#" onclick="needLogin()">MYPAGE</a></li>
		                 </c:if>
		                 <c:if test="${!empty sessionScope.id }">
		                    <li><a href="memberController?type=myPage">MYPAGE</a></li>
		                 </c:if>
	            		</ul>
	           		</li>
	           	</ul>
	        </div>
	    </nav>
		
	<main>
	<div class="warp" style="min-height: 820px;">
		<div id="bbs">
			<table>
				<caption>183st 문의게시판</caption>
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
								<td><a
									href="bbsController?type=detail&bbs_no=${vo.bbs_no }&cPage=${page.nowPage }">${vo.subject }</a>
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
										<li><a
											href="bbsController?type=bbs&cPage=${page.beginPage - 1 }">이전으로</a></li>
									</c:otherwise>
								</c:choose>
								<%-- 블록내에 표시할 페이지 태그 작성(시작페이지 ~ 끝페이지) 현재페이지와 페이지 번호 같으면 현재페이지 처리 --%>
								<c:forEach var="pageNo" begin="${page.beginPage }"
									end="${page.endPage }">
									<c:if test="${pageNo == page.nowPage }">
										<li class="now">${pageNo }</li>
									</c:if>
									<c:if test="${pageNo != page.nowPage }">
										<li><a href="bbsController?type=bbs&cPage=${pageNo }">${pageNo }</a>
										</li>
									</c:if>
								</c:forEach>
								<%--[다음으로]에 대한 사용여부 처리 : endPage가 전체페이지수(totalPage)보다 작은경우 활성화--%>
								<c:if test="${page.endPage < page.totalPage }">
									<li><a
										href="bbsController?type=bbs&cPage=${page.endPage + 1 }">다음으로</a>
									</li>
								</c:if>
								<c:if test="${page.endPage >= page.totalPage }">
									<li class="disable">다음으로</li>
								</c:if>
							</ol>
						</td>
						<td>
							<form action="bbsController?type=write" method="post">
								<c:if test="${empty sessionScope.id }">
									<input type="button" value="문의하기" class="button" onclick="errorWrite(this.form)">
								</c:if>
								<c:if test="${!empty sessionScope.id }">
									<input type="button" value="문의하기" class="button" onclick="writeBBS(this.form)">
									<input type="hidden" name="cPage" value="${page.nowPage }" />
								</c:if>
							</form>
						</td>
					</tr>
				</tfoot>
			</table>
			</div>
		</div>
		</main>
		
		<footer>
			<div class="wrap">
				<section class="footer_left">
					<div class="footer_terms">
						<ul>
							<li><a href="">이용약관</a></li>
							<li><a href="">개인정보취급방침</a></li>
							<li><a href="">이용안내</a></li>
							<li><a href="">고객센터</a></li>
							<li><a href="">KG이니시스구매안전서비스</a></li>
						</ul>
					</div>
					<div class="footer_business-info">
						<ul>
							<li>183번가</li>
							<li>대표 : 3조</li>
							<li>TEL : 000-1234-5678</li>
							<li>주소 : 서울특별시 서초구</li>
							<li>사업자등록번호 111-11-11111 [사업자정보확인]</li>
							<li>통신판매업신고번호 : 제 2021-서울서초-0000 호</li>
							<li>개인정보관리책임자 : 3조</li>
							<li>대표메일 183ST@183ST.com Copyright © 183ST. All rights
								reserved.</li>
						</ul>
					</div>
				</section>
				<section class="footer_right">
					<div class="footer_contact">
						<div class="footer_contact_phone">
							고객센터<br>000 000 0000
						</div>
						<div class="footer_contact_sns">
							<a href=""><i class="fab fa-instagram"></i></a> <a href=""><i
								class="fab fa-youtube"></i></a>
						</div>
					</div>
					<div class="footer_other">
						<div class="footer_other_business-hour">
							평일 AM 10:00 - PM 07:00<br> 점심 PM 01:00 - PM 02:00<br>
							휴무 토 / 일 / 공휴일
						</div>
						<div class="footer_other_bank">183은행 000-000000-00000 183번가</div>
					</div>
				</section>
			</div>
		</footer>
		<div class="chat-bot">
			<i class="fas fa-comments"></i>
		</div>
	</div>
</body>
</html>