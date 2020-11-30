package kr.spring.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.main.vo.MusMainVO;


public interface MusMainMapper {
	// 뮤지컬 리스트
	public List<MusMainVO> selectMusMainList(Map<String, Object> map);

	// 뮤지컬 리스트 갯수 구하기
	public int selectMusMainCount(Map<String, Object> map);
	
	// 뮤지컬 컬럼 한 줄 구하기
	@Select("SELECT * FROM musical WHERE mus_num=#{mus_num}")
	public MusMainVO selectMusMain(int mus_num);
	
}
