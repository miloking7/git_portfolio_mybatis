package com.sjw.mybatisboard.mapper;

import org.apache.ibatis.annotations.Select;

public interface CurrentDBTime {
	@Select("SELECT sysdate FROM dual")
	public String getTime();
}
