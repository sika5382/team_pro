package com.care.team.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.care.team.board.dto.BoardDTO;
import com.care.team.board.dto.BoardRepDTO;

@Repository
public interface BoardDAO {
	@Select("select B.* from(select rownum rn, A.* from"
	+"(select * from carcamp_site order by write_no desc)A)B where rn between #{s} and #{e}")
	public  ArrayList<BoardDTO> selectAllBoardList(@Param("s") int start,@Param("e") int end);
	
	@Select("select B.* from(select rownum rn, A.* from"
			+"(select * from carcamp_site where place_addr like #{local} order by write_no desc)A)B where rn between #{s} and #{e}")
			public  ArrayList<BoardDTO> selectLocalBoardList(@Param("local") String local, @Param("s") int start,@Param("e") int end);
	
	@Select("select count(*) from carcamp_site")
	public int selectBoardCount();
	
	@Select("select count(*) from carcamp_site where place_addr like #{local}")
	public int selectLocalCount(@Param("local") String local);
	
	@Select("select count(*) from carcamp_site where id = #{id}")
	public int myContentCount(@Param("id") String id);
	
	@Select("select B.* from(select rownum rn, A.* from"
			+"(select * from carcamp_site where id = #{id} order by write_no desc)A)B where rn between #{s} and #{e}")
	public ArrayList<BoardDTO> myContent(@Param("id") String id, @Param("s") int start,@Param("e") int end);
	
	@Insert("insert into carcamp_site(write_no,id,nickname,place_name,place_addr,price,place_etc,review,image_file_name)" 
			+"values(site_seq.nextval,#{id},#{nickname},#{place_name},#{place_addr},#{price},#{place_etc},#{review},#{image_file_name})")
			public int insertBoardData(Map<String, Object> writeMap);
	@Select("select max(write_no) from carcamp_site")
	public int getMaxWrite_no();
	
	@Select("select * from carcamp_site where write_no = #{write_no}")
	public BoardDTO contentView(int write_no);
	
	@Update("update carcamp_site set hit=hit+1 where write_no=#{write_no}")
	public int upHit(int write_no);
	
	@Update("update carcamp_site set place_name=#{place_name},place_addr=#{place_addr},"
			+ "price=#{price}, place_etc=#{place_etc}, review=#{review}, image_file_name=#{image_file_name} where write_no=#{write_no}")
	public int updateBoardData(Map<String, Object> writeMap);
	
	@Delete("delete from carcamp_site where write_no = #{write_no}")
	public int boardDelete(int write_no);
	@Insert("insert into reply(id,title,content,write_group)"
						+"values(#{id},#{title},#{content},#{write_no})")
	public int addReply(@Param("id") String id,@Param("title") String title,
							@Param("content") String content,@Param("write_no") int write_no);
	
	@Select("select * from reply where write_group=#{write_group} order by write_date desc")
	public ArrayList<BoardRepDTO> getRepList(int write_group);
}
