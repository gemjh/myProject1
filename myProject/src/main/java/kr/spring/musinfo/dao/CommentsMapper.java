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
	@Select("select r.rev_rate,m.mem_image,m.nickname,r.review from reviews r, member_detail m where mus_num=#{mus_num} order by rev_num desc")
	public CommentsVO selectComments(int mus_num);
	@Update("update (select * from reviews r, member_detail m where r.mem_num=m.mem_num)   set mem_num=#{mem_num},mus_num=#{mus_num},rev_rate=#{rev_rate},review=#{review},rev_regdate=sysdate where rev_num=#{rev_num}")
	public void updateComments(CommentsVO commentsVO);
	@Delete("delete from reviews where rev_num=#{rev_num}")
	public void deleteComments(int rev_num);
	public List<CommentsVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
}
