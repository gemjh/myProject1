package kr.spring.musinfo.dao;

import kr.spring.musinfo.vo.PickVO;

public interface PickMapper {
	
	public void insertPick(PickVO pick);
	
	
	
	public void deletePick(int pick_num);
	
}
