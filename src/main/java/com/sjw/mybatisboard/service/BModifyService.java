package com.sjw.mybatisboard.service;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.sjw.mybatisboard.dao.BDao;
import com.sjw.mybatisboard.dto.MyMember;


public class BModifyService implements IBoarderService {
	private SqlSession sqlSession=Constant.sqlSession;
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session=(HttpSession)request.getSession();
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		String connector =((MyMember)(session.getAttribute("joinVo"))).getId();
		if(bName.equals(connector)) {
		BDao dao = sqlSession.getMapper(BDao.class);
		dao.modify(bId, bName, bTitle, bContent);
		} else {
			System.out.println("수정할 권한이 없는 자의 수정 시도!");
		}
		
	}

}
