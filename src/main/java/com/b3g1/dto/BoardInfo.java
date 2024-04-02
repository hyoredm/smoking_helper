package com.b3g1.dto;

public class BoardInfo {

	private int num = 0;
	private String subject = "";
	private String uNickName = "";
	private int hit = 0;
	private String uIP = "";
	private String reg_date = "";
	private String mod_date = "";
	private String text_color = "";
	private String text_style = "";
	private String contents = "";
	private int uGrade = 0;

	public BoardInfo() {
		// TODO Auto-generated constructor stub
	}

	public BoardInfo(int num, String subject, String uNickName, int hit, String uIP, String reg_date, String mod_date,
			String text_color, String text_style, String contents, int uGrade) {
		super();
		this.num = num;
		this.subject = subject;
		this.uNickName = uNickName;
		this.hit = hit;
		this.uIP = uIP;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
		this.text_color = text_color;
		this.text_style = text_style;
		this.contents = contents;
		this.uGrade = uGrade;
	}

	public int getuGrade() {
		return uGrade;
	}

	public void setuGrade(int uGrade) {
		this.uGrade = uGrade;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getuNickName() {
		return uNickName;
	}

	public void setuNickName(String uNickName) {
		this.uNickName = uNickName;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getuIP() {
		return uIP;
	}

	public void setuIP(String uIP) {
		this.uIP = uIP;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getMod_date() {
		return mod_date;
	}

	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}

	public String getText_color() {
		return text_color;
	}

	public void setText_color(String text_color) {
		this.text_color = text_color;
	}

	public String getText_style() {
		return text_style;
	}

	public void setText_style(String text_style) {
		this.text_style = text_style;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

}
