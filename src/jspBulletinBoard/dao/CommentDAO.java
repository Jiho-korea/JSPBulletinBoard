package jspBulletinBoard.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import jspBulletinBoard.vo.Comment;
import jspBulletinBoard.vo.Post;

public class CommentDAO {
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
	// 댓글 번호로 댓글 정보 가져오기
	 public Comment selectComment(Comment pComment) {
	    	SqlSession sqlSession = sqlSessionFactory.openSession();
	    	Comment comment = null;
			try {
				comment = sqlSession.selectOne("org.mybatis.persistence.CommentMapper.selectComment",pComment);
				return comment;
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
				return comment;
			}finally {
				sqlSession.close();
			}
	    }
	
	// 댓글 작성
    public int insertComment(Comment comment) {
    	SqlSession sqlSession = sqlSessionFactory.openSession();
		int success = 0;
		try {
			success = sqlSession.insert("org.mybatis.persistence.CommentMapper.insertComment",comment);
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
	
	// 댓글 삭제
    public int deleteComment(Comment comment){
    	SqlSession sqlSession = sqlSessionFactory.openSession();
		int success = 0;
		try {
			success = sqlSession.delete("org.mybatis.persistence.CommentMapper.deleteComment",comment);
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
   // 댓글 수정
    public int updateComment(Comment comment){
    	SqlSession sqlSession = sqlSessionFactory.openSession();
		int success = 0;
		try {
			success = sqlSession.update("org.mybatis.persistence.CommentMapper.updateComment",comment);
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
}
