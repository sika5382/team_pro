package com.care.team.member.data;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.care.team.member.data.MemberDTO;

@Repository
public interface MemberDAO {
	@Select("select * from cc_member where id = #{userid}")
	public MemberDTO userSelect(@Param("userid") String id);
	@Select("select id from cc_member where name = #{name} and birth = #{birth} and email = #{email}")
	public String searchId(@Param("name") String name, 
			@Param("birth") String birth, @Param("email") String email);
	@Select("select id from cc_member where name = #{name} and email = #{email}")
	public String searchPwd(@Param("name") String name, @Param("email") String email);
	@Update("update cc_member set pwd=#{pwd} where id=#{id}")
	public void changePwd(@Param("id") String id, @Param("pwd") String pwd);
}
