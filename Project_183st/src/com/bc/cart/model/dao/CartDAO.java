package com.bc.cart.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.cart.model.vo.CartListVO;
import com.bc.common.mybatis.DBService;
import com.bc.product.ProductVO;

public class CartDAO {
	
	// ����� ��ٱ��� ��ȸ
	public static List<CartListVO> cartList(String id){
		SqlSession ss = DBService.getFactory().openSession();
		List<CartListVO> list = ss.selectList("Cart.cartList", id);
		ss.close();
		return list;
	}
	
	// 장바구니 수량 변경 시 재고 수량과 비교 확인
	public static boolean chkStock(String cartid, int amount) {
		SqlSession ss = DBService.getFactory().openSession();
		int stock = ss.selectOne("Cart.chkStock", cartid);
		ss.close();
		// 재고가 주문 수량보다 많은 경우
		if(stock >= amount) {
			return true;
		}
		// 재고가 주문 수량보다 적은 경우(오류 페이지로 빼기 위함)
		return false;
	}
	
	// 장바구니 수량 변경
	public static int changeAmount(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("Cart.modAmount", map);
		ss.close();
		return result;
	}
	
	// 장바구니에서 삭제
	public static int deleteItem(String cartid) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("Cart.deleteItem", cartid);
		ss.close();
		return result;
	}
	
	// 장바구니에 추가
		public static int insertItem(Map<String, String> map) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("Cart.insertItem", map);
			ss.close();
			return result;
		}
	
	// 상품 페이지에서 주문하기 클릭 시 단일 품목 삽입
	public static int insertOneItem(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("Cart.insertOneItem", map);
		ss.close();
		return result;
	}
		
	public static String selectCartItem(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		String cartid = ss.selectOne("Cart.selectCartItem", map);
		ss.close();
		return cartid;
	}
	
	
}
