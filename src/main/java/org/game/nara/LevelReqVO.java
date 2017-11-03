package org.game.nara;

public class LevelReqVO {

	private int no;
	private String id;
	private String contents;
	private String regdate;;
	private int pwd;
	
	@Override
	public String toString() {
		return "LevelReqVO [no=" + no + ", id=" + id + ", contents=" + contents + ", regdate=" + regdate + ", pwd="
				+ pwd + "]";
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getPwd() {
		return pwd;
	}
	public void setPwd(int pwd) {
		this.pwd = pwd;
	}
	
}
