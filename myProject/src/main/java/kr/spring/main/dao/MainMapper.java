package kr.spring.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.admin.vo.AdminMusicalVO;
import kr.spring.main.vo.MainVO;

public interface MainMapper {
	
	// 뮤지컬 리스트
	public List<MainVO> selectList(Map<String, Object> map);

	// 뮤지컬의 갯수 구하기
	public int selectRowCount(Map<String, Object> map);
	
	// 뮤지컬 상세 보기
		@Select("SELECT * FROM musical WHERE musical.mus_num=#{mus_num}")
		public MainVO selectMusical(Integer mus_num);
}
