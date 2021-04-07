package com.sjw.mybatisboard.dao;

import java.util.ArrayList;
import com.sjw.mybatisboard.dto.BDto;

public interface BDao {
	public BDto contentView(int strID);
	public void write(final String bName, final String bTitle, final String bContent);
	public ArrayList<BDto> list();
	public void modify(final int bId, final String bName, final String bTitle, final String bContent);
	public void delete(final int strID);
	public BDto reply_view(int strID);
	public void reply(final int bId, final String bName, final String bTitle, 
			final String bContent,final int bGroup, final int bStep, 
			final int bIndent);
	public void upHit(final int bId);
}
