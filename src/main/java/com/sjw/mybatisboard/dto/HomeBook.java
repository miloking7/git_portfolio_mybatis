package com.sjw.mybatisboard.dto;

import java.sql.Timestamp;

public class HomeBook {
	private long serialno;// 일련번호
	private Timestamp day;// 일자
	private String section;// 수지구분
	private String accounttitle; // 계정과목
	private String remark; // 적요
	private int revenue; // 수입
	private int expense; // 지출 
	private String mid; // 회원아이디 
	public long getSerialno() {
		return serialno;
	}
	public void setSerialno(long serialno) {
		this.serialno = serialno;
	}
	public Timestamp getDay() {
		return day;
	}
	public void setDay(Timestamp day) {
		this.day = day;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getAccounttitle() {
		return accounttitle;
	}
	public void setAccounttitle(String accounttitle) {
		this.accounttitle = accounttitle;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getRevenue() {
		return revenue;
	}
	public void setRevenue(int revenue) {
		this.revenue = revenue;
	}
	public int getExpense() {
		return expense;
	}
	public void setExpense(int expense) {
		this.expense = expense;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	@Override
	public String toString() {
		return "HomeBook [serialno=" + serialno + ", day=" + day + ", section=" + section + ", accounttitle="
				+ accounttitle + ", remark=" + remark + ", revenue=" + revenue + ", expense=" + expense + ", mid=" + mid
				+ "]";
	}

}
