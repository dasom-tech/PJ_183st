package com.bc.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.common.mybatis.DBService;
import com.bc.member.model.vo.MemberVo;

public class MemberDao {
	
	// id 중복 확인
	public static List<String> overlapChk() {
		SqlSession ss = DBService.getFactory().openSession();
		List<String> list = ss.selectList("Member.overlapChk");
		ss.close();
		return list;
	}
	
	// 회원 가입
	public static int joinMember(MemberVo vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("Member.insert", vo);
		ss.close();
		return result;
	}
	
	// 로그인
	public static MemberVo loginMember(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVo member = ss.selectOne("Member.login", map);
		ss.close();
		return member;
	}
	
	// 로그인 정보 유효성 검사
	/*public static int loginValidation(Map<String, String> map) {
		MemberVo member = loginMember(map);
		String pwd = "";
		
		// 아이디가 존재하지 않는 경우
		if(member == null) {
			return -1;
		} else {
			pwd = map.get("pwd");
		}
		
		// 비밀번호가 틀린 경우
		if(!pwd.equals(member.getPwd())) {
			return -2;
		}
		
		// 정상 로그인 처리
		return 1;
	}*/
	
	// 정보 수정을 위한 selectAll
	public static MemberVo modifyMember(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVo member = ss.selectOne("Member.sMember", map);
		ss.close();
		return member;
	}
	
	// 정보 수정 작업을 수행(update ~ set ~)
	public static int modMember(MemberVo vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("Member.modify", vo);
		ss.close();
		return result;
	}
	
	// 회원 탈퇴
	public static int deleteMember(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("Member.leave", id);
		ss.close();
		return result;
	}
	
	// 마이페이지 접속 시 주문 건수 조회
	public static int getOrderCount(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		int count = ss.selectOne("Member.getOrderCount", id);
		ss.close();
		return count;
	}
	
	// 마이페이지 접속 시 문의 건수 조회
	public static int getContactCount(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		int count = ss.selectOne("Member.getContactCount", id);
		ss.close();
		return count;
	}
	
	// 마이페이지 접속 시 보유 포인트 조회
	public static int getMemberPoint(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		int point = ss.selectOne("Member.getMemberPoint", id);
		ss.close();
		return point;
	}
	
}
