package kr.spring.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.admin.vo.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	
	@Insert("INSERT INTO notice (no_num, mem_num, no_title, no_content, no_regdate) VALUES(no_seq.nextval, #{mem_num}, #{no_title}, #{no_content}, SYSDATE)")
	public void insertNotice(NoticeVO notice);
	
	@Select("SELECT * FROM notice n JOIN member_detail d ON n.mem_num = d.mem_num WHERE n.no_num=#{no_num}")
	public NoticeVO selectNotice(Integer no_num);
	@Update("UPDATE notice SET no_hit=no_hit+1 WHERE no_num=#{no_num}")
	public void updateHit(Integer no_num);
	
	public void updateNotice(NoticeVO notice);
	
	@Delete("DELETE FROM notice WHERE no_num=#{no_num}")
	public void deleteNotice(Integer no_num);
}
