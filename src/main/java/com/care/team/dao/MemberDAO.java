package com.care.team.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.care.team.dto.MemberDTO;

@Repository
public interface MemberDAO {
	@Select("select * from cc_member where id = #{userid}")
	public MemberDTO userSelect(@Param("userid") String id);
}
