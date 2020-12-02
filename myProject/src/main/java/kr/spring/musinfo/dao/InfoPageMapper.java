package kr.spring.musinfo.dao;

import org.apache.ibatis.annotations.Select;

import kr.spring.musinfo.vo.InfoPageVO;

public interface InfoPageMapper {
	@Select("SELECT  * FROM( select * from reviews order by rownum desc)WHERE mus_num=#{mus_num} and ROWNUM = 1;" )
	public InfoPageVO selectInfoPage(int mus_num);
	public void updateInfoPage(InfoPageVO infoPageVO);
}
