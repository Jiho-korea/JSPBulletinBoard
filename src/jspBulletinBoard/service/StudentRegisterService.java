package jspBulletinBoard.service;

import jspBulletinBoard.dao.StudentDAO;
import jspBulletinBoard.exception.DuplicateStudentException;
import jspBulletinBoard.vo.Student;

public class StudentRegisterService {
	private StudentDAO studentDAO;

	public StudentRegisterService(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}

	public Boolean regist(Student student) {
		int checkRegistration = studentDAO.selectBySid(student);
		if (checkRegistration == 1) {
			throw new DuplicateStudentException("dup sid " + student.getSid());
		}

		int updateCount = 0;
		updateCount = studentDAO.insertStudent(student);
		if (updateCount == 1) {
			return true;
		} else {
			throw new RuntimeException();
		}
	}

}
