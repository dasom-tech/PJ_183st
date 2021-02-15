<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	#titleArea{position:relative;border-bottom:1px solid #c2c2c2;background-color:#fff;}
	#titleArea h2{padding:0 61px 10px 61px;line-height:20px;font-size:15px;color:#2e2e2e;text-align:center;}
	
	.formBox{position:relative;margin:0px 14px 0;font-size:11px;}
	.formBox .form{margin:0 0px 0 0;}
	
	.formBox .btnArea.type1{margin:14px auto 0;}
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
		
	});
</script>
</head>
<body>
<div>
	<div id="titleArea">
		<h2>로그인</h2>
	</div>
	<form action="/Project_183st/memberController?type=login" id="login" method="post">
	<div id="login_module">
		<fieldset>
		<div class="formBox">
			<div class="form">
			<input type="text" placeholder="아이디" class="inputId" name="id"><br>
			<div class="idchk"></div>
			<input type="password" placeholder="패스워드" class="inputPwd" name="pwd"><br>
			<div class="pwdchk"></div>
			</div>
			<div class="btnArea type1">
			<input type="button" value="로그인" id="loginBtn">
			</div>
		</div>
		</fieldset>
	</div>
	</form>
</div>
</body>
</html>