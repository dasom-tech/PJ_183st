package com.bc.order.model.vo;

public class OrderListVO {
	private String orderid, productname,	totalprice;
	
	public OrderListVO() {	}

	public OrderListVO(String orderid, String productname, String totalprice) {
		this.orderid = orderid;
		this.productname = productname;
		this.totalprice = totalprice;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}

	@Override
	public String toString() {
		return "OrderListVO [orderid=" + orderid + ", productname=" + productname + ", totalprice=" + totalprice + "]";
	}
	
}
