<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
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
	
	#join {
		display: block;
		margin: 0 auto;
		margin-top: 0px;
		width: 950px;
		height: 1650;
		item-align: center;
		box-sizing: border-box;
	}
	
	#join tr {
		height: 45px;
	}
	
	#join th {
		padding: 7px;
		text-align : left;
		font-size: 11px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	#join td > input, select {
		margin-left: 5px;
		padding: 7px;
		height: 29px;
	}
	
	.join_div {
		box-sizing: border-box;
		margin: 0px;
	}
	
	.join_form {
		display: block;
		margin: 0 auto;
		width: auto;
		table-layout: fixed;
	}
	
	.join_form tr {
		border: 1px solid #CCC;
		border-collapse: collapse;
	}
	
	.join_form th {
		width: 110px;
	}
	
	.join_form td {
		width: 840px;
	}
	
	.pwd {
		width: 500px;
	}
	
	.pwdchk {
		width: 500px;
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
		
		width: 951px;
		height: 45px;
		
		background-color: #8f5b52;
		padding: 12px 61px 10px 61px;
	    line-height: 20px;
	    font-size: 13px;
		text-align: center;
	}
	
	#submitBtn {
		display: block;
		margin: 0 auto;
		item-align: center;
		text-align: center;
	}
	
	.submit {
		width: 951px;
		height: 38px;
		color: #FFFFFF;
		background-color: #000000;
		text-align: center;
		font-family: 'Nanum Gothic', sans-serif;
	}

</style>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	
	
	$(function(){
		// 아이디 중복 확인(ajax)
		$(".user_id").blur(function(){
			
			var chkid = $('.user_id').val();
			
			$.ajax("memberController?type=idOverlap&id=" + chkid, {
				type : "get",
				async: false,
				datatype : "json",
				success : function(data, textStatus, jqXHR){
					var isOverlap = JSON.parse(data);
					//alert(isOverlap.result);
					if("true" == isOverlap.result){
						$("#id_check").text("이미 사용중인 아이디입니다.");
						$("#id_check").css("color", "red");
						$("#id_check").css("display", "block");
						$(".submit").attr("disabled", true);
						return;
					} else {
						if(chkid == ""){
							$("#id_check").text("아이디를 입력해주세요");
							$("#id_check").css("color", "red");
							$("#id_check").css("display", "block");
							$(".submit").attr("disabled", true);
						}else{
							$("#id_check").text("");
							$("#id_check").css("display", "hidden");
							$(".submit").attr("disabled", false);
						}
					}
				},
				error : function(jqXHR, textStatus, errThrown){
					alert("Error");
				}
			});
			
		});
		
		$(".pwd").on("propertychange change keyup paste input", function(){
			
			var pw = $(".pwd").val();
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			
			if(pw.length < 8 || pw.length > 20){
				$("#pwd_validation").text("8자리 ~ 20자리 이내로 입력해주세요");
				$("#pwd_validation").css("color", "#d40000");
				$("#pwd_validation").css("display", "block");
				$(".submit").attr("disabled", true);
			}else if(pw.search(/\s/) != -1){
				$("#pwd_validation").text("비밀번호는 공백 없이 입력해주세요");
				$("#pwd_validation").css("color", "#d40000");
				$("#pwd_validation").css("display", "block");
				$(".submit").attr("disabled", true);
			}else if(num < 0 || eng < 0 || spe < 0 ){
				$("#pwd_validation").text("영문,숫자, 특수문자를 혼합하여 입력해주세요");
				$("#pwd_validation").css("color", "#d40000");
				$("#pwd_validation").css("display", "block");
				$(".submit").attr("disabled", true);
			}else {
				$("#pwd_validation").text("");
				$("#pwd_validation").css("display", "hidden");
				$(".submit").attr("disabled", false);
			}
			
		});
		
		// 비밀번호 입력 확인
		$(".pwdchk").blur(function(){
			if($(".pwd").val() != $(".pwdchk").val()){
				$("#pwd_check").text("비밀번호가 일치하지 않습니다");
				$("#pwd_check").css("color", "#d40000");
				$("#pwd_check").css("display", "block");
				$(".submit").attr("disabled", true);
			} else{
				$("#pwd_check").text("");
				$("#pwd_check").css("display", "hidden");
				$(".submit").attr("disabled", false);
			}
		});
		
		$(".submit").click(function(){
			
			if($(".user_id").val() == ""){
				alert("아이디는 필수 입력 항목입니다.");
			} 
			else if($(".pwd").val() == ""){
				alert("비밀번호는 필수 입력 항목입니다.");
			}
			else if($(".name").val() == ""){
				alert("이름은 필수 입력 항목입니다.");
			}
			else{
				$("#join").attr("action", "/Project_183st/memberController?type=join").submit();
			}
			
			
		});
	});
	
	
	// jsp를 이용한 값 이동
	/*function join_go(frm){
		console.log(this.id);
		frm.action="/Project_183st/memberController?type=join";
		frm.submit();
	}*/
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
				<h2>회원가입</h2>
			</div>
			
			<div class="titleArea" style="margin-bottom: 0px;">
			<h3>정보 입력</h3>
			</div>
			
			<div class="join_div">
			<form id="join" method="post">
				<fieldset>
				<table class="join_form">
				<tbody>
					<tr>
						<th>아이디*</th> 
						<td>
						<input type="text" class="user_id" name="id" placeholder="ID" required>
						<div id="id_check" style="display:none; margin-top: 2px; margin-bottom: 2px;"></div>
						</td>
					</tr>
					<tr>
						<th>비밀번호*</th>
						<td> 
						<input type="password" class="pwd" placeholder="비밀번호는 8글자 이상의 영문 및 숫자, 특수문자로 입력해주세요" name="pwd">
						<div id="pwd_validation" style="display:none; margin-top: 2px; margin-bottom: 2px;"></div>
						</td>
					</tr>
					<tr>
						<th>
						비밀번호 확인*
						</th> 
						<td>
						<input type="password" class="pwdchk">
						<div id="pwd_check" style="display:none; margin-top: 2px; margin-bottom: 2px;"></div>
						</td>
					</tr>
					
					<tr>
						<th>이름*</th> 
						<td>
						<input type="text" class="name" placeholder="이름" name="name">
						</td>
					</tr>
					
					<tr>
						<th>이메일</th>
						<td> 
						<input type="text" name="email">
						</td>
					</tr>
					
					<tr>
						<th>주소</th>
						<td> 
						<input type="text" name="addr" style="width: 500px;">
						</td>
					</tr>
					
					<tr>
						<th>전화번호</th>
						<td> 
							<select name="phone_head">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>&nbsp;-
							<input type="text" name="phone_1" width="50px">&nbsp;-
							<input type="text" name="phone_2" width="50px">
						</td>
					</tr>
					
				</tbody>
				</table>
				<div class="submitBtn" style="margin-top: 10px;">
					<input type="button" class="submit" value="가입하기" onclick="join_go(this.form)">
				</div>
			</fieldset>
			</form>
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