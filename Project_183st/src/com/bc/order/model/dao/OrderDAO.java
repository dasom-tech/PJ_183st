package com.bc.order.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.common.mybatis.DBService;
import com.bc.member.model.vo.MemberVo;
import com.bc.order.model.vo.OrderDetailVO;
import com.bc.order.model.vo.OrderInfoVO;
import com.bc.order.model.vo.OrderItemVO;
import com.bc.order.model.vo.OrderListVO;

public class OrderDAO {
	
	// 주문 정보 확인에 필요한 값을 검색
	public static OrderItemVO orderInfo (String cartid) {
		SqlSession ss = DBService.getFactory().openSession();
		OrderItemVO vo = ss.selectOne("Order.orderInfo", cartid);
		ss.close();
		return vo;
	}
	
	// 주문한 회원의 정보(주소, 전화번호)를 검색
	public static MemberVo orderMemberInfo (String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVo vo = ss.selectOne("Order.orderMemberInfo", id);
		ss.close();
		return vo;
	}
	
	// 주문 정보(OrderInfo) 삽입
	public static int insertOrderInfo(OrderInfoVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("Order.insertOrder", vo);
		ss.close();
		return result;
	}
	
	// 주문에 대한 물품 정보(OrderDetail) 삽입
	public static int insertOrderDetail(OrderDetailVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("Order.insertOrderDetail", vo);
		ss.close();
		return result;
	}
	
	// 주문에 따른 재고량 수정
	public static int updateStock(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("Order.updateStock", map);
		ss.close();
		return result;
	}
	
	// 주문 후 포인트 연산 반영
	public static int updatePoint(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("Order.updatePoint", map);
		ss.close();
		return result;
	}
	
	// 주문 후 주문한 내역을 장바구니에서 삭제
	public static int deleteCart(String cartid) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("Order.deleteCart", cartid);
		ss.close();
		return result;
	}
	
	// 주문번호 생성을 위한 시퀀스 번호 채번
	public static String getSequence() {
		SqlSession ss = DBService.getFactory().openSession();
		String getSeq = ss.selectOne("Order.getOrderSeq");
		ss.close();
		return getSeq;
	}
	
	// 로그인한 사용자의 주문 내역을 불러오기 위한 select
	public static List<OrderListVO> getOrderList(String id){
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("Order.getOrderList", id);
		ss.close();
		return list;
	}
	
	// 주문 내역에 추가할 상품명 리스트 불러오기
	public static List<String> getOrderProductname(String orderid){
		SqlSession ss = DBService.getFactory().openSession();
		List<String> list = ss.selectList("Order.getOrderProductname", orderid);
		ss.close();
		return list;
	}
	
	// 주문 상세 내역에서 조회할 상품 정보
	public static List<OrderDetailVO> getOrderDetail(String orderid){
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderDetailVO> list = ss.selectList("Order.getOrderDetail", orderid);
		ss.close();
		return list;
	}
	
	// 주문 상세 내역에서 조회할 주문 정보
	public static OrderInfoVO getOrderInfo(String orderid) {
		SqlSession ss = DBService.getFactory().openSession();
		OrderInfoVO info = ss.selectOne("Order.getOrderInfo", orderid);
		ss.close();
		return info;
	}
	
}
