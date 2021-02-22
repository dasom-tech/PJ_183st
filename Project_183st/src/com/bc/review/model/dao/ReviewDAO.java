package com.bc.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.common.mybatis.DBService;
import com.bc.review.vo.ReviewListVO;

public class ReviewDAO {
	
	//상품번호를 사용하여 리뷰 조회
	public static List<ReviewListVO> getRivewList(String productno) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewListVO> list = ss.selectList("Review.reviewList", productno);
		ss.close();
		
		return list;
	}
	
	//리뷰 작성
	public static int reviewInsert(ReviewListVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("Review.reviewInsert", vo);
		ss.close();
		
		return result;
	}
	
	//리뷰 삭제
	public static int reviewDelete(String reviewId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("Review.reviewDelete", reviewId);
		ss.close();
		
		return result;
	}
}



















