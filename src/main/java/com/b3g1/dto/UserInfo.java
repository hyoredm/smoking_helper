package com.b3g1.dto;

public class UserInfo {
	
	private String uID;
	private String uPW;
	private String uName;
	private String uNICKNAME;
	private String uBIRTH;
	private String uPW_Q;
	private String uPW_A;
	private String RegDate;
	private int uGRADE;
	private int uGOAL;
	private int uNO_PERIOD;
	
	public String getuID() {
		return uID;
	}

	public void setuID(String uID) {
		this.uID = uID;
	}

	public String getuPW() {
		return uPW;
	}

	public void setuPW(String uPW) {
		this.uPW = uPW;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuNICKNAME() {
		return uNICKNAME;
	}

	public void setuNICKNAME(String uNICKNAME) {
		this.uNICKNAME = uNICKNAME;
	}

	public String getuBIRTH() {
		return uBIRTH;
	}

	public void setuBIRTH(String uBIRTH) {
		this.uBIRTH = uBIRTH;
	}

	public String getuPW_Q() {
		return uPW_Q;
	}

	public void setuPW_Q(String uPW_Q) {
		this.uPW_Q = uPW_Q;
	}

	public String getuPW_A() {
		return uPW_A;
	}

	public void setuPW_A(String uPW_A) {
		this.uPW_A = uPW_A;
	}

	public String getRegDate() {
		return RegDate;
	}

	public void setRegDate(String regDate) {
		RegDate = regDate;
	}

	public int getuGRADE() {
		return uGRADE;
	}

	public void setuGRADE(int uGRADE) {
		this.uGRADE = uGRADE;
	}

	public int getuGOAL() {
		return uGOAL;
	}

	public void setuGOAL(int uGOAL) {
		this.uGOAL = uGOAL;
	}

	public int getuNO_PERIOD() {
		return uNO_PERIOD;
	}

	public void setuNO_PERIOD(int uNO_PERIOD) {
		this.uNO_PERIOD = uNO_PERIOD;
	}

	public UserInfo() {
		
	}

	@Override
	public String toString() {
		return "UserInfo [uID=" + uID + ", uPW=" + uPW + ", uName=" + uName + ", uNICKNAME=" + uNICKNAME + ", uBIRTH="
				+ uBIRTH + ", uPW_Q=" + uPW_Q + ", uPW_A=" + uPW_A + ", RegDate=" + RegDate + ", uGRADE=" + uGRADE
				+ ", uGOAL=" + uGOAL + ", uNO_PERIOD=" + uNO_PERIOD + "]";
	}
	
	

}
