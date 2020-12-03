package kr.spring.musinfo.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.musinfo.vo.CommentsVO;
import kr.spring.musinfo.vo.ContentsVO;

public interface ContentsMapper {
	@Select("select * from musical where mus_num=#{mus_num}")
	public ContentsVO selectContents(int mus_num);
	@Select("select mus_actor from musical where mus_num=#{mus_num}")
	public List<String> actorList(Map<String,Object> map);
	@Select("select review, nickname from (select * from reviews r, member_detail m where r.mem_num=m.mem_num and mus_num=#{mus_num} order by rev_regdate desc)where rownum<=2")
	public List<ContentsVO> selectNewest(int mus_num);

}
