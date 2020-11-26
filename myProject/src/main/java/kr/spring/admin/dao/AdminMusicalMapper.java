package kr.spring.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.admin.vo.AdminMusicalVO;

public interface AdminMusicalMapper {
	

	// 뮤지컬 리스트
	// 리스트-
	public List<AdminMusicalVO> selectList(Map<String, Object> map);

	// 글의 갯수 구하기
	public int selectRowCount(Map<String, Object> map);
	
	// 뮤지컬 등록 페이지
	@Insert("INSERT INTO musical "
			+ "(mus_num, mus_name, gen_num, mus_age, mus_actor,mus_time,mus_video,mus_post,mus_postname,mus_detail,mus_summary,mus_regdate)"
			+"VALUES (mus_seq.nextval,#{mus_name},#{gen_num},#{mus_age},#{mus_actor},#{mus_time},#{mus_video},#{mus_post},#{mus_postname},#{mus_detail},#{mus_summary},"
			+ "SYSDATE)")
	public void insertMusical(AdminMusicalVO adminMusical);

	// 뮤지컬 상세 보기
	@Select("SELECT * FROM musical WHERE musical.mus_num=#{mus_num}")
	public AdminMusicalVO selectMusical(Integer mus_num);

	// 뮤지컬 수정하기
	public void updateMusical(AdminMusicalVO adminMusical);

	// 뮤지컬 삭제
	@Delete("DELETE FROM musical WHERE musical.mus_num=#{mus_num}")
	public void deleteMusical(Integer mus_num);
}
