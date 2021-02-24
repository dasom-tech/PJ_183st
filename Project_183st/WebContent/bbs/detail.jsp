<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
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
<script src="main.js" defer></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lexend+Mega&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<style type="text/css">

	body {
		font-family:"맑은 고딕"; font-size:1.25em; color:#333
	}

	#bbs table {
		margin-left: 10px;
		border-collapse: separate;
		font-size: 14px;
		table-layout: fixed;
		border-spacing: 2px;
		text-align: center;
        display: table;
        width: 50%;
        margin-left: 25%;
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	
	#bbs table th {
		background-color: pink;
		height: 5px;
	}
	
	#bbs table tr {
	}
	
	.contact-tr {
		height: 500px;	
	}

	#bbs table th, #bbs table td {
		text-align: center;
		border-bottom: 1px solid pink;
		padding: 1px 1px;
		height: 5px;
		width: 10px;
	}
	
	#bbs  table td a {
		text-decoration: none;
	}
	
	#bbs  table td a:hover {
		text-decoration: underline;
	}
	
	#bbs .align-left { text-align: left; }
	
	.no { width: 10%; }
	.writer { width: 15%; }
	.regdate { width: 20%; }
	.hit { width: 15%; }
	
	/***** 페이지 표시 부분 스타일(시작) ****/
	.paging { 
		list-style: none;
	}
	.paging li {
		float: left;
		margin-right: 8px;
		text-align: center;
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
		background-color: #ff4aa2;
	}
	.paging li a:hover {
		background-color: #00B3DC;
		color: white;
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
					<form method="post">
						<input type="hidden" name="bbs_no" value="${bbs_no}" /> <input
							type="hidden" name="cPage" value="${cPage}" />
						<table>
							<caption>상세보기</caption>
							<tbody>
								<tr style="height:40px;">
									<th>상품번호</th>
									<td>${vo.productno }</td>
									<th>작성자</th>
									<td>${vo.id }</td>
									<th>문의종류</th>
									<td>${vo.category }</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="5" style="height:40px;">${vo.subject }</td>
								</tr>
								<tr class="contact-tr">
									<td colspan="5" style="text-align:left; vertical-align:top; padding:10px;">${vo.contact }</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2">
									<c:if test="${empty sessionScope.id || sessionScope.id != vo.id }">
										<input type="button" value="목 록" class="button" onclick="list_go(this.form)">
									</c:if> 
									<c:if test="${!empty sessionScope.id && sessionScope.id == vo.id }">
										<input type="button" value="수 정" class="button" onclick="modify_go(this.form)">
										<input type="button" value="삭 제" class="button" onclick="delete_go(this.form)">
										<input type="button" value="목 록" class="button" onclick="list_go(this.form)">
										<input type="hidden" value="tag">
									</c:if></td>
								</tr>
							</tfoot>
						</table>
					</form>
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

