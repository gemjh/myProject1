package kr.spring.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.main.dao.MusMainMapper;
import kr.spring.main.vo.MusMainVO;

@Service("MusMainService")
public class MusMainServiceImpl implements MusMainService{
	@Resource
	MusMainMapper musMainMapper;
	
	@Override
	public List<MusMainVO> getMusMainList(Map<String, Object> map) {
		return musMainMapper.getMusMainList(map);
	}

	@Override
	public int getMusMainCount() {
		return musMainMapper.getMusMainCount();
	}

	@Override
	public MusMainVO selectMusMain(int mus_num) {
		return musMainMapper.selectMusMain(mus_num);
	}
	
	
}
