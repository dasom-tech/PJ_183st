<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	
	$(function(){
		
		$("#pwdchk").blur(function(){
			
			if($("#pwd").val() != null && $("#pwd").val() != $("#pwdchk").val()){
				$(".pwdmatch").text("비밀번호가 일치하지 않습니다");
				$(".pwdmatch").css("color", "red");
			} else{
				$(".pwdmatch").text("");
			}
			
		});
		
		$(".submit").click(function(){
			if($("#pwd").val() != null && $("#pwd").val() != $("#pwdchk").val()){
				alert("비밀번호 입력을 확인해주세요");
			} else{
				$("#modify").attr("action", "/Project_183st/memberController?type=modify").submit();
			}
		});
		
	});

</script>
</head>
<body>
	<form id="modify" method="post">
		아이디 <input type="text" name="id" value="${member.id }" readonly><br><br>
		비밀번호 <input type="password" id="pwd" name="pwd"><br><br>
		비밀번호 확인 <input type="password" id="pwdchk"><br><br>
		<div class="pwdmatch"></div>
		이름 <input type="text" name="name" value="${member.name }" readonly><br><br>
		이메일 <input type="text" name="email" value="${member.email }"><br><br>
		주소 <input type="text" name="addr" value="${member.addr }"><br><br>
		전화번호 <input type="text" name="phone" value="${member.phone }"><br><br>
		<input type="button" class="submit" value="수정">
	</form>
</body>
</html>