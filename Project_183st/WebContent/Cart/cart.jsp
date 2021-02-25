<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
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
	
	#empty_text {
		display: flex;
		text-align: center;
		align-items: center;
	}
	
	#empty_text p {
		margin: auto;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	#return_btn {
		position: relative:
		display: flex;
		width: 271px;
		height: 38px;
		color: #000000;
		background-color: #FFFFFF;
		text-align: center;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	#return_area {
		text-align: center;
	}
	
	#description {
		position: relative;
		padding: 7px 0 0 90px;
		margin-top: 25px;
		margin-bottom: 25px;
	}
	
	#description li {
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
	
	.deleteItem {
		position: relative:
		display: flex;
		width: 46px;
		height: 28px;
		margin-top: 2px;
		color: #000000;
		background-color: #FFF;
		text-align: center;
		font-family: 'Nanum Gothic', sans-serif;
		border: 1px solid #999;
	}
	
	#list_proc {
		width: 100%;
		margin-top: 5px;
		item-align: center;
	}
	
	#list_proc input {
		width: 271px;
		height: 38px;
		background-color: #FFF;
		border: 1px solid #999;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	#totalprice {
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	.placeorder {
		width: 100%;
		height: 38px;
		background-color: #000;
		color: #FFF;
		font-weight: bold;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	.return {
		margin-top: 5px;
		width: 100%;
		height: 38px;
		background-color: #FFF;
		color: #000;
		font-weight: bold;
		font-family: 'Nanum Gothic', sans-serif;
	}

</style>
<script>
	$(function(){
		
		$(".modAmount").click(function(){
			var cartid = event.srcElement.name;
			//alert("cartid : " + cartid);
			var modAmount = $('.modAmount[name="' + cartid + '"]').prev().val();
			//alert(modAmount);
			
			if(modAmount < 1){
				alert("상품의 갯수는 1개 미만으로 변경할 수 없습니다");
			} else {
				location.href="CartController?type=modAmount&cid=" + cartid + "&amount=" + modAmount;
			}
		});
		
		$(".deleteItem").click(function(){
			var deleteid = event.srcElement.name;
			
			var chk = confirm("해당 상품을 장바구니에서 삭제하시겠습니까?");
			
			if(chk){
				location.href="CartController?type=deleteItem&cid=" + deleteid;
			} else{
				return;
			}
		});

		$(".sDelete").click(function(){
	        var sDchk = confirm("체크된 상품을 장바구니에서 삭제하시겠습니까?");
	        
	        if(sDchk){
	        	var checkArr = new Array();
	        	
	        	$("input[name='cartid']:checked").each(function(){
	        		// 반복문 테스트 출력
	        		//alert($(this).attr("value"));
	        		//location.href="CartController?type=deleteItem&cid=" + $(this).attr("value");
	        		checkArr.push($(this).attr("value"));
	        	});
	        	var checkData = { "cartid" : checkArr };
	        	
	        	$.ajax("CartController?type=deleteChkItems", {
	        		type : "post",
	        		dataType : "json",
	        		data : checkData,
	        		success : function(result){
	        			if(result == 1){
	        				//alert("삭제 성공!");
	        				location.href="CartController?type=cart";
	        			} else {
	        				alert("삭제 중 오류 발생..");
	        			}
	        		}
	        	});
	        } else{
	           return;
	        }
	     });
	     
	     $(".selectAll").click(function(){
	        if($("input[type=checkbox]").prop("checked")){
	           $("input[type=checkbox]").prop("checked", false);
	        } else{
	           $("input[type=checkbox]").prop("checked", true);
	        }
	     });
	     
	     $(".placeorder").click(function(){
	    	 if($("input[name=cartid]:checked").length == 0){
	    		 alert("현재 선택한 상품이 없습니다");
	    		 return;
	    	 } else {
	    		 $("#orderinfo").submit();
	    	 }
	    	 
	     });
	     
	     $(".return").click(function(){
	        history.back();
	     });
	});
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
	<!-- 여기까지 공통부 -->
	
	<main>
     <div class="warp" style="min-height: 820px;">
     	<section>
     		<div id="title_Area">
			<h2>장바구니 페이지</h2>
			</div>
			
			<div id="showcart">
			<c:if test="${empty UserCart }">
				<div id="empty_text">
					<p><strong>장바구니에 상품이 없습니다</strong></p>
				</div>
				
				<div id="return_area">
				<p><input type="button" id="return_btn" class="return" value="돌아가기"></p>
				</div>
			</c:if>
			<c:if test="${!empty UserCart }">
			<form action="OrderController?type=orderMove" id="orderinfo" method="post">
				<c:forEach var="list" items="${UserCart }">
				
				
					<div id="description">
						<input type="checkbox" class="item_checker" name="cartid" value="${list.cartid }">
						
						<p class="des_img">
							<a href="product_controller?viewType=info&productno=${list.productno }">
								<img src="images/${list.image_s }" style="width: 85px; height: 85px;">
							</a>
						</p>
						
						<strong class="des_text">
							<a href="product_controller?viewType=info&productno=${list.productno }">${list.productname }</a>
						</strong>
						
						<ul>
							<li>${list.price }원</li>
							<li class="amount">수량 : <input type="number" class="input_amount" name="amount" value="${list.c_amount }">
							<input type="button" class="modAmount" name="${list.cartid }" value="수정"></li>
							<li><input type="button" class="deleteItem" name="${list.cartid }" value="삭제"></li>
						</ul>
					</div>
					
					<input type="hidden" name="image_s" value="${list.image_s }">
					<hr>
				</c:forEach>
				
			<div id="list_proc">
				<input type="button" class="selectAll" value="전체선택">
				<input type="button" class="sDelete" value="선택삭제">
			</div>
			
			<div id="totalprice">
				<p>
					<strong>총액 : ${total }원</strong>
				</p>
			</div>
			
			<div>
				<p>
					<input type="button" class="placeorder" value="주문하기">
					<input type="button" class="return" value="돌아가기">
				</p>
			</div>
			</form>
			</c:if>
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
    </div>
</body>
</html>