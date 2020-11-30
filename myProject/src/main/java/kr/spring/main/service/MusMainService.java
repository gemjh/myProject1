package kr.spring.main.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.spring.main.vo.MusMainVO;


public interface MusMainService {
	// 뮤지컬 리스트
	public List<MusMainVO> selectMusMainList(Map<String, Object> map);

	// 뮤지컬 리스트 갯수 구하기
	public int selectMusMainCount(Map<String, Object> map);
	
	// 뮤지컬 컬럼 한 줄 구하기
	public MusMainVO selectMusMain(int mus_num);

}
