package jspBulletinBoard.service;

import jspBulletinBoard.dao.CommentDAO;
import jspBulletinBoard.exception.CommentingException;
import jspBulletinBoard.vo.Comment;

public class CommentService {
	private CommentDAO commentDAO;

	public CommentService(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	public int comment(Comment comment) {
		int success = commentDAO.insertComment(comment);

		if (success != 1) {
			throw new CommentingException("Commenting Error");
		}

		return success;
	}

}
