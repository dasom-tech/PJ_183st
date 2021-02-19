package com.bc.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.common.mybatis.DBService;
import com.bc.review.vo.ReviewListVO;

public class ReviewDAO {
	public static List<ReviewListVO> getRivewList(String productno) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewListVO> list = ss.selectList("Review.reviewList", productno);
		ss.close();
		
		return list;
	}
}
