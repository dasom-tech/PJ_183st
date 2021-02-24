<%@page import="com.bc.product.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 전달받은 제품번호를 사용해서 DB데이터 조회 후 화면 표시 --%>
<%-- 액션태그 useBean scope 상에 id명 속성값이 
	있으면 사용하고, 없으면 클래스 속성 타입의 객체 생성 + scope 등록--%>
	<jsp:useBean id="dao" class="com.bc.product.ProductDAO" scope="session" />
<%
	//전달 받은 값 추출(파라미터 값)
	String productno = request.getParameter("productno");
	//EL, JSTL 사용을 위한 속성값 설정
	pageContext.setAttribute("vo", dao.selectProductInfo(productno));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="path_role" content="MAIN">
<meta name="author" content="183번가">
<meta name="description" content="183번가 - 의류 쇼핑몰">
<meta name="keywords" content="183ST">
<link rel="stylesheet" type="text/css" href="reset.css">
<link rel="stylesheet" type="text/css" href="common.css">
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="productDetailView.css">
<script src="main.js" defer></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lexend+Mega&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<script type="text/javascript">
   	function needLogin(){
   		alert("로그인이 필요한 기능입니다");
   		location.href="memberController?type=loginMove";
   	}
</script>
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
</head>

<div id="loading"></div> 
    <div class="header_banner">
    	<a href="#none" class="xi-close-thin" id="header_close_button"></a>
	    <ul style="top: 0px;">
	    	<li style="background-color:violet;"><a href="memberController?type=joinMove" style="color:#fff;">183번가 온라인 쇼핑몰 신규가입 적립금 2,000원 혜택!</a></li>
	        <li style="background-color:#60da9f;"><a href="bbsController?type=bbs" style="color:#fff;">183번가 "Q&A"</a></li>
	        <li style="background-color:pink;"><a href="https://www.instagram.com/" style="color:#fff;">인스타그램 @183st 팔로우시 다양한 이벤트 참여 가능!</a></li>
		</ul>
	</div>
	
<body>
	<div class="body_wrap"> 
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
	               <a href="CartController?type=cart"><i class="fas fa-shopping-cart"></i></a>
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
	<form action="CartController?type=insertItem" method="post" id="submitForm">
		<table style="height: 400px; width: 500px;">
			<tr>
				<td>
					<img src="images/${vo.getImage_s()}" alt="제품이미지" width="500" height="400">
				</td>
				<td align="center">
					<table style="height: 400px; width: 500px;">
					<c:if test="${not empty info}">
						<tr align="left">
							<td width="15%" style="font-size: 18px; font-weight: bold;">상품번호</td>
							<td align="left">${info.getProductno()}</td>
						</tr>
						<tr align="left">
							<td width="20%" style="font-size: 18px; font-weight: bold;">상품명</td>
							<td align="left">${info.getProductname()}</td>
						</tr>
						<tr align="left">
							<td width="20%" style="font-size: 18px; font-weight: bold;">가격</td>
							<td align="left">${info.getPrice()}원</td>
						</tr>
						<c:if test="${info.getStock()<=5}">
							<tr style="color: red;">
								<td align="center" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;품절 임박 상품!! 재고가 5개 이하입니다~^^</td>
							</tr>
						</c:if>
						<tr align="left">
							<td width="20%" style="font-size: 18px; font-weight: bold;">재고</td>
							<td align="left">${info.getStock()}</td>
						</tr>
						<tr align="left">
							<td width="20%" style="font-size: 18px; font-weight: bold;">상품설명</td>
							<td align="left">${info.getInfo()}</td>
						</tr>
						<tr align="center">
							<td colspan="2">
									<input type="hidden" name="productno" value="${info.getProductno()}">
									<select name="amount">
										<c:forEach begin="1" end="10" var="i">
											<option value="${i}">${i}</option>
										</c:forEach>
									</select>&nbsp;개
								<input type="submit" value="장바구니에 담기" class="submitBtn">
							</td>
						</tr>
						</c:if>
						<c:if test="${empty info}">
							<tr>
								<td colspan='5'>현재 판매중인 상품이 아닙니다</td>
							</tr>
						</c:if>	
					</table>
				</td>
			</tr>
		</table>
		<div>
			<img src="images/${vo.getImage_l() }" alt="제품이미지">
		</div>
	</form>
<<<<<<< HEAD
		<main>
			<div class="product-page_review">
				<table>
					<caption>
						REVIEW(<span>${count }</span>)
					</caption>
					<thead>
						<tr>
							<th>
								<form action="reviewController?type=insertReview" method="post">
									<div class="review_write_id">
										아이디 : <input type="text" name="id" value="${sessionScope.id }" readonly>
									</div>
									<div class="review_write_review">
										<textarea name="review" rows="3" required placeholder="한 줄 리뷰"></textarea>
									</div>
									<div class="review_write_submit">
										<input type="submit" value="등록">
										<input type="hidden" name="productno" value="${productno }">
									</div>
								</form>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
							<c:forEach var="rvo" items="${reviewVO }">
							<div class="comment">
								<form method="post">
								<div class="review_title">${rvo.review }</div>
								<div class="review_info">
									<span class="review_author"> ${rvo.id }</span> 
									<span class="review_date">${rvo.r_reg }</span>
							<c:if test="${!empty sessionScope.id && sessionScope.id == rvo.id }">
								<input type="button" value="리뷰 삭제" onclick="del_review(this.form)">
								<input type="hidden" name="reviewId" value="${rvo.reviewId }">
								<input type="hidden" name="productno" value="${productno }">
							</c:if>
								</div>
								</form>
							</div>
							</c:forEach>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td>
								<div class="review_page-buttons">
									<ol>
										<li>◀</li>
										<li>1</li>
										<li>▶</li>
									</ol>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</main>
		<footer>
=======
<%-- 상품에 대한 리뷰 작성 영역 --%>
<form action="reviewController?type=insertReview" method="post">
	<p>아이디 : <input type="text" name="id" value="${sessionScope.id }" readonly>
	<p>내용 : <textarea name="review" rows="4" cols="55"></textarea>
	<input type="submit" value="리뷰 저장">
	<input type="hidden" name="productno" value="${productno }">
</form>

<hr>
<p>리뷰</p>
<hr>

<%-- 상품에 작성된 리뷰 표시 영역 --%>
<c:forEach var="rvo" items="${reviewVO }">
<div class="comment">
	<form method="post">
		<p>아이디 : ${rvo.id } &nbsp; 날짜: ${rvo.r_reg }</p>
		<p>내용 : ${rvo.review }</p>
		<c:if test="${!empty sessionScope.id && sessinScope.id == rvo.id }">
		<input type="button" value="리뷰 삭제" onclick="del_review(this.form)">
		<input type="hidden" name="reviewId" value="${rvo.reviewId }">
		<input type="hidden" name="productno" value="${productno }">
		</c:if>
	</form>
</div>
<hr>
</c:forEach>
	<footer>
>>>>>>> cc7aaa4d59adcb7b819157ce35dce4d9275c20b0
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

<script>
	function del_review(frm) {
		var isDelete = confirm("리뷰를 삭제하시겠습니까?");
		if (isDelete) {
			frm.action = "reviewController?type=delReview";
			frm.submit();
		} else {
			return;
		}
	}
	
</script>

</html>












