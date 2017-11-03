package org.game.nara;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FreeDistributeVO {

	@Override
	public String toString() {
		return "FreeDistributeVO [no=" + no + ", writer=" + writer + ", title=" + title + ", coment=" + coment
				+ ", view_cnt=" + view_cnt + ", attach=" + attach + ", fd_date=" + fd_date + ", end=" + end + "]";
	}
	
	private int no;
	private String writer;
	private String title;
	private String coment;
	private int view_cnt;
	private String attach;
	private Date fd_date;
	private String end;
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
	public Date getFd_date() {
		return fd_date;
	}
	public void setFd_date(Date fd_date) {
		this.fd_date = fd_date;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public MultipartFile getPicdata() {
		return picdata;
	}
	public void setPicdata(MultipartFile picdata) {
		this.picdata = picdata;
	}
	
	
}
