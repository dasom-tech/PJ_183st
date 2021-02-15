<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style>
	#titleArea{position:relative;border-bottom:1px solid #c2c2c2;background-color:#fff;}
	#titleArea h2{padding:0 61px 10px 61px;line-height:20px;font-size:15px;color:#2e2e2e;text-align:center;}
	
	.join_form { border:1px solid black; border-collapse:collapse; border-style: solid;}
	.join_form tr { border:1px solid black; border-style: solid none; }
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
	<div id="titleArea">
		<h2>회원가입</h2>
	</div>
	<form id="join" method="post">
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
	
</body>
</html>