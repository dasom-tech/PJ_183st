package com.bc.cart.model.vo;

public class CartListVO {
	
	private String cartid,	productno,	id,	c_amount, productname, price, image_s;
	
	public CartListVO() {	}

	public CartListVO(String cartid, String productno, String id, String c_amount, String productname, String price,
			String image_s) {
		super();
		this.cartid = cartid;
		this.productno = productno;
		this.id = id;
		this.c_amount = c_amount;
		this.productname = productname;
		this.price = price;
		this.image_s = image_s;
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

	public String getImage_s() {
		return image_s;
	}

	public void setImage_s(String image_s) {
		this.image_s = image_s;
	}

	@Override
	public String toString() {
		return "CartListVO [cartid=" + cartid + ", productno=" + productno + ", id=" + id + ", c_amount=" + c_amount
				+ ", productname=" + productname + ", price=" + price + ", image_s=" + image_s + "]";
	}
	
}
