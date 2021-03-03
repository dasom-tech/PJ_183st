package com.bc.product;

import java.text.DecimalFormat;

public class ProductVO {

	private String productno, producttype, productname, info, image_s, image_l;
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
	
	public String getImage_s() {
		return image_s;
	}

	public void setImage_s(String image_s) {
		this.image_s = image_s;
	}

	public String getImage_l() {
		return image_l;
	}

	public void setImage_l(String image_l) {
		this.image_l = image_l;
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
				+ stock + ", info=" + info + ", image_s=" + image_s + ", image_l=" + image_l + "]";
	}
	
}
