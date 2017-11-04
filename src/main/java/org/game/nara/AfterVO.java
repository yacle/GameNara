package org.game.nara;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class AfterVO {
	private int no;
	private int parent_no;
	private String writer;
	private String content;
	private String attach;
	private Date add_date;
	private String title;
	private int count;
	private MultipartFile picdata;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getParent_no() {
		return parent_no;
	}
	public void setParent_no(int parent_no) {
		this.parent_no = parent_no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAttach() {
		return attach;
	}
	public void setAttach(String attach) {
		this.attach = attach;
	}
	public Date getAdd_date() {
		return add_date;
	}
	public void setAdd_date(Date add_date) {
		this.add_date = add_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public MultipartFile getPicdata() {
		return picdata;
	}
	public void setPicdata(MultipartFile picdata) {
		this.picdata = picdata;
	}
	@Override
	public String toString() {
		return "AfterVO [no=" + no + ", parent_no=" + parent_no + ", writer=" + writer + ", comments=" + content
				+ ", attach=" + attach + ", add_date=" + add_date + ", title=" + title + ", count=" + count + "]";
	}
	
	
}
