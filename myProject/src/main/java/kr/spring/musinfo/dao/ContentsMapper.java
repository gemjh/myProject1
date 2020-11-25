package kr.spring.musinfo.dao;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import kr.spring.musinfo.vo.ContentsVO;

public interface ContentsMapper {
	@Insert("insert into musical(mus_num,mus_name,gen_num,mus_age,mus_actor,mus_time,mus_video,mus_rate,mus_post,mus_postname,mus_detail,mus_summary,mus_regdate) values(mus_seq.nextval,#{mus_num},#{mus_name},#{gen_num},#{mus_age},#{mus_actor},#{mus_time},#{mus_video},#{mus_rate},#{mus_post},#{mus_postname},#{mus_detail},#{mus_summary},sysdate)")
	public void insertContents(ContentsVO contentsVO);
	@Update("update musical set mus_num=#{mus_num},mus_name=#{mus_name},gen_num=#{gen_num},mus_age=#{mus_age},mus_actor=#{mus_actor},mus_time=#{mus_time},mus_video=#{mus_video},mus_rate=#{mus_rate},mus_post={mus_post},mus_postname=#{mus_postname},mus_detail=#{mus_detail},mus_summary=#{mus_summary}")
	public void updateContents(ContentsVO contentsVO);
}
