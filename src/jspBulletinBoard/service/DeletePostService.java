package jspBulletinBoard.service;

import jspBulletinBoard.dao.PostDAO;
import jspBulletinBoard.exception.DeletingPostException;
import jspBulletinBoard.exception.NonExistentPostException;
import jspBulletinBoard.exception.UnauthenticatedException;
import jspBulletinBoard.vo.Post;

public class DeletePostService {
	private PostDAO postDAO;

	public DeletePostService(PostDAO postDAO) {
		this.postDAO = postDAO;
	}

	public int deletePost(int sid, Post post) {
		post = postDAO.selectPost(post);

		if (post == null) {
			throw new NonExistentPostException("non-existent post");
		}
		if (post != null && sid != post.getSid()) {
			throw new UnauthenticatedException("unauthenticated student : " + sid);
		}

		int success = postDAO.deletePost(post);
		if (success != 1) {
			throw new DeletingPostException("Can't delete post");
		}
		return success;
	}

}
