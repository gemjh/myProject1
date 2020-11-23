package kr.spring.musinfo.dao;

import java.util.List;

import kr.spring.musinfo.vo.CommentsVO;

public interface CommentsDAO {
	public void insertComments(CommentsVO review);
	public int getCommentsCount();
	public List<CommentsVO> getCommentsList(int startRow, int endRow);
	public CommentsVO getComments(int num);
	public void updateComments(CommentsVO musical);
	public void deleteComments(int num);
}
