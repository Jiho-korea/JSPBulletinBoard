package jspBulletinBoard.vo;

import java.io.Serializable;
import java.util.List;

public class Post implements Serializable {

	private static final long serialVersionUID = 1L;

	private int postNo;
	private String title;
	private int sid;
	private String postingdate;
	private String content;
	private Student student;
	private List<Comment> comments;
	private int available;

	public Post(int postNo, String title, int sid, String postingdate, String content, Student student,
			List<Comment> comments, int available) {

		this.postNo = postNo;
		this.title = title;
		this.sid = sid;
		this.postingdate = postingdate;
		this.content = content;
		this.student = student;
		this.comments = comments;
		this.available = available;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Post() {
		super();
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getPostNo() {
		return postNo;
	}

	public String getTitle() {
		return title;
	}

	public int getSid() {
		return sid;
	}

	public String getPostingdate() {
		return postingdate;
	}

	public String getContent() {
		return content;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public int getAvailable() {
		return available;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public void setPostingdate(String postingdate) {
		this.postingdate = postingdate;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public void setAvailable(int available) {
		this.available = available;
	}

}
