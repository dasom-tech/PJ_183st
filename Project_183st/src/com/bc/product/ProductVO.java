package com.bc.product;

public class ProductVO {
	private String productno, producttype, productname, info;
	private int price, stock;

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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getProdducttype() {
		return producttype;
	}

	public void setproducttype(String producttype) {
		this.producttype = producttype;
	}

	@Override
	public String toString() {
		return "ProductVO [productno=" + productno + ", producttype=" + producttype + ", productname=" + productname + ", price=" + price + ", stock="
				+ stock + ", info=" + info + "]";
	}
	
}
