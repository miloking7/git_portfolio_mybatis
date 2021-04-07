package com.sjw.mybatisboard.service;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import com.sjw.mybatisboard.dao.BDao;
public class BReplyService implements IBoarderService {
	private SqlSession sqlSession=Constant.sqlSession;
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		Map<String , Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent= request.getParameter("bContent");
		int bGroup = Integer.parseInt(request.getParameter("bGroup"));
		int bStep = Integer.parseInt(request.getParameter("bStep"));
		int bIndent = Integer.parseInt(request.getParameter("bIndent"));
		
		BDao dao = sqlSession.getMapper(BDao.class);
		dao.reply(bId, bName, bTitle, bContent, bGroup, bStep, bIndent);
		
	}

}
