package com.sjw.mybatisboard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.sjw.mybatisboard.dao.BDao;
import com.sjw.mybatisboard.dto.BDto;


public class BListService implements IBoarderService {
	
	
	private SqlSession sqlSession=Constant.sqlSession;
	private static final int MESSAGE_COUNT_PER_PAGE = 10;
	public BListService(){}
	
	@Override
	public void execute(Model model) {
		//ArrayList<BDto> dtos =  dao.list();
		//model.addAttribute("list", dtos);
		
		BDao dao = sqlSession.getMapper(BDao.class);
		ArrayList<BDto> dtos = dao.list();
		model.addAttribute("list", dtos);
		
	}
	
	public  List<BDto> selectList(int a,int z) throws SQLException{
		BDao dao = sqlSession.getMapper(BDao.class);
		ArrayList<BDto> dtos =  dao.list();
		return dtos.subList(a-1,z);
	}
	public  MessageListView getMessageListView(int pageNumber) throws SQLException{
		int currentPageNumber = pageNumber;
		BDao dao = sqlSession.getMapper(BDao.class);
		int messageTotalCount = dao.list().size();
		List<BDto> messageList = null;
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
		return new MessageListView(messageList,messageTotalCount,currentPageNumber,MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
	}

}
