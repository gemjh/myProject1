package kr.spring.main.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.spring.main.vo.MusMainVO;


public interface MusMainService {
	// 뮤지컬 리스트
	public List<MusMainVO> getMusMainList(Map<String, Object> map);

	// 뮤지컬 리스트 갯수 구하기
	public int getMusMainCount();
	
	public MusMainVO selectMusMain(int mus_num);

}
