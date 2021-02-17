package com.bc.order.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.bc.common.mybatis.DBService;
import com.bc.member.model.vo.MemberVo;
import com.bc.order.model.vo.OrderItemVO;

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
	
}
