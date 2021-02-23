package com.bc.order.model.vo;

public class OrderDetailVO {
	private String o_detailid,	orderid,	productno,	o_amount,	price,	productname, image_s;
	
	public OrderDetailVO() {	}

	public OrderDetailVO(String o_detailid, String orderid, String productno, String o_amount, String price,
			String productname, String image_s) {
		super();
		this.o_detailid = o_detailid;
		this.orderid = orderid;
		this.productno = productno;
		this.o_amount = o_amount;
		this.price = price;
		this.productname = productname;
		this.image_s = image_s;
	}

	public String getO_detailid() {
		return o_detailid;
	}

	public void setO_detailid(String o_detailid) {
		this.o_detailid = o_detailid;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getProductno() {
		return productno;
	}

	public void setProductno(String productno) {
		this.productno = productno;
	}

	public String getO_amount() {
		return o_amount;
	}

	public void setO_amount(String o_amount) {
		this.o_amount = o_amount;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}
	
	public String getImage_s() {
		return image_s;
	}

	public void setImage_s(String image_s) {
		this.image_s = image_s;
	}

	@Override
	public String toString() {
		return "OrderDetailVO [o_detailid=" + o_detailid + ", orderid=" + orderid + ", productno=" + productno
				+ ", o_amount=" + o_amount + ", price=" + price + ", productname=" + productname + ", image_s="
				+ image_s + "]";
	}
	
}
