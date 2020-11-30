package kr.spring.main.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import kr.spring.main.vo.MusMainVO;


public interface MusMainService {
	// 뮤지컬 리스트
	public List<MusMainVO> selectMusMainList(Map<String, Object> map);

	// 뮤지컬 리스트 갯수 구하기
	public int selectMusMainCount(Map<String, Object> map);
	
	// 뮤지컬 컬럼 한 줄 구하기
	public MusMainVO selectMusMain(int mus_num);
	
	// 신작품순 리스트
	public List<MusMainVO> selectMusLatestList(Map<String, Object> map);
	
	// 신작품순 리스트 갯수 구하기
	//public int selectMusLatestCount(Map<String, Object> map);
	
	// 인기순 리스트
	public List<MusMainVO> selectMusPopularList(Map<String, Object> map);
	
	// 인기순 리스트 갯수 구하기
	//public int selectMusPopularCount(Map<String, Object> map);
	
	// 회원 선호 장르 리스트
	public List<MusMainVO> selectMusPreferList(Map<String, Object> map);
	
	// 회원 선호 장르 갯수 구하기
	public int selectPreferCount(Map<String, Object> map);
	
	// 회원 찜한 작품 리스트
	public List<MusMainVO> selectMusPickList(Map<String, Object> map);
	
	// 회원 찜한 작품 갯수 구하기
	public int selectPickCount(Map<String, Object> map);

}
