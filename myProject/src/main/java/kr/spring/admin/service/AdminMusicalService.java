package kr.spring.admin.service;

import java.util.List;
import java.util.Map;

import kr.spring.admin.vo.AdminMusicalVO;

public interface AdminMusicalService {
	//뮤지컬 등록 페이지
	public void insertMusical(AdminMusicalVO adminMusical);
	
	//뮤지컬 리스트
	//리스트
	public List<AdminMusicalVO> selectList(Map<String, Object> map);
	//글의 갯수 구하기
	public int selectRowCount(Map<String, Object> map);
	//뮤지컬 수정폼 보기
	public AdminMusicalVO selectMusical(Integer mus_num);	
	//뮤지컬 수정하기
	public void updateMusical(AdminMusicalVO adminMusical);
	//뮤지컬 삭제
	public void deleteMusical(Integer mus_num);
}
