package org.game.nara;

public class SellVO {

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
	
	@Override
	public String toString() {
		return "SellVO [NO=" + NO + ", WRITER=" + WRITER + ", TITLE=" + TITLE + ", PRICE=" + PRICE + ", DETAIL="
				+ DETAIL + ", CONTACT=" + CONTACT + ", DEAL_METHOD=" + DEAL_METHOD + ", PIC=" + PIC + ", REGDATE="
				+ REGDATE + ", STATE=" + STATE + ", CATEGORY=" + CATEGORY + ", COUNT=" + COUNT + "]";
	}
	public int getNO() {
		return NO;
	}
	public void setNO(int nO) {
		NO = nO;
	}
	public String getWRITER() {
		return WRITER;
	}
	public void setWRITER(String wRITER) {
		WRITER = wRITER;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public String getDETAIL() {
		return DETAIL;
	}
	public void setDETAIL(String dETAIL) {
		DETAIL = dETAIL;
	}
	public String getCONTACT() {
		return CONTACT;
	}
	public void setCONTACT(String cONTACT) {
		CONTACT = cONTACT;
	}
	public String getDEAL_METHOD() {
		return DEAL_METHOD;
	}
	public void setDEAL_METHOD(String dEAL_METHOD) {
		DEAL_METHOD = dEAL_METHOD;
	}
	public String getPIC() {
		return PIC;
	}
	public void setPIC(String pIC) {
		PIC = pIC;
	}
	public String getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(String rEGDATE) {
		REGDATE = rEGDATE;
	}
	public String getSTATE() {
		return STATE;
	}
	public void setSTATE(String sTATE) {
		STATE = sTATE;
	}
	public int getCATEGORY() {
		return CATEGORY;
	}
	public void setCATEGORY(int cATEGORY) {
		CATEGORY = cATEGORY;
	}
	public int getCOUNT() {
		return COUNT;
	}
	public void setCOUNT(int cOUNT) {
		COUNT = cOUNT;
	}
	
}
