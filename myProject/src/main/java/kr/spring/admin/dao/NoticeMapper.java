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
	//공지사항 등록
	@Insert("INSERT INTO notice (no_num, mem_num, no_title, no_content, no_regdate ,noticeDate) VALUES(no_seq.nextval, #{mem_num}, #{no_title}, #{no_content}, SYSDATE,#{noticeDate})")
	public void insertNotice(NoticeVO notice);
	//선택
	@Select("SELECT * FROM notice WHERE no_num=#{no_num}")
	public NoticeVO selectNotice(Integer no_num);
	//공지사항 수정
	@Update("UPDATE notice SET no_title=#{no_title},no_content=#{no_content},no_regdate=sysdate WHERE no_num=#{no_num}")
	public void updateNotice(NoticeVO notice);
	//조회수
	@Update("UPDATE notice SET no_hit=no_hit+1 WHERE no_num=#{no_num}")
	public void updateHit(Integer no_num);
	//삭제
	@Delete("DELETE FROM notice WHERE no_num=#{no_num}")
	public void deleteNotice(Integer no_num);
	//일반회원 공지사항 보기
	public List<NoticeVO> selectMemberNoticeList(Map<String, Object> map);
	public int selectMemberNoitceRowCount(Map<String, Object> map);
}
