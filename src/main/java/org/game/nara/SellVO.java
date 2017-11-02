package org.game.nara;

public class SellVO {

<<<<<<< HEAD
	private int NO;
	private String WRITER;
	private String TITLE;
	private int PRICE;
	private String DETAIL;
	private String CONTACT;
	private String DEAL_METHOD;
	private String PIC;
	private String REGDATE;
	private String STATE;
	private int CATEGORY;
	private int COUNT;
	public int getNO() {
		return NO;
=======
	private int no;
	
	private String writer;
	private String title;
	private int price;
	private String detail;
	private String contact;
	private String deal_method;
	private String pic;
	private String regdate;
	private String state;
	private int category;
	private int count;
	@Override
	public String toString() {
		return "SellVO [no=" + no + ", writer=" + writer + ", title=" + title + ", price=" + price + ", detail="
				+ detail + ", contact=" + contact + ", deal_method=" + deal_method + ", pic=" + pic + ", regdate="
				+ regdate + ", state=" + state + ", category=" + category + ", count=" + count + "]";
	}
	public int getNo() {
		return no;
>>>>>>> branch 'master' of https://github.com/yacle/GameNara.git
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
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
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
	@Override
	public String toString() {
		return "SellVO [NO=" + NO + ", WRITER=" + WRITER + ", TITLE=" + TITLE + ", PRICE=" + PRICE + ", DETAIL="
				+ DETAIL + ", CONTACT=" + CONTACT + ", DEAL_METHOD=" + DEAL_METHOD + ", PIC=" + PIC + ", REGDATE="
				+ REGDATE + ", STATE=" + STATE + ", CATEGORY=" + CATEGORY + ", COUNT=" + COUNT + "]";
	}
	
	
}
