package jspBulletinBoard.vo;

import java.io.Serializable;
import java.util.Date;

public class Post implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int postNo;
	private String title;
	private int sid;
	private String postingdate;
	private String content;
	private int available;

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
	public void setAvailable(int available) {
		this.available = available;
	}
	
	
}
