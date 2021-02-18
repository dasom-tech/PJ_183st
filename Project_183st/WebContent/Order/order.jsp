<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	
	$(function(){
		
		// 포인트를 입력하고 사용하는 버튼을 눌렀을 때 수행하는 작업
		$(".usePoint").click(function(){
			//alert("테스트");
			if('${orderedMember.point  }' < $(".inputPoint").val()){
				alert("사용할 수 있는 포인트보다 많습니다");
			} else{
				var tot = '${total}' - $(".inputPoint").val();
				var remainPoint = '${orderedMember.point }' - $(".inputPoint").val();
				var usedPoint = '${orderedMember.point }' - remainPoint;
				$(".finTot").text(tot);
				$(".totPoint").text(remainPoint);
				$(".totalPrice").prop("value", tot);
				$(".usedPoint").prop("value", usedPoint);
			}
			
		});
		
		// 주문정보의 라디오 버튼을 눌렀을 때 수행하는 작업
		$("input:radio[name=inputInfo]").click(function(){
			if($("input:radio[value=newInput]").is(':checked')){
				//alert("신규 입력 테스트");
				$(".phone_head").val('010').prop("selected", true);
				$(".name").prop("value", "");
				$(".addr").prop("value", "");
				$(".phone_1").prop("value", "");
				$(".phone_2").prop("value", "");
			}
			if($("input:radio[value=memberInfo]").is(':checked')){
				//alert("테스트");
				var phone_head = '${orderedMember.phone}'.substr(0, 3);
				var phone1 = '${orderedMember.phone}'.substr(4, 4);
				var phone2 = '${orderedMember.phone}'.substr(9, 4);
				
				$(".phone_head").val(phone_head).prop("selected", true);
				$(".name").prop("value", "${orderedMember.name}");
				$(".addr").prop("value", "${orderedMember.addr}");
				$(".phone_1").prop("value", phone1);
				$(".phone_2").prop("value", phone2);
			}
		});
		
		// 주문하기 버튼을 눌렀을 때 수행하는 작업
		$(".orderConfirm").click(function(){
			
			if($(".name").prop("value") == ""){
				alert("주문자 성명을 입력해주세요");
				return;
			}
			if($(".addr").prop("value") == ""){
				alert("배송 주소를 입력해주세요");
				return;
			}
			if($(".phone_1").prop("value") == "" || $(".phone_2").prop("value") == ""){
				alert("전화번호를 입력해주세요");
				return;
			}
			
			$("#orderInfo").submit();
		});
		
		
	});
	
	
	
</script>
</head>
<body>
	<h1>주문하기</h1>
	<div id="orderform">
		<form action="OrderController?type=orderProc" id="orderInfo" method="post">
			<div id="orderList">
			<c:forEach var="list" items="${orderItems }">
			<div class="orderItem">
				<p>${list.productname }</p>
				<p>가격 : ${list.price } 원</p>
				<p>주문수량 : ${list.c_amount }</p>
				<input type="hidden" name="cartid" value="${list.cartid }"> 
				<input type="hidden" name="productno" value="${list.productno }">
				<input type="hidden" name="c_amount" value="${list.c_amount }">
				<hr>
			</div>
			</c:forEach>
			</div>
			<div id="orderInfo">
			<table>
				<tr>
					<th>주문 정보</th>
				</tr>
				<tr>
					<td><input type="radio" name="inputInfo" value="newInput" checked>신규 작성 
						<input type="radio" name="inputInfo" value="memberInfo">회원 정보와 동일
					</td>
				</tr>
				<tr>
					<td>주문자 : <input type="text" class="name" name="name"></td>
				</tr>
				<tr>
					<td>주소 : <input type="text" class="addr" name="addr"></td>
				</tr>
				<tr>
					<td>전화번호 : 
						<select class="phone_head" name="phone_head">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>-
						<input type="text" class="phone_1" name="phone_1" width="50px">-
						<input type="text" class="phone_2" name="phone_2" width="50px">
					</td>
				</tr>
			</table>
			</div>
			<hr>
			<div id="receipt">
			<p>사용할 수 있는 포인트 : <label class="totPoint">${orderedMember.point }</label>&nbsp;
				포인트 사용 : <input type="number" class="inputPoint" value="0"><input type="button" class="usePoint" value="사용"></p>
			<p>총 금액 : <label class="finTot">${total }</label> 원</p>
			<input type="hidden" class="totalPrice" name="totalPrice" value="${total }">
			<input type="hidden" class="usedPoint" name="usedPoint" value="0">
			<input type="hidden" name="cartidList" value="${orderItems }">
			</div>
			<input type="button" class="orderConfirm" value="주문하기">
		</form>
	</div>
</body>
</html>