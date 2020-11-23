package kr.spring.musinfo.service;

import java.util.List;

import kr.spring.musinfo.vo.ContentsVO;

public interface ContentsService {
	public void insertContents(ContentsVO review);
	public int getContentsCount();
	public List<ContentsVO> getContentsList(int startRow, int endRow);
	public ContentsVO getContents(int num);
	public void updateContents(ContentsVO review);
	public void deleteContents(int num);
}
