package jspBulletinBoard.service;

import jspBulletinBoard.dao.CommentDAO;
import jspBulletinBoard.exception.NonExistentCommentException;
import jspBulletinBoard.exception.UnauthenticatedException;
import jspBulletinBoard.vo.Comment;

public class UpdateCommentService {
	private CommentDAO commentDAO;

	// 의존주입
	public UpdateCommentService(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	public Comment getComment(Comment comment, int sid) {
		comment = commentDAO.selectComment(comment);
		if (comment == null) {
			throw new NonExistentCommentException("non-existent comment");
		}
		if (comment != null && sid != comment.getSid()) {
			throw new UnauthenticatedException("unauthenticated student :" + sid);
		}
		return comment;
	}
}
