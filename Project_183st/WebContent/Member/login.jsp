<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="path_role" content="MAIN">
<meta name="author" content="183스트리트">
<meta name="description" content="183스트리트 - 의류 쇼핑몰">
<meta name="keywords" content="183ST">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" type="text/css" href="common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<style>
	.main-warp {
		height:900px;
		top:500px;
	}
	
	.title_Area {
		margin-top: 40px;
		position: relative;
	    border-bottom: 1px solid #c2c2c2;
	    background-color:#8f5b52;
	    text-align:center;
	}
	
	form {
		margin: 0 auto;
		width: 400px;
		padding: 1em;
		margin-top: 20px;
	}
	
	input {
		margin: 2px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		// 로그인 버튼 클릭 시 동작
		$("#loginBtn").click(function(){
			
			if($(".inputId").val() == ""){
				$(".idchk").text("아이디를 입력해주세요");
				$(".idchk").css("color", "red");
			}
			
			if($(".inputPwd").val() == ""){
				$(".pwdchk").text("비밀번호를 입력하세요");
				$(".pwdchk").css("color", "red");
			}
			
			if($(".inputId").val() != "" && $(".inputPwd").val() != ""){
				$("#login").submit();
				$("#id").val("");
			}
		});
		
		// 위의 문장이 작동한 이후 정보 입력 시 div를 초기화
		$(".inputId").blur(function(){
			$(".idchk").text("");
		});
		$(".inputPwd").blur(function(){
			$(".pwdchk").text("");
		});
		
		$(".menu").click(function(){
			$("nav").attr("visibility", "visible");
		});
		
	});
</script>
</head>
<body>
	<header>
         <div>
             <a class="menu" href=""><i class="fas fa-bars"></i></a>
             <a href=""><i class="fas fa-search"></i></a>
         </div>
         <div class="main-logo"><a href="">183ST</a></div>
         <div>
             <a href=""><i class="fas fa-user"></i></a>
             <a href=""><i class="fas fa-shopping-cart"></i></a>
         </div>    
     </header>
     <nav>
            <ul>
                <li><a href="">ALL</a></li>
                <li><a href="">TOP</a></li>
                <li><a href="">BOTTOM</a></li>
            </ul>
     </nav>
     <!-- ------ 공통부 ------ -->
     
     
     
     <main>
     <div class="main-warp">
     	<div class="title_Area">
     	<h2>로그인</h2>
     	</div>
		<form action="/Project_183st/memberController?type=login" id="login" method="post">
				<fieldset>
					<input type="text" placeholder="아이디" class="inputId" name="id"><br>
					<div class="idchk"></div>
					<input type="password" placeholder="패스워드" class="inputPwd" name="pwd"><br>
					<div class="pwdchk"></div>
					<input type="button" value="로그인" id="loginBtn">
				</fieldset>
		</form>
	  </div>
	  </main>
	
	
	
	<!-- ------ 이하 공통부 ------ -->
	<footer>
	</footer>
</body>
</html>