package jspBulletinBoard.vo;

public class Comment {
	private int commentNo;
	private int postNo;
	private String commentContent;
	private int sid;
	private Post post;
	private Student student;

	public Comment(int commentNo, int postNo, String commentContent, int sid, Post post, Student student) {
		super();
		this.commentNo = commentNo;
		this.postNo = postNo;
		this.commentContent = commentContent;
		this.sid = sid;
		this.post = post;
		this.student = student;
	}

	public Comment() {
		super();
	}

	public int getCommentNo() {
		return commentNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public int getSid() {
		return sid;
	}

	public Post getPost() {
		return post;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
}
