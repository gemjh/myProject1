package kr.spring.admin.service;

import java.util.List;
import java.util.Map;

import kr.spring.admin.vo.AdminMusicalVO;

public interface AdminMemberService {
	// 뮤지컬 리스트
	// 리스트
	public List<AdminMusicalVO> selectList(Map<String, Object> map);
	// 글의 갯수 구하기
	public int selectRowCount(Map<String, Object> map);

}
