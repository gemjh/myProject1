package kr.spring.main.service;

import java.util.List;
import java.util.Map;

import kr.spring.admin.vo.AdminMusicalVO;
import kr.spring.main.vo.MainVO;

public interface MainService {
	//뮤지컬 리스트
		//리스트
		public List<MainVO> selectList(Map<String, Object> map);
		//글의 갯수 구하기
		public int selectRowCount(Map<String, Object> map);
		//뮤지컬 수정폼 보기
		public MainVO selectMusical(Integer mus_num);
}
