package com.bc.cart.model.vo;

public class CartVO {
	
	private String cartid,	productno,	id,	c_amount, productname, price;
	
	public CartVO() {	}

	public CartVO(String cartid, String productno, String id, String c_amount, String productname, String price) {
		this.cartid = cartid;
		this.productno = productno;
		this.id = id;
		this.c_amount = c_amount;
		this.productname = productname;
		this.price = price;
	}

	public String getCartid() {
		return cartid;
	}

	public void setCartid(String cartid) {
		this.cartid = cartid;
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

	public String getC_amount() {
		return c_amount;
	}

	public void setC_amount(String c_amount) {
		this.c_amount = c_amount;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CartVO [cartid=" + cartid + ", productno=" + productno + ", id=" + id + ", c_amount=" + c_amount
				+ ", productname=" + productname + ", price=" + price + "]";
	}
	
}
