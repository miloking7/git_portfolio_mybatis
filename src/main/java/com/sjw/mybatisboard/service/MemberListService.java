package com.sjw.mybatisboard.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.sjw.mybatisboard.dao.MDao;
import com.sjw.mybatisboard.dto.MyMember;

public class MemberListService implements IBoarderService {
	
	
	private SqlSession sqlSession=Constant.sqlSession;
	private static final int MESSAGE_COUNT_PER_PAGE = 10;
	public MemberListService(){}
	
	@Override
	public void execute(Model model) {
		//ArrayList<BDto> dtos =  dao.list();
		//model.addAttribute("list", dtos);
		
		MDao dao = sqlSession.getMapper(MDao.class);
		ArrayList<MyMember> dtos = dao.memberList();
		model.addAttribute("list", dtos);
		
	}
	
	public  List<MyMember> selectList(int a,int z) throws SQLException{
		MDao dao = sqlSession.getMapper(MDao.class);
		ArrayList<MyMember> dtos =  dao.memberList();
		return dtos.subList(a-1,z);
	}
	public  MemberListView getMessageListView(int pageNumber) throws SQLException{
		int currentPageNumber = pageNumber;
		MDao dao = sqlSession.getMapper(MDao.class);
		int messageTotalCount = dao.memberList().size();
		List<MyMember> messageList = null;
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
		return new MemberListView(messageList,messageTotalCount,currentPageNumber,MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
	}

}
