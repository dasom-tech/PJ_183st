package com.bc.order.model.vo;

public class OrderListVO {
	// 주문완료 시 insert하는 타입
	private String orderno,	productno,	id,	o_amount,	o_addr,	o_phone;
	
	public OrderListVO() {	}

	public OrderListVO(String orderno, String productno, String id, String o_amount, String o_addr, String o_phone) {
		this.orderno = orderno;
		this.productno = productno;
		this.id = id;
		this.o_amount = o_amount;
		this.o_addr = o_addr;
		this.o_phone = o_phone;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
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

	public String getO_amount() {
		return o_amount;
	}

	public void setO_amount(String o_amount) {
		this.o_amount = o_amount;
	}

	public String getO_addr() {
		return o_addr;
	}

	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
	}

	public String getO_phone() {
		return o_phone;
	}

	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}

	@Override
	public String toString() {
		return "OrderListVO [orderno=" + orderno + ", productno=" + productno + ", id=" + id + ", o_amount=" + o_amount
				+ ", o_addr=" + o_addr + ", o_phone=" + o_phone + "]";
	}
	
}
