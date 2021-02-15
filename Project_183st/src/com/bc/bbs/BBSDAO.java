package com.bc.bbs;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.bbs.vo.QnAListVO;
import com.bc.common.DBService;

// QnA 게시판
public class BBSDAO {
	
	//게시글의 전체 갯수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("BBS.totalCount");
		ss.close();
		
		return totalCount;
	}
	
	//페이지에 해당하는 게시글 조회
	public static List<QnAListVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<QnAListVO> list = ss.selectList("BBS.list", map);
		ss.close();
		
		return list;
	}
	
	//게시글 상세페이지
	public static QnAListVO selectOne(String bbs_no) {
		SqlSession ss = DBService.getFactory().openSession();
		QnAListVO vo = ss.selectOne("BBS.one", bbs_no);
		ss.close();
		
		return vo;
	}
	
	public static int insert(QnAListVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("BBS.insert", vo);
		ss.close();
		
		return result;
	}
}













