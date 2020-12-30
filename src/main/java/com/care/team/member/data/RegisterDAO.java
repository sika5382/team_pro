package com.care.team.member.data;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface RegisterDAO {
	
	//회원가입
	@Insert("insert into cc_member values(#{id},#{pwd},#{nickname},#{email},#{name},#{birth},null)")
	public int register(MemberDTO member);
	
	//Ajax 아이디 중복검사
	@Select("select count(*) from cc_member where id=#{id}")
	public int idCheck(String id);
	
	//Ajax 닉네임 중복검사
	@Select("select count(*) from cc_member where nickname=#{nickname}")
	public int nicknameCheck(String nickname);
	
	//내정보 조회
	@Select("select * from cc_member where id=#{id}")
	public MemberDTO myRegister(String userId);
	
	//내정보 수정
	@Update("update cc_member set nickname=#{nickname}, email=#{email} where id=#{id}")
	public void modifyCheck(MemberDTO member);
	
	//비밀번호 가져오기
	@Select("select pwd from cc_member where id=#{id}")
	public String passwordChk(String userId);
	
	//비밀번호 변경
	@Update("update cc_member set pwd=#{pwd} where id=#{id}")
	public void pwdModify(MemberDTO dto);
	
	@Delete("delete from cc_member where id=#{id}")
	public void userdelte(String userId);
	
	
	
}
