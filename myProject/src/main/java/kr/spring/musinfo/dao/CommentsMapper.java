package kr.spring.musinfo.dao;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.musinfo.vo.CommentsVO;

public interface CommentsMapper {
	@Insert("insert into reviews(rev_num,mem_num,mus_num,rev_rate,review,rev_regdate) values(rev_seq.nextval,#{mem_num},#{mus_num},#{rev_rate},#{review},sysdate)")
	public void insertComments(CommentsVO commentsVO);
	@Select("SELECT * FROM reviews r WHERE r.rev_num=#{rev_num}")
	public CommentsVO selectComments(int rev_num);
	@Update("update reviews set rev_rate=#{rev_rate},review=#{review},rev_regdate=sysdate where rev_num=#{rev_num}")
	public void updateComments(CommentsVO commentsVO);
	@Delete("delete from reviews where rev_num=#{rev_num}")
	public void deleteComments(int rev_num);
	public List<CommentsVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	
	//리뷰 평점 구하기
	@Select("SELECT COUNT(*) FROM reviews r WHERE r.mus_num=#{mus_num}")
	public int selectReviewCount(int mus_num);
}
