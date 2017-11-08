package org.game.nara;

import java.sql.Date;

public class ChatVO {
	private Integer no;
	private String sender;
	private String receiver;
	private String content;
	private Date adddate;
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getAdddate() {
		return adddate;
	}
	public void setAdddate(Date adddate) {
		this.adddate = adddate;
	}
	@Override
	public String toString() {
		return "ChatVO [no=" + no + ", sender=" + sender + ", receiver=" + receiver + ", content=" + content
				+ ", adddate=" + adddate + "]";
	}
}
