package kr.spring.admin.service;

import java.util.List;
import java.util.Map;

import kr.spring.admin.vo.AdminConsultVO;
import kr.spring.member.vo.MemberVO;

public interface AdminConsultService {
	//문의 내역 리스트
	// 리스트
	public List<AdminConsultVO> selectList(Map<String, Object> map);

	// 글의 갯수 구하기
	public int selectRowCount(Map<String, Object> map);
	
	// 문의 상세 보기
	public AdminConsultVO selectConsult(Integer con_num);	
}
