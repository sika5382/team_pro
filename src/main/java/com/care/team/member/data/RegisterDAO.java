package com.care.team.member.data;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface RegisterDAO {
	
	@Insert("insert into cc_member values(#{id},#{pwd},#{nickname},#{email},#{name},#{birth},null)")
	public int register(MemberDTO member);
	
	@Select("select count(*) from cc_member where id=#{id}")
	public int idCheck(String id);
	
	@Select("select count(*) from cc_member where nickname=#{nickname}")
	public int nicknameCheck(String nickname);
	
	
}
