package jspBulletinBoard.vo;

import java.io.Serializable;

public class Student implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int sid;
	private String name;
	private String password;
	private int grade;
	private String subject;
	private int manager;

	public int getSid() {
		return sid;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public int getGrade() {
		return grade;
	}

	public String getSubject() {
		return subject;
	}

	public int getManager() {
		return manager;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setManager(int manager) {
		this.manager = manager;
	}

	public Student(int sid, String name, String password, int grade, String subject, int manager) {
		super();
		this.sid = sid;
		this.name = name;
		this.password = password;
		this.grade = grade;
		this.subject = subject;
		this.manager = manager;
	}

	public Student() {
		super();
	}

}
