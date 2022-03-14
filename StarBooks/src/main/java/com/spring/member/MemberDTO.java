package com.spring.member;

public class MemberDTO {
//	 idx        | int
//	 user_id     | varchar(20)
//	 user_pw     | varchar(200
//	 user_name   | varchar(20)
//	 user_email  | varchar(30)
//	 user__birth  | varchar(8)
//	 user_gender | varchar(2)
	
	private int idx;
	private String user_id, user_pw, user_name, user_email, user_birth, user_gender;
	private char isCookie;
	private int accChk, infoChk, eventChk, otherChk;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public char getIsCookie() {
		return isCookie;
	}
	public void setIsCookie(char isCookie) {
		this.isCookie = isCookie;
	}
	public int getAccChk() {
		return accChk;
	}
	public void setAccChk(int accChk) {
		this.accChk = accChk;
	}
	public int getInfoChk() {
		return infoChk;
	}
	public void setInfoChk(int infoChk) {
		this.infoChk = infoChk;
	}
	public int getEventChk() {
		return eventChk;
	}
	public void setEventChk(int eventChk) {
		this.eventChk = eventChk;
	}
	public int getOtherChk() {
		return otherChk;
	}
	public void setOtherChk(int otherChk) {
		this.otherChk = otherChk;
	}
	
}
