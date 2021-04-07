package com.sjw.mybatisboard.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
public class MyMember {
	private long no; //회원등록번호:자동넘버링
	private String id; //회원아이디 혹 별명
	private Timestamp joindate; // 가입일자
	private String password; // 패스워드
	private String phone; // 전화번호
	private String iswithrew; // 가입상태 - JOINED, UNJOINED 
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getJoindate() {
		return joindate;
	}
	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIswithrew() {
		return iswithrew;
	}
	public void setIswithrew(String iswithrew) {
		this.iswithrew = iswithrew;
	}
	@Override
	public String toString() {
		return "MyMember [no=" + no + ", id=" + id + ", joindate=" + joindate + ", password=" + password + ", phone="
				+ phone + ", iswithrew=" + iswithrew + "]";
	}

}
