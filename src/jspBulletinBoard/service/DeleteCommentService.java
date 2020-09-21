package jspBulletinBoard.service;

import jspBulletinBoard.dao.CommentDAO;
import jspBulletinBoard.exception.DeletingCommentException;
import jspBulletinBoard.exception.NonExistentCommentException;
import jspBulletinBoard.exception.UnauthenticatedException;
import jspBulletinBoard.vo.Comment;

public class DeleteCommentService {
	private CommentDAO commentDAO;

	public DeleteCommentService(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	public int deleteComment(int sid, Comment comment) {
		comment = commentDAO.selectComment(comment);

		if (comment == null) {
			throw new NonExistentCommentException("non-existent comment");
		}
		if (comment != null && sid != comment.getSid()) {
			throw new UnauthenticatedException("unauthenticated student : " + sid);
		}

		int success = commentDAO.deleteComment(comment);
		if (success != 1) {
			throw new DeletingCommentException("Can't delete comment");
		}
		return success;
	}

}
