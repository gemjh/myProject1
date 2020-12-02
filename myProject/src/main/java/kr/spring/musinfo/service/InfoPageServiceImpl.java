package kr.spring.musinfo.service;

import javax.annotation.Resource;

import kr.spring.musinfo.dao.InfoPageMapper;
import kr.spring.musinfo.vo.InfoPageVO;

public class InfoPageServiceImpl implements InfoPageService{
@Resource
InfoPageMapper infoPageMapper;
	@Override
	public InfoPageVO selectInfoPage(int mus_num) {
		// TODO Auto-generated method stub
		return infoPageMapper.selectInfoPage(mus_num);
	}

}
