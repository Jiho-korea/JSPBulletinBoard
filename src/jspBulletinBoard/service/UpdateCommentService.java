package jspBulletinBoard.service;

import jspBulletinBoard.dao.CommentDAO;
import jspBulletinBoard.exception.NonExistentCommentException;
import jspBulletinBoard.exception.UnauthenticatedException;
import jspBulletinBoard.vo.Comment;
import jspBulletinBoard.vo.Student;

public class UpdateCommentService {
	private CommentDAO commentDAO;

	// 의존주입
	public UpdateCommentService(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	public Comment getComment(Comment comment, Student student) {
		comment = commentDAO.selectComment(comment);
		if (comment == null) {
			throw new NonExistentCommentException("non-existent comment");
		}
		if (comment != null && student.getSid() != comment.getSid()) {
			throw new UnauthenticatedException("unauthenticated student :" + student.getSid());
		}
		return comment;
	}
}
