package com.bc.order.model.vo;

public class OrderInfoVO {
	private String orderid,	id,	name, addr,	phone,	point,	totalprice;
	
	public OrderInfoVO() {	}

	public OrderInfoVO(String orderid, String id, String name, String addr, String phone, String point,
			String totalprice) {
		this.orderid = orderid;
		this.id = id;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.point = point;
		this.totalprice = totalprice;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}

	@Override
	public String toString() {
		return "OrderInfo [orderid=" + orderid + ", id=" + id + ", name=" + name + ", addr=" + addr + ", phone=" + phone
				+ ", point=" + point + ", totalprice=" + totalprice + "]";
	}
	
}
