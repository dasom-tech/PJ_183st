<%@page import="com.bc.product.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<% 
	String producttype = request.getParameter("producttype");
	if(producttype == null) {
		producttype = "";
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
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
	#titleArea{position:relative;border-bottom:1px solid #c2c2c2;background-color:#fff;}
	#titleArea h2{padding:0 61px 10px 61px;line-height:20px;font-size:15px;color:#2e2e2e;text-align:center;}
	
	.join_form { border:1px solid black; border-collapse:collapse; border-style: solid;}
	.join_form tr { border:1px solid black; border-style: solid none; }
</style>
<style>
	table {
		width: 600px;
		margin: 35px auto 0; /* 상 좌우 하 */
		border-collapse: collapse;
		font-size: 1.0em;
		border-bottom: 1px solid #ddd;
	}
	th, td { border-bottom: 1px solid #ddd; padding: 3px; }
	th { background-color: #ddd; }
	.red { color: red; }
	
	.title { width: 30%; }
	tfoot { text-align: left; height: 3em; }
	.submitBtn {
		background-color: #008CBA;
		border: none;
		color: white;
		padding: 15px 32px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		margin: 4px 2px;
		cursor: pointer;
	}
</style>
<style>
	.no { width: 10%; }
	.writer { width: 15%; }
	.regdate { width: 20%; }
	.hit { width: 15%; }
	
	/***** 페이지 표시 부분 스타일(시작) ****/
	.paging { list-style: none; text-align: center;}
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
	.center {
		text-align: center;
	}
	/***** 페이지 표시 부분 스타일(끝) ****/
</style>
<script>
	function all_search(frm) {
		frm.action = "product_controller?viewType=list&cPage=1";
		frm.submit();
	}
	function top_search(frm) {
		producttype = "T";
		frm.action = "product_controller?viewType=list&producttype=T&cPage=1";
		frm.submit();
	}
	function bottom_search(frm) {
		producttype = "B";
		frm.action = "product_controller?viewType=list&producttype=B&cPage=1";
		frm.submit();
	}
	function detail_view(productno){
		var frm = document.getElementById("submitForm");
		frm.action="product_controller?viewType=info&productno="+productno;
		frm.submit();
	}
	function paging_click(producttype, pageNo){
		var frm = document.getElementById("submitForm");
		frm.action = "product_controller?viewType=list&producttype="+producttype+"&cPage="+pageNo;		
		frm.submit();
	}	
</script>
<style>
.item_list {
  display : flex;
  flex-wrap : wrap;
}

.item_box {
  width: 20%;
}
</style>
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
    
	    <section class="main_slide-banner">
	    	<img alt="상품들" src="images/items.jpg">
	    </section>
	            
		<form method="post" id="submitForm">	
			 <main>
                <div class="wrap">
                    <div class="normal-item">
                    	<c:choose> 
							<c:when test="${producttype=='B'}">
								<div class="item_list_title">BOTTOM</div>
							</c:when> 
							<c:when test="${producttype=='T'}">
								<div class="item_list_title">TOP</div>
							</c:when> 
							<c:otherwise>
								<div class="item_list_title">ALL</div>
							</c:otherwise> 
						</c:choose> 
	                       <div style="display: table;"> 
	                       <ul class="item_list">
                            	<c:if test="${not empty list}">
								<c:forEach var="vo" items="${list}" varStatus="status">
		                            <c:if test="${(status.index+1)%1 ==0}">
			                           		<li class="item_box">
			                            		<a href="#" onclick="detail_view('${vo.getProductno()}');">
			                            			<p><img class="item_img" alt="" src="images/${vo.getImage_s()}"></p>
			                            			<p class="item_name">${vo.getProductname()}</p>
			                            			<p class="item_price"><fmt:formatNumber value="${vo.getPrice()}" pattern="#,###" />원</p>
			                            		</a>
			                            	</li>
			                            	<br><br>
		                            </c:if>	
	                            </c:forEach>
							</c:if>
							<c:if test="${empty list}">
							</c:if>
						</ul>
						</div>
							</div>
								<div colspan="5" style="text-align: center;">
									<ul class="paging" id="paging" style="margin-left: 48%;">
										<c:forEach var="i" begin="1" end="${totalPage}">
											<c:choose>
												<c:when test="${i == cPage}">
													<li class="now">
														${i}
													</li>
												</c:when>
												<c:otherwise>
													<li>
														<a href="#" onclick="paging_click('<%=producttype%>',${i});">${i}</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</ul>
								</div>
	               </div>
				</main>
			</form>	 
			           
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