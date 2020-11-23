package kr.spring.musinfo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.spring.musinfo.vo.ContentsVO;

@Service("contentsService")
public class ContentsServiceImpl implements ContentsService{

	@Override
	public void insertContents(ContentsVO review) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getContentsCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ContentsVO> getContentsList(int startRow, int endRow) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ContentsVO getContents(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateContents(ContentsVO review) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteContents(int num) {
		// TODO Auto-generated method stub
		
	}

}
