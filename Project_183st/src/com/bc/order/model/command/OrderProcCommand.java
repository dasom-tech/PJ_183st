package com.bc.order.model.command;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.order.model.dao.OrderDAO;
import com.bc.order.model.vo.OrderDetailVO;
import com.bc.order.model.vo.OrderInfoVO;

public class OrderProcCommand implements OrderCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone_head") + "-" + request.getParameter("phone_1") + "-" + request.getParameter("phone_2");
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		int originPoint = Integer.parseInt(request.getParameter("originPoint"));
		int usedPoint = Integer.parseInt(request.getParameter("usedPoint"));
		
		// 결제 총 금액, 사용한 포인트 값 출력 테스트
		//System.out.println("totalPrice : " + totalPrice);
		//System.out.println("userPoint : " + usedPoint);
		
		String []cartid = request.getParameterValues("cartid");
		String []productno = request.getParameterValues("productno");
		String []c_amount = request.getParameterValues("c_amount");
		String []price = request.getParameterValues("price");
		String []productname = request.getParameterValues("productname");
		String []image_s = request.getParameterValues("image_s");
		
		// 주문번호 생성을 위한 처리
		java.util.Date now = new java.util.Date();
	    SimpleDateFormat vans = new SimpleDateFormat("yyyyMMdd");
	    String wdate = vans.format(now);
	    
	    String orderKey = OrderDAO.getSequence();
	    String orderid = "S" + wdate + "_" + orderKey;
		
	    // 주문 목록에 넣을 VO 생성
		OrderInfoVO orderinfo = new OrderInfoVO();
		orderinfo.setOrderid(orderid);
		orderinfo.setId(id);
		orderinfo.setName(name);
		orderinfo.setAddr(addr);
		orderinfo.setPhone(phone);
		orderinfo.setPoint("" + usedPoint);
		orderinfo.setTotalprice("" + totalPrice);
		
		int result = OrderDAO.insertOrderInfo(orderinfo);
		//System.out.println("주문 처리 건수 : " + result);
		
		// 주문정보 출력 테스트
		//System.out.println("orderinfo : " + orderinfo.toString());
		
		// OrderDetail VO 생성 및 삽입 처리
		for (int i = 0; i < productno.length; i++) {
			// 주문한 제품에 대한 정보 저장(OrderDetail)
			OrderDetailVO vo = new OrderDetailVO();
			vo.setOrderid(orderid);
			vo.setO_amount(c_amount[i]);
			vo.setPrice(price[i]);
			vo.setProductno(productno[i]);
			vo.setProductname(productname[i]);
			vo.setImage_s(image_s[i]);
			
			int result2 = OrderDAO.insertOrderDetail(vo);
			//System.out.println("result2 : " + result2);
			
			// 주문 수량에 따른 재고량 변화
			Map<String, String> map = new HashMap<String, String>();
			map.put("productno", productno[i]);
			map.put("c_amount", c_amount[i]);
			int result3 = OrderDAO.updateStock(map);
			//System.out.println("result3 : " + result3);
		}
		
		// 주문 후 포인트 연산 후 테이블 반영
		int point = originPoint - usedPoint + ((totalPrice + usedPoint) * 1 / 100);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("point", "" + point);
		result = OrderDAO.updatePoint(map);
		//System.out.println("point result : " + result);
		
		// 주문한 상품의 장바구니 내역 삭제
		for (String cartlist : cartid) {
			int result5 = OrderDAO.deleteCart(cartlist);
			//System.out.println("cart delete result : " + result5);
		}
		
		return "Order/orderFin.jsp";
	}
	
}
