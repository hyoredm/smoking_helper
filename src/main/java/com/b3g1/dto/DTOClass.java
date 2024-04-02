package com.b3g1.dto;

public class DTOClass {
	
	private String SENDER_ID = null;
	private String RECEIVER_ID = null;
	private String SENDING_DATE = null;
	private String RECEIVING_DATE = null;
	private int UNREAD = 0;
	private String CONTENTS = null;
	private int NUM= 0;
	public DTOClass() { //기본생성자
	}

	public String getSENDER_ID() {
		return SENDER_ID;
	}

	public void setSENDER_ID(String sENDER_ID) {
		SENDER_ID = sENDER_ID;
	}

	public String getRECEIVER_ID() {
		return RECEIVER_ID;
	}

	public void setRECEIVER_ID(String rECEIVER_ID) {
		RECEIVER_ID = rECEIVER_ID;
	}

	public String getSENDING_DATE() {
		return SENDING_DATE;
	}

	public void setSENDING_DATE(String sENDING_DATE) {
		SENDING_DATE = sENDING_DATE;
	}

	public String getRECEIVING_DATE() {
		return RECEIVING_DATE;
	}

	public void setRECEIVING_DATE(String rECEIVING_DATE) {
		RECEIVING_DATE = rECEIVING_DATE;
	}

	public int getUNREAD() {
		return UNREAD;
	}

	public void setUNREAD(int uNREAD) {
		UNREAD = uNREAD;
	}

	public String getCONTENTS() {
		return CONTENTS;
	}

	public void setCONTENTS(String cONTENTS) {
		CONTENTS = cONTENTS;
	}

	public int getNUM() {
		return NUM;
	}

	public void setNUM(int nUM) {
		NUM = nUM;
	}

	

		
}
