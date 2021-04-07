package com.sjw.mybatisboard.service;

import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.sjw.mybatisboard.dao.BDao;
import com.sjw.mybatisboard.dao.MDao;
import com.sjw.mybatisboard.dto.MyMember;


public class MemModifyService implements IBoarderService {
	private SqlSession sqlSession=Constant.sqlSession;
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		int no = Integer.parseInt(request.getParameter("no"));
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String iswithrew = request.getParameter("iswithrew");
		Timestamp joindate = Timestamp.valueOf(request.getParameter("joindate"));
		MDao dao = sqlSession.getMapper(MDao.class);
		MyMember member = new MyMember();
		member.setNo(no);
		member.setId(id);
		member.setPassword(password);
		member.setPhone(phone);
		member.setJoindate(joindate);
		member.setIswithrew(iswithrew);
		//System.out.println(session);
		
		session.setAttribute("joinVo",member);
		model.addAttribute("request", request);
		model.addAttribute("session", session);
		
		dao.memberModify(id, password, phone, iswithrew);//(id, password, phone, iswithrew);
		
	}

}
