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
<script src="main.js" defer></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lexend+Mega&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<style>
	#title_Area {
		position: relative;
		align-items: center;
		width: 500px;
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
	    width: 500px;
		height: 30px;
	}
	
	#join {
		position: absolute;
		width: 950px;
		height: 1650;
		item-align: center;
	}
	
	.titlaArea {
		display: flex;
		height: 45px;
		padding: 13px 0px 0px 14px;
		border-style: 1px solid #070707;
		item-align: center;
	}
	
	.titleArea h3 {
		padding: 0 61px 10px 61px;
	    line-height: 20px;
	    font-size: 13px;
		text-align: center;
		height: 45px;
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
						$(".submit").attr("disabled", true);
						return;
					} else {
						if(chkid == ""){
							$("#id_check").text("아이디를 입력해주세요");
							$("#id_check").css("color", "red");
							$(".submit").attr("disabled", true);
						}else{
							$("#id_check").text("");
							$(".submit").attr("disabled", false);
						}
					}
				},
				error : function(jqXHR, textStatus, errThrown){
					alert("Error");
				}
			});
			
		});
		
		// 비밀번호 입력 확인
		$(".pwdchk").blur(function(){
			if($(".pwd").val() != $(".pwdchk").val()){
				$("#pwd_check").text("비밀번호가 일치하지 않습니다");
				$("#pwd_check").css("color", "#d40000");
				$(".submit").attr("disabled", true);
			} else{
				$("#pwd_check").text("");
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
	<header>
	    <div class="wrap">                	
	        <div class="header_menu">
	            <a href="#" class="toggle"><i class="fas fa-bars"></i></a>
	            <a href="memberController?type=loginMove"><i class="fas fa-user"></i></a>
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
     <!-- ------ 공통부 ------ -->
	
	<main>
     <div class="warp" style="min-height: 820px;">
     	<section>
			<div id="title_Area">
				<h2>회원가입</h2>
			</div>
			
			<form id="join" method="post">
			<div class="titleArea">
			<h3>정보 입력</h3>
			</div>
			
			<table class="join_form">
			<tbody>
				<tr>
					<th>아이디*</th> 
					<td>
					<input type="text" class="user_id" name="id" placeholder="ID" required>
					<div id="id_check"></div>
					</td>
				</tr>
				<tr>
					<th>비밀번호*</th>
					<td> 
					<input type="password" class="pwd" placeholder="비밀번호는 4글자 이상의 영문 및 숫자, 특수문자로 입력해주세요" name="pwd">
					</td>
				</tr>
				<tr>
					<th>
					비밀번호 확인*
					</th> 
					<td>
					<input type="password" class="pwdchk">
					<div id="pwd_check"></div>
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
					<input type="text" name="addr">
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
						</select>-
						<input type="text" name="phone_1" width="50px">-
						<input type="text" name="phone_2" width="50px">
					</td>
				</tr>
				
			</tbody>
			</table>
				<input type="button" class="submit" value="회원 가입" onclick="join_go(this.form)">
			</form>
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