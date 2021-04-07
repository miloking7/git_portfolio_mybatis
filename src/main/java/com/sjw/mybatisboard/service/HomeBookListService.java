package com.sjw.mybatisboard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.sjw.mybatisboard.dao.HDao;
import com.sjw.mybatisboard.dto.HomeBook;

public class HomeBookListService implements IBoarderService {

	private SqlSession sqlSession=Constant.sqlSession;
	private static final int MESSAGE_COUNT_PER_PAGE = 10;
	private String mid;
	public HomeBookListService(){}
	public HomeBookListService(String mid){
		this.mid = mid;
	}
	@Override
	public void execute(Model model) {
		HDao dao = sqlSession.getMapper(HDao.class);
		if(mid==null) {
			ArrayList<HomeBook> dtos = dao.bookAllList();
			model.addAttribute("bookList", dtos);
		}else {
			ArrayList<HomeBook> dtos = dao.bookList(mid);
			model.addAttribute("bookList", dtos);
		}

	}
	
	public  List<HomeBook> selectList(int a,int z) throws SQLException{
		HDao dao = sqlSession.getMapper(HDao.class);
		ArrayList<HomeBook> dtos = null;
		if(mid==null) {
			dtos = dao.bookAllList();
		}else {
			dtos = dao.bookList(mid);
		}
		return dtos.subList(a-1,z);
	}
	public  HomeBookListView getMessageListView(int pageNumber) throws SQLException{
		int currentPageNumber = pageNumber;
		HDao dao = sqlSession.getMapper(HDao.class);
		int messageTotalCount = 0; 
		if(mid==null) {
			messageTotalCount = dao.bookAllList().size();
		}else {
			messageTotalCount = dao.bookList(mid).size();
		}
	
		List<HomeBook> messageList = null;
		int firstRow =0;
		int endRow =0;
		if(messageTotalCount>0){
			firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE+1;
			endRow = firstRow+MESSAGE_COUNT_PER_PAGE-1;
			if(endRow>messageTotalCount)endRow=messageTotalCount;
			messageList =selectList(firstRow,endRow);
		}else{
			currentPageNumber =0;
			messageList = Collections.emptyList();
		}
		
		return new HomeBookListView(messageList,messageTotalCount,currentPageNumber,MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
	}	

}
