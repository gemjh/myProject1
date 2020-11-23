package kr.spring.musinfo.service;

import java.util.List;

import kr.spring.musinfo.vo.CommentsVO;

public interface CommentsService {
	public void insertComments(CommentsVO review);
	public int getCommentsCount();
	public List<CommentsVO> getCommentsList(int startRow, int endRow);
	public CommentsVO getComments(int num);
	public void updateComments(CommentsVO review);
	public void deleteComments(int num);
}
