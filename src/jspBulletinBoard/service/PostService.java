package jspBulletinBoard.service;

import jspBulletinBoard.dao.PostDAO;
import jspBulletinBoard.exception.PostingException;
import jspBulletinBoard.vo.Post;

public class PostService {
	private PostDAO postDAO;

	public PostService(PostDAO postDAO) {
		this.postDAO = postDAO;
	}

	public int post(Post post) {
		int postNo = postDAO.getPostNo();
		post.setPostNo(postNo);

		int success = postDAO.insertPost(post);
		if (success != 1) {
			throw new PostingException("Posting Error");
		}

		return success;
	}

}
