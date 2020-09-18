package jspBulletinBoard.service;

import jspBulletinBoard.dao.PostDAO;
import jspBulletinBoard.exception.NonExistentPostException;
import jspBulletinBoard.vo.Post;

public class ViewPostService {
	private PostDAO postDAO;

	// 의존주입
	public ViewPostService(PostDAO postDAO) {
		this.postDAO = postDAO;
	}

	public Post getPostInfo(Post post) {
		post = postDAO.selectPostInfo(post);
		if (post == null) {
			throw new NonExistentPostException("non-existent post");
		}
		return post;
	}
}
