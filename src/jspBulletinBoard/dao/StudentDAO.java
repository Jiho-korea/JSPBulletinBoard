package jspBulletinBoard.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import jspBulletinBoard.vo.Student;

// DB STUDENT 테이블에 접근하는 DAO
public class StudentDAO {
	private static SqlSessionFactory sqlSessionFactory;

	static {
		try {
			// 마이바티스 환경 설정 XML 파일 경로
			String resource = "resources/mybatis/config-mybatis.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Student selectBySidPassword(Student pStudent) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Student student = null;
		try {
			student = sqlSession.selectOne("org.mybatis.persistence.StudentMapper.selectBySidPassword", pStudent);
			return student;
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			return student;
		} finally {
			sqlSession.close();
		}
	}

	public int selectBySid(Student pStudent) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Student student = null;
		try {
			student = sqlSession.selectOne("org.mybatis.persistence.StudentMapper.selectBySid", pStudent);
			if (student != null) {
				return 1;
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			return 1;
		} finally {
			sqlSession.close();
		}
	}

	public int insertStudent(Student pStudent) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int success = 0;
		try {
			success = sqlSession.insert("org.mybatis.persistence.StudentMapper.insertStudent", pStudent);
			sqlSession.commit();
			return success;
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			return success;
		} finally {
			sqlSession.close();
		}
	}

	public static Student getWriter(int sid) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Student student = new Student();
		student.setSid(sid);
		try {
			student = sqlSession.selectOne("org.mybatis.persistence.StudentMapper.selectStudent", student);
			return student;
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			return student;
		} finally {
			sqlSession.close();
		}
	}
}
