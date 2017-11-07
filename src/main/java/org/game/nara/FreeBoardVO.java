package org.game.nara;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FreeBoardVO {

	@Override
	public String toString() {
		return "FreeBoardVO [no=" + no + ", writer=" + writer + ", title=" + title + ", coment=" + coment + ", fb_date="
				+ fb_date + ", view_cnt=" + view_cnt + ", attach=" + attach + ", cnt=" + cnt + "]";
	}
	
	private int no;
	private String writer;
	private String title;
	private String coment;
	private Date fb_date;
	private int view_cnt;
	private String attach;
	private int cnt;
	private MultipartFile picdata;
	
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
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public Date getFb_date() {
		return fb_date;
	}
	public void setFb_date(Date fb_date) {
		this.fb_date = fb_date;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getAttach() {
		return attach;
	}
	public void setAttach(String attach) {
		this.attach = attach;
	}
	public MultipartFile getPicdata() {
		return picdata;
	}
	public void setPicdata(MultipartFile picdata) {
		this.picdata = picdata;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
