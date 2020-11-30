package kr.spring.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.main.vo.MusMainVO;


public interface MusMainMapper {
	// 뮤지컬 리스트
	public List<MusMainVO> getMusMainList(Map<String, Object> map);

	// 뮤지컬 리스트 갯수 구하기
	public int getMusMainCount();
	
	@Select("SELECT * FROM musical WHERE mus_num=#{mus_num}")
	public MusMainVO selectMusMain(int mus_num);
	
}
