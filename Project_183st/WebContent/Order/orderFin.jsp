<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
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
<style>
	
	#title_Area {
		align-items: center;
		text-align: center;
		width: 100%;
		height: 31px;
		border-bottom: 1px solid #000000;
		margin-top: 20px;
		vertical-align: middle;
	}
	
	#title_Area h2 {
		padding: 0 61px 10px 61px;
	    line-height: 20px;
	    font-size: 15px;
	    color: #2e2e2e;
	    text-align: center;
	    width: 100%;
		height: 30px;
	}
	
	#order_complete {
		margin-top: 20px;
		margin-bottom: 20px;
		text-align: center;
	}
	
	#goto {
		width: 100%;
		margin-top: 5px;
		item-align: center;
	}
	
	#goto input {
		width: 271px;
		height: 38px;
		background-color: #FFF;
		border: 1px solid #999;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
</style>
<script>
	function gotoMain(){
		location.href="shop183st.jsp";
	}
	
	function gotoOrderList() {
		location.href="OrderController?type=orderList";
	}
</script>
</head>
<body>
	<div class="body_wrap"> 
     <header>
     	<div id="loading"></div> 
			<div class="header_banner">
				<a href="#none" class="xi-close-thin" id="header_close_button"></a>
			 	<ul style="top: 0px;">
					<li style="background-color:violet;"><a href="memberController?type=joinMove" style="color:#fff;">183번가 온라인 쇼핑몰 신규가입 적립금 2,000원 혜택!</a></li>
				    <li style="background-color:#60da9f;"><a href="http://lmoodc.cafe24.com/product/list.html?cate_no=58" style="color:#fff;">인기 많은 품절 임박 상품 확인하기!</a></li>
				    <li style="background-color:pink;"><a href="https://www.instagram.com/" style="color:#fff;">인스타그램 @183st 팔로우시 다양한 이벤트 참여 가능!</a></li>
				</ul>
			</div>
            <div class="wrap">                	
                <div class="header_menu">
                    <a href="#" class="toggle"><i class="fas fa-bars"></i></a>
                    <c:if test="${empty sessionScope.id }">
                <a href="memberController?type=loginMove"><i class="fas fa-user"></i></a>
                </c:if>
                <c:if test="${!empty sessionScope.id }">
                <a href="#" onclick="logoutChk()"><i class="fas fa-user"></i></a>
                <a href="memberController?type=myPage">마이 페이지</a>
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
                <c:if test="${empty sessionScope.id || sessionScope.id == '' || sessionScope.id eq null }">
                <a href="#" onclick="needLogin()"><i class="fas fa-shopping-cart"></i></a>
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
             <br>
             <li class="title">
                	<a href="#none" style="color: black;">BOARD</a><br>
                	<ul class="sub" style="display: block;">
                  <li><a href="bbsController?type=bbs">Q&A</a></li><br>		                        
                  <li><a href="mypage.html">MYPAGE</a></li>
            		</ul>
           		</li>
           	</ul>
        </div>
    </nav>
	<!-- 여기까지 공통부 -->
	
	<main>
     <div class="warp" style="min-height: 820px;">
     	<section>
     		<div id="title_Area">
			<h2>주문완료</h2>
			</div>
			
			<div id="order_complete">
				<h1>주문이 성공적으로 처리되었습니다</h1>
			</div>
			<hr>
			
			<div id="goto">
				<input type="button" value="주문 내역 확인" onclick="gotoOrderList()">
				<input type="button" value="메인으로 돌아가기" onclick="gotoMain()">
			</div>
	
		</section>
	 </div>
	</main>
	
	<!-- 여기부터 공통부 -->
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
     <div class="chat-bot"><i class="fas fa-comments"></i></div>
 </div>     
</body>
</html>