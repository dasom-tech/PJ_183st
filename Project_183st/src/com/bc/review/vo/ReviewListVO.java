package com.bc.review.vo;

public class ReviewListVO {
	private String reviewId;
	private String productno;
	private String id;
	private String review;
	private String r_reg;
	
	public ReviewListVO() {}

	public ReviewListVO(String reviewId, String productno, String id, String review, String r_reg) {
		this.reviewId = reviewId;
		this.productno = productno;
		this.id = id;
		this.review = review;
		this.r_reg = r_reg;
	}
	
	public String getReviewId() {
		return reviewId;
	}

	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}

	public String getProductno() {
		return productno;
	}

	public void setProductno(String productno) {
		this.productno = productno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getR_reg() {
		return r_reg;
	}

	public void setR_reg(String r_reg) {
		this.r_reg = r_reg;
	}

	@Override
	public String toString() {
		return "ReviewListVO [reviewId=" + reviewId + ", productno=" + productno + ", id=" + id
				+ ", review=" + review + ", r_reg=" + r_reg + "]";
	}
}
