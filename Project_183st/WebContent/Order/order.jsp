<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>

	#title_Area {
		align-items: center;
		text-align: center;
		width: 100%;
		height: 31px;
		border-bottom: 1px solid #000000;
		margin-top: 20px;
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
	
	.orderItem {
		position: relative;
		padding: 7px 0 0 90px;
		margin-top: 25px;
		margin-bottom: 25px;
		height: 80px;
	}
	
	.orderItem li {
		display: flex;
		list-style: none;
	}
	
	.item_checker {
		position: absolute;
		display: block;
		top: -20%;
		left: 0%;
	}
	
	.des_img {
		position: absolute;
		left: 0;
		width: 85px;
	}
	
	.des_text {
		display: flex;
	}
	
	.modAmount {
		position: relative:
		display: flex;
		width: 46px;
		height: 28px;
		color: #000000;
		background-color: #EEE;
		text-align: center;
		font-family: 'Nanum Gothic', sans-serif;
		border: 1px solid #999;
	}
	
	.amount {
		margin-top: 10px;
	}
	
	.amount input {
		margin-top: -5px;
		margin-left: 2px;
	}
	
	.input_amount {
		width: 40px;
	}
	
	.titlaArea {
		display: flex;
		height: 45px;
		padding: 0px;
		margin-bottom: 0px;
		border-style: 1px solid #070707;
		item-align: center;
		box-sizing: border-box;
	}
	
	.titleArea h3 {
		margin-top: 10px;
		margin-bottom: 0px;
		border: 1px solid #CCC;
		color: white;
		
		width: 100%;
		height: 45px;
		
		background-color: #8f5b52;
		padding: 12px 61px 10px 61px;
	    line-height: 20px;
	    font-size: 13px;
		text-align: center;
	}
	
	#orderInfo {
		box-sizing: border-box;
		margin: 0px;
		magin-bottom: 10px;
	}
	
	.order_form {
		display: table;
		margin: 0 auto;
		width: auto;
		table-layout: fixed;
		margin-bottom: 10px;
	}
	
	.order_form tr {
		border: 1px solid #CCC;
		border-collapse: collapse;
		height: 45px;
	}
	
	.order_form th {
		width: 20%;
		padding: 5px;
	}
	
	.order_form td {
		width: 100%;
		padding: 5px;
	}
	
	#order_radiofrm {
		width: 100%;
		height: 45px;
		border: 1px solid #CCC;
		border-bottom: none;
		text-align: center;
		background-color: #EEE;
	}
	
	#order_radiofrm div {
		margin-top: 20px;
		display: inline;
		width: 50%;
		height: 45px;
		text-align: center;
		vertical-align: middle;
	}
	
	#order_radiofrm input {
		margin-top: 12px;
	}
	
	.name {
		width: 130px;
		height: 29px;
	}
	
	.addr {
		width: 490px;
		height: 29px;
	}
	
	.phone_head {
		width: 120px;
		height: 29px;
	}
	
	.phone_1, .phone_2 {
		width: 120px;
		height: 29px;
	}
	
	#receipt {
		box-sizing: border-box;
		margin: 0px;
		magin-bottom: 10px;
	}
	
	.receipt_form {
		display: table;
		margin: 0 auto;
		width: 576px;
		table-layout: fixed;
		margin-bottom: 10px;
	}
	
	.receipt_form tbody {
		width: auto;
		box-sizing: border-box;
	}
	
	.receipt_form tr {
		border: 1px solid #CCC;
		border-collapse: collapse;
		height: 45px;
		width: auto;
	}
	
	.receipt_form th {
		width: 20%;
	}
	
	.receipt_form td {
		width: 100%;
		padding: 5px;
		padding-left: 20px;
	}
	
	.inputPoint {
		width: 120px;
		height: 29px;
	}
	
	.usePoint {
		width: 70px;
		height: 29px;
		margin-left: 10px;
		margin-top: 5px;
	}
	
	#order_btn {
		display: block;
		margin: 0 auto;
		item-align: center;
		text-align: center;
	}
	
	.orderConfirm {
		width: 576px;
		height: 38px;
		color: #FFFFFF;
		background-color: #000000;
		text-align: center;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
</style>
<script>
	
	$(function(){
		
		
		// 포인트를 입력하고 사용하는 버튼을 눌렀을 때 수행하는 작업
		$(".usePoint").click(function(){
			//alert("테스트");
			if(parseInt('${orderedMember.point  }') < $(".inputPoint").val()){
				alert("사용할 수 있는 포인트보다 많습니다");
			} else{
				var tot = '${total}' - $(".inputPoint").val();
				var remainPoint = '${orderedMember.point }' - $(".inputPoint").val();
				var usedPoint = '${orderedMember.point }' - remainPoint;
				$(".finTot").text(tot);
				$(".totPoint").text(remainPoint);
				$(".totalPrice").prop("value", tot);
				$(".usedPoint").prop("value", usedPoint);
			}
			
		});
		
		// 주문정보의 라디오 버튼을 눌렀을 때 수행하는 작업
		$("input:radio[name=inputInfo]").click(function(){
			if($("input:radio[value=newInput]").is(':checked')){
				//alert("신규 입력 테스트");
				$(".phone_head").val('010').prop("selected", true);
				$(".name").prop("value", "");
				$(".addr").prop("value", "");
				$(".phone_1").prop("value", "");
				$(".phone_2").prop("value", "");
			}
			if($("input:radio[value=memberInfo]").is(':checked')){
				//alert("테스트");
				var phone_head = '${orderedMember.phone}'.substr(0, 3);
				var phone1 = '${orderedMember.phone}'.substr(4, 4);
				var phone2 = '${orderedMember.phone}'.substr(9, 4);
				
				$(".phone_head").val(phone_head).prop("selected", true);
				$(".name").prop("value", "${orderedMember.name}");
				$(".addr").prop("value", "${orderedMember.addr}");
				$(".phone_1").prop("value", phone1);
				$(".phone_2").prop("value", phone2);
			}
		});
		
		// 주문하기 버튼을 눌렀을 때 수행하는 작업
		$(".orderConfirm").click(function(){
			
			if($(".name").prop("value") == ""){
				alert("주문자 성명을 입력해주세요");
				return;
			}
			if($(".addr").prop("value") == ""){
				alert("배송 주소를 입력해주세요");
				return;
			}
			if($(".phone_1").prop("value") == "" || $(".phone_2").prop("value") == ""){
				alert("전화번호를 입력해주세요");
				return;
			}
			
			$("#orderInfo").submit();
		});
		
		
	});
	
	
	
</script>
</head>
<body>
	<header>
    	<div id="loading"></div> 
<!--  <div class="header_banner">
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
                	<a href="#none">BOARD</a><br>
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
			<h2>주문하기</h2>
			</div>
			
			<div id="orderform">
				<form action="OrderController?type=orderProc" id="orderInfo" method="post">
					<div id="orderList">
					<c:forEach var="list" items="${orderItems }">
					
					<div class="orderItem">
						<p class="des_img">
							<a href="product_controller?viewType=info&productno=${list.productno }">
								<img src="images/${list.image_s }" style="width: 85px; height: 85px;">
							</a>
						</p>
						
						<strong class="des_text">
							<a href="product_controller?viewType=info&productno=${list.productno }">${list.productname }</a>
						</strong>
						
						<ul>
							<li>가격 : ${list.price }원</li>
							<li class="amount">주문수량 : ${list.c_amount }</li>
						</ul>
						
						<input type="hidden" name="cartid" value="${list.cartid }"> 
						<input type="hidden" name="productno" value="${list.productno }">
						<input type="hidden" name="c_amount" value="${list.c_amount }">
						<input type="hidden" name="price" value="${list.price }">
						<input type="hidden" name="productname" value="${list.productname }">
						<input type="hidden" name="image_s" value="${list.image_s }">
					</div>
					
					<hr>
					</c:forEach>
					</div>
					<div id="orderInfo">
					
					<div class="titleArea" style="margin-bottom: 0px;">
					<h3>주문 정보</h3>
					</div>
					
					<div id="order_radiofrm">
						<div>
						<input type="radio" name="inputInfo" value="newInput" checked>신규 작성
						</div>
						<div>
						<input type="radio" name="inputInfo" value="memberInfo">회원 정보와 동일
						</div>
					</div>
					
					<table class="order_form">
						<tr>
							<th>주문자</th>
							<td><input type="text" class="name" name="name"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" class="addr" name="addr"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td> 
								<select class="phone_head" name="phone_head">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>-
								<input type="text" class="phone_1" name="phone_1" width="50px">-
								<input type="text" class="phone_2" name="phone_2" width="50px">
							</td>
						</tr>
					</table>
					</div>
					<hr>
					
					<div id="receipt">
						<div class="titleArea" style="margin-bottom: 0px;">
						<h3>결제 정보</h3>
						</div>
						
						<table class="receipt_form">
							<tr>
								<th>포인트</th>
								<td>
									사용가능 포인트 : <label class="totPoint">${orderedMember.point }</label>
									<p>
										포인트 사용 : <input type="number" class="inputPoint" value="0"><input type="button" class="usePoint" value="사용">
									</p>
								</td>
							</tr>
							
							<tr>
								<th>총 결제 금액</th>
								<td><label class="finTot">${total }</label> 원</td>
							</tr>
							
						</table>
						
						<input type="hidden" class="totalPrice" name="totalPrice" value="${total }">
						<input type="hidden" name="originPoint" value="${orderedMember.point }">
						<input type="hidden" class="usedPoint" name="usedPoint" value="0">
						<input type="hidden" name="cartidList" value="${orderItems }">
					</div>
					
					<div id="order_btn">
					<input type="button" class="orderConfirm" value="주문하기">
					</div>
				</form>
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
</body>
</html>