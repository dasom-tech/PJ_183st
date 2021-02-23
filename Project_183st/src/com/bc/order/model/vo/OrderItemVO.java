package com.bc.order.model.vo;

public class OrderItemVO {
	// 주문 직전 표시해 줄 주문한 상품의 정보 VO
	private String cartid, productno, productname, price, c_amount, image_s;
	
	public OrderItemVO() {	}

	

	public OrderItemVO(String cartid, String productno, String productname, String price, String c_amount,
			String image_s) {
		this.cartid = cartid;
		this.productno = productno;
		this.productname = productname;
		this.price = price;
		this.c_amount = c_amount;
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

	public String getC_amount() {
		return c_amount;
	}

	public void setC_amount(String c_amount) {
		this.c_amount = c_amount;
	}

	public String getImage_s() {
		return image_s;
	}

	public void setImage_s(String image_s) {
		this.image_s = image_s;
	}

	@Override
	public String toString() {
		return "OrderItemVO [cartid=" + cartid + ", productno=" + productno + ", productname=" + productname
				+ ", price=" + price + ", c_amount=" + c_amount + ", image_s=" + image_s + "]";
	}
	
}
