package kr.spring.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.main.dao.MainMapper;
import kr.spring.main.vo.MainVO;

@Service("MainServce")
public class MainServiceImpl implements MainService{
	
	@Resource
	MainMapper mainMapper;

	@Override
	public List<MainVO> selectList(Map<String, Object> map) {
		return mainMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return mainMapper.selectRowCount(map);
	}

	@Override
	public MainVO selectMusical(Integer mus_num) {
		return mainMapper.selectMusical(mus_num);
	}

}
