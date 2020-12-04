package kr.spring.musinfo.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.musinfo.vo.PickVO;

public interface PickMapper {
	@Insert("INSERT INTO pick VALUES(pick_num.nextVal, #{mem_num}, #{mus_num})")
	public void insertPick(PickVO pickVO);	
	
	@Delete("DELETE FROM pick WHERE mem_num=#{mem_num} AND mus_num=#{mus_num}")
	public void deletePick(PickVO pickVO);
	
	@Select("SELECT COUNT(*) FROM pick WHERE mem_num=#{mem_num} AND mus_num=#{mus_num}")
	public int selectRowCount(Map<String, Object> map);
	
}
