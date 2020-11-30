package kr.spring.musinfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.musinfo.vo.CommentsVO;

public interface CommentsMapper {
	@Insert("insert into reviews(rev_num,mem_num,mus_num,rev_rate,review,rev_regdate) values(rev_seq.nextval,#{mem_num},#{mus_num},#{rev_rate},#{review},sysdate)")
	public void insertComments(CommentsVO commentsVO);
	@Select("select * from reviews where mem_num=#{mem_num}")
	public CommentsVO selectComments(int num);
	@Update("update reviews set mem_num=#{mem_num},mus_num=#{mus_num},rev_rate=#{rev_rate},review=#{review},rev_regdate=sysdate where rev_num=#{rev_num}")
	public void updateComments(CommentsVO commentsVO);
	@Delete("delete from reviews where rev_num=#{rev_num}")
	public void deleteComments(int num);
}
