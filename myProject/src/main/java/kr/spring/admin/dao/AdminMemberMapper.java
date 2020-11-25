package kr.spring.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.member.vo.MemberVO;

public interface AdminMemberMapper {

	// 멤버 리스트
	// 리스트
	public List<MemberVO> selectList(Map<String, Object> map);
	// 글의 갯수 구하기
	public int selectRowCount(Map<String, Object> map);
	// 회원 상세 보기
	@Select("SELECT m.*,d.* FROM member m LEFT OUTER JOIN member_detail d ON m.mem_num=d.mem_num WHERE m.mem_num=#{mem_num}")
	public MemberVO selectMember(Integer mem_num);

}
