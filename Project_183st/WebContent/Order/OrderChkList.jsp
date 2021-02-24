<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
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
<script type="text/javascript">
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
	
	#orderlist {
		display: block;
		margin: 0 auto;
		width: 950px;
		height: 1650;
		item-align: center;
		box-sizing: border-box;
		text-align: center;
	}
	
	.list_table {
		margin-top: 10px;
		text-align: center;
		width: 100%;
	}
	
	.list_table tr {
		width: 950px;
		height: 48px;
	}
	
	.list_table tr:nth-child(2n+2){
		background-color: #FFF;
	}
	
	.list_table tr:nth-child(2n+3){
		background-color: #DDD;
	}
	
	.list_table th {
		background-color: ;
	}
	
	.list_table td {
		width: 30%;
		
		padding-left: 20px;
	}
	
	.list_table a {
		
	}
	
	.order_totalprice {
		text-align: center;
	}
	
	.list_header {
		background-color: #CCC;
		border-bottom: 1px solid #BBB;
	}
	
	#return_btn {
		margin-top: 10px;
		text-align: center;
	}
	
	#return_btn button {
		width: 271px;
		height: 38px;
		color: #000000;
		background-color: #FFFFFF;
		text-align: center;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	
</style>
<script>

</script>
</head>
<body>
	<div class="body_wrap"> 
            <header>
            	<div id="loading"></div> 
			    <!-- <div class="header_banner">
			    	<a href="#none" class="xi-close-thin" id="header_close_button"></a>
				    <ul style="top: 0px;">
				    	<li style="background-color:violet;"><a href="memberController?type=joinMove" style="color:#fff;">183번가 온라인 쇼핑몰 신규가입 적립금 2,000원 혜택!</a></li>
				        <li style="background-color:#60da9f;"><a href="http://lmoodc.cafe24.com/product/list.html?cate_no=58" style="color:#fff;">인기 많은 품절 임박 상품 확인하기!</a></li>
				        <li style="background-color:pink;"><a href="https://www.instagram.com/" style="color:#fff;">인스타그램 @183st 팔로우시 다양한 이벤트 참여 가능!</a></li>
					</ul>
				</div> -->
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
     <!-- ------ 공통부 ------ -->
	
	
	<main>
     <div class="warp" style="min-height: 820px;">
     	<section>
	     	<div id="title_Area">
	     	<h2>주문 내역</h2>
	     	</div>
	     	
	     	<div id="orderlist">
			<table class="list_table">
			<tr class="list_header">
				<th>주문번호</th>
				<th>상품명</th>
				<th>결제금액</th>
			</tr>
			<c:if test="${empty OrderList || OrderList eq null }">
			<tr>
				<td colspan="3">
				<p><strong>주문 내역이 존재하지 않습니다</strong></p>
				</td>
			</tr>
			</c:if>
			<c:forEach var="list" items="${OrderList }">
			<tr>
				<td><a href="OrderController?type=orderDetail&orderid=${list.orderid }">${list.orderid }</a></td>
				<td>${list.productname }</td>
				<td class="order_totalprice">${list.totalprice }원</td>
			</tr>
			</c:forEach>
			</table>
			</div>
			
			<div id="return_btn">
			<button onclick="location.href='memberController?type=myPage'">돌아가기</button>
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
	</div>
</body>
</html>