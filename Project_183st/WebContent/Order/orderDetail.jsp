<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 확인</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="path_role" content="MAIN">
<meta name="author" content="183번가">
<meta name="description" content="183번가 - 의류 쇼핑몰">
<meta name="keywords" content="183ST">
<link rel="stylesheet" type="text/css" href="reset.css">
<link rel="stylesheet" type="text/css" href="common.css">
<link rel="stylesheet" type="text/css" href="style.css">
<script src="main.js" defer></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lexend+Mega&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<style>
	#title_Area {
		display: flex;
		margin: 0 auto;
		align-items: center;
		width: 500px;
		height: 31px;
		border-bottom: 1px solid #000000;
		margin-top: 20px;
	}
	
	#title_Area h2 {
		margin: auto;
		padding: 0 61px 10px 61px;
	    line-height: 20px;
	    font-size: 15px;
	    color: #2e2e2e;
	    text-align: center;
	    width: 500px;
		height: 30px;
	}

</style>
</head>
<body>
	<header>
	    <div class="wrap">                	
	        <div class="header_menu">
	            <a href="#" class="toggle"><i class="fas fa-bars"></i></a>
	            <c:if test="${empty sessionScope.id }">
                <a href="memberController?type=loginMove"><i class="fas fa-user"></i></a>
                </c:if>
                <c:if test="${!empty sessionScope.id }">
                <a href="#" onclick="logoutChk()"><i class="fas fa-user"></i></a>
                <!-- <a href="memberController?type=myPage"><i class="fas fa-user"></i></a>  -->
                </c:if>
	        </div>
	        <div class="header_logo">
	            <a href="shop183st.jsp">183번가</a></div>
	        <div class="header_menu">
	            <a href=""><i class="fas fa-search"></i></a>
	            <c:if test="${!empty sessionScope.id }">
                <a href="CartController?type=cart"><i class="fas fa-shopping-cart"></i></a>
                </c:if>
                <c:if test="${empty sessionScope.id || sessionScope.id == '' || sessionScope.id == 'null' || sessionScope.id eq null }">
                <a href="#" onclick="needLogin()"><i class="fas fa-shopping-cart"></i></a>
                </c:if>
	        </div>  
	    </div>  
	</header>
	<nav class="menu">
	   <div class="wrap">
	       <ul>
	           <li><a href="product_controller?viewType=list&cPage=1">ALL</a></li>
	           <li><a href="product_controller?viewType=list&producttype=T&cPage=1">TOP</a></li>
	           <li><a href="product_controller?viewType=list&producttype=B&cPage=1">BOTTOM</a></li>
	           <br>
	           <li><a href="bbsController?type=bbs">Q&A</a></li>
	           <li><a href="mypage.html">MY PAGE</a></li>
	       </ul>
	   </div>
	</nav>
     <!-- ------ 공통부 ------ -->
	
	<main>
     <div class="warp" style="min-height: 820px;">
     	<section>
	     	<div id="title_Area">
	     	<h2>주문 상세</h2>
	     	</div>
	
			<p>${OrderInfo.name }님의 주문 내역입니다</p>
			
			<ul>
				<c:forEach var="list" items="${OrderDetail }">
					<li>
						<div>
							<p>상품명 : ${list.productname }</p>
							<p>가격 : ${list.price}</p>
							<p>주문 수량 : ${list.o_amount }
						</div>
					</li>
				</c:forEach>
			</ul>
			<p>사용한 포인트 : ${OrderInfo.point }</p>
			<p>총 결제 금액 : ${OrderInfo.totalprice }</p>
			<hr>
			<h3>배송 정보</h3>
			<div>
				<p>이름 : ${OrderInfo.name }</p>
				<p>주소 : ${OrderInfo.addr }</p>
				<p>전화번호 : ${OrderInfo.phone }</p>
			</div>
	
		</section>
	 </div>
	</main>
	
	<!-- ------ 이하 공통부 ------ -->
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
	                    <li>183번가</li><li>대표 : 3조</li><li>TEL : 000-1234-5678</li><li>주소 : 서울특별시 서초구</li>
	                    <li>사업자등록번호 111-11-11111 [사업자정보확인]</li><li>통신판매업신고번호 : 제 2021-서울서초-0000 호</li><li>개인정보관리책임자 : 3조</li>
	                    <li>대표메일 183ST@183ST.com Copyright © 183ST. All rights reserved.</li>
	                </ul>
	            </div>
	        </section>
	        <section class="footer_right">
	            <div class="footer_contact">
	                <div class="footer_contact_phone">
	                    고객센터<br>000 000 0000
	                </div>
	                <div class="footer_contact_sns">
	                    <a href=""><i class="fab fa-instagram"></i></a>
	                    <a href=""><i class="fab fa-youtube"></i></a>
	                </div>
	            </div>
	            <div class="footer_other">
	                <div class="footer_other_business-hour">
	                    평일 AM 10:00 - PM 07:00<br>
	                    점심 PM 01:00 - PM 02:00<br>
	                    휴무 토 / 일 / 공휴일
	                </div>
	                <div class="footer_other_bank">183은행 000-000000-00000 183번가</div>
	            </div>   
	        </section>
	    </div>
	</footer>
	
</body>
</html>