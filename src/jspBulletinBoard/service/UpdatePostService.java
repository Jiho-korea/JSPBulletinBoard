package jspBulletinBoard.service;

import jspBulletinBoard.dao.PostDAO;
import jspBulletinBoard.exception.NonExistentPostException;
import jspBulletinBoard.exception.UnauthenticatedException;
import jspBulletinBoard.exception.UpdatingPostException;
import jspBulletinBoard.vo.Post;

public class UpdatePostService {
	private PostDAO postDAO;

	public UpdatePostService(PostDAO postDAO) {
		this.postDAO = postDAO;
	}

	public Post requestUpdatingPostPage(int sid, Post post) {
		post = postDAO.selectPost(post);
		if (post == null) {
			throw new NonExistentPostException("non-existent post");
		}
		if (sid != post.getSid()) {
			throw new UnauthenticatedException("unauthenticated student : " + sid);
		}

		return post;
	}

	public int updatePost(int sid, Post post) {
		Post result = postDAO.selectPost(post);

		if (result == null) {
			throw new NonExistentPostException("non-existent post");
		}
		if (result != null && !(sid == result.getSid())) {
			throw new UnauthenticatedException("unauthenticated student : " + sid);
		}

		int success = postDAO.updatePost(post);
		if (success != 1) {
			throw new UpdatingPostException("Can't update post");
		}
		return success;
	}

}
