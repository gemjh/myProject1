package kr.spring.admin.service;

import java.util.List;
import java.util.Map;

import kr.spring.admin.vo.AdminMusicalVO;
import kr.spring.member.vo.MemberVO;

public interface AdminMemberService {
	// 멤버 리스트
	// 리스트
	public List<MemberVO> selectList(Map<String, Object> map);
	// 글의 갯수 구하기
	public int selectRowCount(Map<String, Object> map);
	// 회원 상세 보기
	public MemberVO selectMember(Integer mem_num);	

}
