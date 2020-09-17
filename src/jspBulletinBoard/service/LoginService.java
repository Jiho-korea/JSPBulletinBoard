package jspBulletinBoard.service;

import jspBulletinBoard.dao.StudentDAO;
import jspBulletinBoard.exception.StudentNotFoundException;
import jspBulletinBoard.vo.Student;

public class LoginService {
	private StudentDAO studentDAO;

	public LoginService(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}

	public Student login(Student student) {
		Student loginStudent = studentDAO.selectBySidPassword(student);
		if (loginStudent == null) {
			throw new StudentNotFoundException("not found " + student.getSid());
		}

		return loginStudent;
	}

}
