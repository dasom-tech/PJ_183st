package com.bc.bbs.vo;

public class QnAListVO {
	private String bbs_no;
	private String productno;
	private String id;
	private String subject;
	private String contact;
	private String category;
	private String q_reg;
	
	public QnAListVO() {}

	public QnAListVO(String bbs_no, String productno, String id, String subject, String contact, String category, String q_reg) {
		this.bbs_no = bbs_no;
		this.productno = productno;
		this.id = id;
		this.subject = subject;
		this.contact = contact;
		this.category = category;
		this.q_reg = q_reg;
	}

	public String getBbs_no() {
		return bbs_no;
	}

	public void setBbs_no(String bbs_no) {
		this.bbs_no = bbs_no;
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
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getQ_reg() {
		return q_reg;
	}

	public void setQ_reg(String q_reg) {
		this.q_reg = q_reg;
	}

	@Override
	public String toString() {
		return "QnAListVO [bbs_no=" + bbs_no + ", productno=" + productno + ", id=" + id + ", subject=" + subject
				+ ", contact=" + contact + ", category=" + category + ", q_reg=" + q_reg + "]";
	}

}
