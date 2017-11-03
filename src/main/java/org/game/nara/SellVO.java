package org.game.nara;

import org.springframework.web.multipart.MultipartFile;

public class SellVO {
	@Override
	public String toString() {
		return "SellVO [no=" + no + ", writer=" + writer + ", title=" + title + ", price=" + price + ", detail="
				+ detail + ", contact=" + contact + ", deal_method=" + deal_method + ", regdate="
				+ regdate + ", state=" + state + ", category=" + category + ", count=" + count + ", pic=" + pic+"]";
	}
	private int no;
	private String writer;
	private String title;
	private int price;
	private String detail;
	private String contact;
	private String deal_method;
	private String regdate;
	private String state;
	private int category;
	private int count;
	private String pic;
	private MultipartFile picdata;
	
	public MultipartFile getPicdata() {
		return picdata;
	}
	public void setPicdata(MultipartFile picdata) {
		this.picdata = picdata;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getNo() {
		return no;

	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getDeal_method() {
		return deal_method;
	}
	public void setDeal_method(String deal_method) {
		this.deal_method = deal_method;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
