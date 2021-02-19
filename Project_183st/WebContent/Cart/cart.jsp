<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function(){
		
		$(".modAmount").click(function(){
			var cartid = event.srcElement.name;
			//alert("cartid : " + cartid);
			var modAmount = $('.modAmount[name="' + cartid + '"]').prev().val();
			//alert(modAmount);
			
			if(modAmount < 1){
				alert("상품의 갯수는 1개 미만으로 변경할 수 없습니다");
			} else {
				location.href="CartController?type=modAmount&cid=" + cartid + "&amount=" + modAmount;
			}
		});
		
		$(".deleteItem").click(function(){
			var deleteid = event.srcElement.name;
			
			var chk = confirm("해당 상품을 장바구니에서 삭제하시겠습니까?");
			
			if(chk){
				location.href="CartController?type=deleteItem&cid=" + deleteid;
			} else{
				return;
			}
		});

		$(".sDelete").click(function(){
	        var sDchk = confirm("체크된 상품을 장바구니에서 삭제하시겠습니까?");
	        
	        if(sDchk){
	        	
	        	$("input[name='cartid']:checked").each(function(){
	        		// 반복문 테스트 출력
	        		//alert($(this).attr("value"));
	        		location.href="CartController?type=deleteItem&cid=" + $(this).attr("value");
	        	});
	        	
	        } else{
	           return;
	        }
	     });
	     
	     $(".selectAll").click(function(){
	        if($("input[type=checkbox]").prop("checked")){
	           $("input[type=checkbox]").prop("checked", false);
	        } else{
	           $("input[type=checkbox]").prop("checked", true);
	        }
	     });
	     
	     $(".return").click(function(){
	        location.href="main.jsp";
	     });
	});
</script>
</head>
<body>
	<h2>장바구니 페이지</h2>
	
	<div>
	<c:if test="${empty UserCart }">
		<p>장바구니에 상품이 없습니다</p>
		<p><input type="button" class="return" value="돌아가기"></p>
	</c:if>
	<c:if test="${!empty UserCart }">
	<form action="OrderController?type=orderMove" method="post">
		<c:forEach var="list" items="${UserCart }">
			<div>
				<input type="checkbox" name="cartid" value="${list.cartid }">
				<p>${list.productname }</p>
				<p>${list.price }원</p>
				<p>수량 : <input type="number" name="amount" value="${list.c_amount }"><input type="button" class="modAmount" name="${list.cartid }" value="수정">
				&nbsp;<input type="button" class="deleteItem" name="${list.cartid }" value="삭제"></p>
			</div>
			<hr>
		</c:forEach>
	<p>총액 : ${total }원</p>
	<p><input type="button" class="selectAll" value="전체선택"><input type="button" class="sDelete" value="선택삭제"></p>
	<p><input type="submit" value="주문하기"><input type="button" class="return" value="돌아가기"></p>
	</form>
	</c:if>
	</div>
	
</body>
</html>