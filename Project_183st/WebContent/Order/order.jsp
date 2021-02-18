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
		
		$(".usePoint").click(function(){
			//alert("테스트");
			if('${orderedMember.point  }' < $(".inputPoint").val()){
				alert("사용할 수 있는 포인트보다 많습니다");
			} else{
				var tot = '${total}' - $(".inputPoint").val();
				var remainPoint = '${orderedMember.point }' - $(".inputPoint").val()
				$(".finTot").text(tot);
				$(".totPoint").text(remainPoint);
			}
			
		});
		
		
	});
	
	
	
</script>
</head>
<body>
	<h1>주문하기</h1>
	<div id="orderform">
		<form method="post">
			<div id="orderList">
			<c:forEach var="list" items="${orderItems }">
			<div class="orderItem">
				<p>${list.productname }</p>
				<p>가격 : ${list.price } 원</p>
				<p>주문수량 : ${list.c_amount }</p>
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
					<td>주문자 : <input type="text" name="name"></td>
				</tr>
				<tr>
					<td>주소 : <input type="text" name="addr"></td>
				</tr>
				<tr>
					<td>전화번호 : 
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
			</table>
			</div>
			<hr>
			<div id="receipt">
			<p>사용할 수 있는 포인트 : <label class="totPoint">${orderedMember.point }</label>&nbsp;
				포인트 사용 : <input type="number" class="inputPoint" value="0"><input type="button" class="usePoint" value="사용"></p>
			<p>총 금액 : <label class="finTot" name="totalReceipt">${total }</label> 원</p>
			</div>
		</form>
	</div>
</body>
</html>