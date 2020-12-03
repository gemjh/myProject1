package kr.spring.musinfo.service;

import java.util.Map;

import kr.spring.musinfo.vo.PickVO;

public interface PickService {
	
	public void insertPick(PickVO pickVO);	
	
	public void deletePick(PickVO pickVO);
	
	public int selectRowCount(Map<String, Object> map);
}
