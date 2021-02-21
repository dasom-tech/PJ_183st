<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>183번가</title>
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
        <script type="text/javascript">
        	function logoutChk(){
        		var chk = confirm("로그아웃 하시겠습니까?");
        		
        		if(chk){
        			location.href="memberController?type=logout";
        		} else{
        			return;
        		}
        	}
        </script>
    </head>
    <%-- 
    <div id="loading"></div> 
    <div class="header_banner">
	    <ul><li style="background-color:#ddbf8d;"><a href="http://lmood.co.kr/member/join.html" style="color:#fff;">엘무드 공식 온라인 스토어 신규가입 적립금 2,000원 추가혜택!</a></li>
	        <li style="background-color:#fff;"><a href="http://lmoodc.cafe24.com/product/list.html?cate_no=58" style="color:#000;">2월 기간 한정 타임 세일</a></li>
	        <li style="background-color:#ffe501;"><a href="http://pf.kakao.com/_xjUCvC/chat%0A" style="color:#602d03;">카카오플러스친구 @엘무드 카카오친구 전용 쿠폰 지급</a></li>
	        <li style="background-color:#493828;"><a href="https://www.instagram.com/lmood_official/" style="color:#fff;">인스타그램 @lmood_official 팔로우 시 다양한 이벤트 선참여 추가혜택</a></li>
		</ul>
	</div>
	--%>
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
                        </c:if>
                    </div>
                    <div class="header_logo">
                        <a href="index.html">183번가</a></div>
                    <div class="header_menu">
                        <a href=""><i class="fas fa-search"></i></a>
                        <a href="CartController?type=cart"><i class="fas fa-shopping-cart"></i></a>
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
    
            <section class="main_slide-banner">
                <img alt="" src="">
            </section>
    
            <main>
                <div class="wrap">
                    <div class="recommended-item">
                        <div class="item_list_title">BESTSELLER</div>
                        <ul class="item_list">
                            <li class="item"><div class="item_box"><a href=""><img class="item_img" alt="" src="https://images.unsplash.com/photo-1613152385623-3cff59a74175?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=974&q=80"><div class="item_name">헤링본 더블 롱 코트</div><div class="item_price">$100</div></a></div></li>
                            <li class="item"><div class="item_box"><a href=""><img class="item_img" alt="" src="https://images.unsplash.com/photo-1613152385623-3cff59a74175?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=974&q=80"><div class="item_name">헤링본 더블 롱 코트</div><div class="item_price">$100</div></a></div></li>
                            <li class="item"><div class="item_box"><a href=""><img class="item_img" alt="" src="https://images.unsplash.com/photo-1613152385623-3cff59a74175?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=974&q=80"><div class="item_name">헤링본 더블 롱 코트</div><div class="item_price">$100</div></a></div></li>
                            <li class="item"><div class="item_box"><a href=""><img class="item_img" alt="" src="https://images.unsplash.com/photo-1613152385623-3cff59a74175?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=974&q=80"><div class="item_name">헤링본 더블 롱 코트</div><div class="item_price">$100</div></a></div></li>
                        </ul>                       
                    </div>
                    <div class="normal-item">
                        <div class="item_list_title">ALL</div>
                        <ul class="item_list">
                            <li class="item"><div class="item_box"><a href=""><img class="item_img" alt="" src="https://images.unsplash.com/photo-1613152385623-3cff59a74175?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=974&q=80"><div class="item_name">헤링본 더블 롱 코트</div><div class="item_price">$100</div></a></div></li>
                            <li class="item"><div class="item_box"><a href=""><img class="item_img" alt="" src="https://images.unsplash.com/photo-1613152385623-3cff59a74175?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=974&q=80"><div class="item_name">헤링본 더블 롱 코트</div><div class="item_price">$100</div></a></div></li>
                            <li class="item"><div class="item_box"><a href=""><img class="item_img" alt="" src="https://images.unsplash.com/photo-1613152385623-3cff59a74175?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=974&q=80"><div class="item_name">헤링본 더블 롱 코트</div><div class="item_price">$100</div></a></div></li>
                            <li class="item"><div class="item_box"><a href=""><img class="item_img" alt="" src="https://images.unsplash.com/photo-1613152385623-3cff59a74175?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=974&q=80"><div class="item_name">헤링본 더블 롱 코트</div><div class="item_price">$100</div></a></div></li>
                        </ul>
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