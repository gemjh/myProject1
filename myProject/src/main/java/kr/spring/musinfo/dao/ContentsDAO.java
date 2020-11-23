package kr.spring.musinfo.dao;

import java.util.List;

import kr.spring.musinfo.vo.ContentsVO;

public interface ContentsDAO {
	public void insertContents(ContentsVO musical);
	public int getContentsCount();
	public List<ContentsVO> getContentsList(int startRow, int endRow);
	public ContentsVO getContents(int num);
	public void updateContents(ContentsVO musical);
	public void deleteContents(int num);
}
