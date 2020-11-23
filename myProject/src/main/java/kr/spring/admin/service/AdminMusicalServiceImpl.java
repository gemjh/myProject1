package kr.spring.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.admin.dao.AdminMusicalMapper;
import kr.spring.admin.vo.AdminMusicalVO;

@Service("AdminMusicalServce")
public class AdminMusicalServiceImpl implements AdminMusicalService{
	
	@Resource
	AdminMusicalMapper mapper;

	@Override //뮤지컬 등록
	public void insertMusical(AdminMusicalVO adminMusical) {
		
		mapper.insertMusical(adminMusical);
		
	}

	@Override //뮤지컬 리스트
	public List<AdminMusicalVO> selectList(Map<String, Object> map) {
		
		return mapper.selectList(map);
	}

	@Override //글 갯수 세기
	public int selectRowCount(Map<String, Object> map) {
		return mapper.selectRowCount(map);
	}

	@Override //뮤지컬 상세보기(수정폼)
	public AdminMusicalVO selectMusical(Integer mus_num) {
		
		return mapper.selectMusical(mus_num);
	}

	@Override //뮤지컬 수정
	public void updateMusical(AdminMusicalVO adminMusical) {
		
		mapper.updateMusical(adminMusical);
		
	}

	@Override //뮤지컬 삭제
	public void deleteMusical(Integer mus_num) {
		
		mapper.deleteMusical(mus_num);
		
	}

}
	