package jspBulletinBoard.dao;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import jspBulletinBoard.vo.Student;
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
	
	public Student login(Student pStudent) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Student student = null;
		try {
			student = sqlSession.selectOne("org.mybatis.persistence.StudentMapper.login",pStudent);
			return student;
		}catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			return student;
		}finally {
			sqlSession.close();
		}
	}
	
	public int checkRegistration(Student pStudent) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Student student = null;
		try {
			student = sqlSession.selectOne("org.mybatis.persistence.StudentMapper.selectStudent",pStudent);
			if(student != null) {
				return 1;
			}else {
				return 0;
			}
		}catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			return 1;
		}finally {
			sqlSession.close();
		}
	}
	 
	public int register(Student pStudent) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int success = 0;
		try {
			success = sqlSession.insert("org.mybatis.persistence.StudentMapper.register",pStudent);
			sqlSession.commit();
			return success;
		}catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			return success;
		}finally {
			sqlSession.close();
		}
	}
	
	public static Student getWriter(int sid) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Student student = new Student();
		student.setSid(sid);
		try {
			student = sqlSession.selectOne("org.mybatis.persistence.StudentMapper.selectStudent",student);
			return student;
		}catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			return student;
		}finally {
			sqlSession.close();
		}
	}
}
