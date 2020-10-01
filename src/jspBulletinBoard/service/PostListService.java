package jspBulletinBoard.service;

import java.util.List;

import jspBulletinBoard.dao.PostDAO;
import jspBulletinBoard.exception.NonExistentPageException;
import jspBulletinBoard.vo.BoardRequest;

public class PostListService {
	private PostDAO postDAO;

	// 의존주입
	public PostListService(PostDAO postDAO) {
		this.postDAO = postDAO;
	}

	// 다음 페이지가 있는 지 체크
	public Boolean nextPage(int pageNumber) {
		return postDAO.nextPage(pageNumber);
	}

	// 해당 페이지의 게시글 리스트 가져옴
	public List<Object> postList(BoardRequest boardRequest) {
		if (nextPage(boardRequest.getPageNumber() - 1) == false) {
			// 존재 하지 않는 페이지 일때 Exception 발생
			throw new NonExistentPageException("non-existent page" + boardRequest.getPageNumber());
		}

		boardRequest.setPageNumber((boardRequest.getPageNumber() - 1) * 10);
		List<Object> postList = postDAO.listPost(boardRequest);

		return postList;
	}

}
