package com.bc.product;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.common.mybatis.DBService;

public class ProductDAO {
	
	public ProductDAO() {}
	
		//상품 개수 조회
		public static int getCntProductListByType(HashMap<String,Object> paramMap) {
			SqlSession ss = DBService.getFactory().openSession();
			int cnt = ss.selectOne("products.getCntProductListByType",paramMap);
			ss.close();
			
			return cnt;
		}
		
		//상품 목록 조회
		public static List<ProductVO> getProductListByType(HashMap<String,Object> paramMap) {
			SqlSession ss = DBService.getFactory().openSession();
			List<ProductVO> list = ss.selectList("products.selectProductListByType",paramMap);
			ss.close();
			
			return list;
		}

		public static ProductVO selectProductInfo(String productno) {
			SqlSession ss = DBService.getFactory().openSession();
			ProductVO info = ss.selectOne("products.selectProductInfo",productno);
			ss.close();
			
			return info;
		}
}
