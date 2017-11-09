package org.game.nara;

import java.util.Date;

public class BuyVO {

	private int no;
	private String title;
	private String detail;
	private String buy_id;
	private int category;
	private Date add_date;
	private int count;
	private int end;
	private int replyCount;
	
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(String buy_id) {
		this.buy_id = buy_id;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public Date getAdd_date() {
		return add_date;
	}
	public void setAdd_date(Date add_date) {
		this.add_date = add_date;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "BuyVO [no=" + no + ", title=" + title + ", detail=" + detail + ", buy_id=" + buy_id + ", category="
				+ category + ", add_date=" + add_date + ", count=" + count + ", end=" + end + ", replyCount="
				+ replyCount + "]";
	}
}
