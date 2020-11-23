package kr.spring.musinfo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.musinfo.service.CommentsService;
import kr.spring.musinfo.vo.CommentsVO;
         //빈 이름
@Service("commentsService")
public class CommentsServiceImpl implements CommentsService{
	


	@Override
	public void insertComments(CommentsVO review) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getCommentsCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CommentsVO> getCommentsList(int startRow, int endRow) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CommentsVO getComments(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateComments(CommentsVO musical) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComments(int num) {
		// TODO Auto-generated method stub
		
	}

}
