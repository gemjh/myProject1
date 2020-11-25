package kr.spring.musinfo.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.musinfo.dao.ContentsMapper;
import kr.spring.musinfo.vo.ContentsVO;

@Service("contentsService")
public class ContentsServiceImpl implements ContentsService{
	@Resource
	ContentsMapper contentsMapper; 
	
	@Override
	public void insertContents(ContentsVO contentsVO) {
		// TODO Auto-generated method stub
		contentsMapper.insertContents(contentsVO);
	}


	@Override
	public void updateContents(ContentsVO contentsVO) {
		// TODO Auto-generated method stub
		contentsMapper.updateContents(contentsVO);
	}


}
