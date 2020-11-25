package kr.spring.member.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberVO;

public interface MemberMapper {
	@Select("SELECT mem_num.nextval FROM dual")
	public int selectMem_num();
	//회원가입_member
	@Insert("INSERT INTO member (mem_num,email) VALUES (#{mem_num},#{email})")
	public void joinMember(MemberVO member);
	//회원가입_member_detail
	@Insert("INSERT INTO member_detail (mem_num,nickname,password,birth,phone) VALUES (#{mem_num},#{nickname},#{password},#{birth},#{phone})")
	public void joinMember_detail(MemberVO member);
	
	@Select("SELECT m.mem_num,m.email,m.auth,d.password,d.mem_imagename FROM member m LEFT OUTER JOIN member_detail d ON m.mem_num=d.mem_num WHERE m.email=#{email}")
	public MemberVO selectCheckMember(String id);//누락된id(탈퇴한 회원의 id)는 검색필요 X -> JOIN
	
	//회원정보 변경
	@Update("UPDATE member_detail SET nickname=#{nickname},phone=#{phone},mem_modifydate=SYSDATE WHERE mem_num=#{mem_num}")
	public void updateMember(MemberVO member);

	//비밀번호 변경
	@Update("UPDATE member_detail SET password=#{password} WHERE mem_num=#{mem_num}")
	public void updatePassword(MemberVO member);
	
	@Select("SELECT * FROM member m JOIN member_detail d ON m.mem_num=d.mem_num WHERE m.mem_num=#{mem_num}")
	public MemberVO selectMember(Integer mem_num);
	
	//회원탈퇴
	@Update("UPDATE member SET auth=3 WHERE mem_num=#{mem_num}")
	public void deleteMember(Integer mem_num);

	@Delete("DELETE FROM member_detail WHERE mem_num=#{mem_num}")
	public void deleteMember_detail(Integer mem_num);
	
	//프로필이미지업데이트
	@Update("UPDATE member_detail SET mem_image=#{mem_image},mem_imagename=#{mem_imagename} WHERE mem_num=#{mem_num}")
	public void updateProfile(MemberVO member);
	/*@Update("UPDATE spmember_detail SET photo=#{photo},photoname=#{photoname} WHERE mem_num=#{mem_num}")*/
}



