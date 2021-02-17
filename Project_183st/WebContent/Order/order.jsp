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
			alert("테스트");
			if('${orderedMember.point  }' < $(".inputPoint").val()){
				alert("사용할 수 있는 포인트보다 많습니다");
			} else{
				var tot = '${orderedMember.point }' - $(".inputPoint").val();
				$(".finTot").text(tot);
			}
			
		});
		
		
	});
	
	
	
</script>
</head>
<body>
	<h1>주문하기</h1>
	<div id="orderList">
	<c:forEach var="list" items="${orderItems }">
	<div class="orderItem">
		<p>${list.productname }</p>
		<p>가격 : ${list.price } 원</p>
		<p>주문수량 : ${list.c_amount }</p>
		<hr>
	</div>
	</c:forEach>
	<p>사용할 수 있는 포인트 : ${orderedMember.point }&nbsp;
		포인트 사용 : <input type="number" class="inputPoint" value="0"><input type="button" class="usePoint" value="사용"></p>
	<p>총 금액 : <label class="finTot">${total }</label> 원</p>
	</div>
	<hr>
	<div id="orderInfo">
	</div>
	
</body>
</html>