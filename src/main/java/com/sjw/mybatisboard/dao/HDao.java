package com.sjw.mybatisboard.dao;
import java.sql.Timestamp;
import java.util.ArrayList;
import com.sjw.mybatisboard.dto.HomeBook;
public interface HDao {
	// insert
	public void bookWrite(
		final Timestamp day, //가계부 일자 
		final String section, // 수지구분
		final String accounttitle, // 계정과목명
		final String remark, // 적요(내역) 
		final int revenue,// 수입 
		final int expense,// 지출
		final String mid // 회원id 
	);
	//delete
	public void removeBook(final long serialno,final String mid);// 가계부 자료 삭제
	
	//update
	public void modify( // 가계부 수정
		final Timestamp day, //가계부 일자 
		final String section, // 수지구분
		final String accounttitle, // 계정과목명
		final String remark, // 적요(내역) 
		final int revenue,// 수입 
		final int expense,// 지출
		final long serialno	
		//final String mid // 회원id 
	);
	// select
	public HomeBook bookView(long serialno);//가계부 상세보기 
	// selectAll (특정회원의 모든자료) 
	public ArrayList<HomeBook> bookList(String mid); // 회원별 가계부 정보 
	// selectAll (자료전체) 
	public ArrayList<HomeBook> bookAllList(); // 관리자 통계용 
}
