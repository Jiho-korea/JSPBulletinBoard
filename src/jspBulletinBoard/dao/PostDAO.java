package jspBulletinBoard.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import jspBulletinBoard.vo.BoardRequest;
import jspBulletinBoard.vo.Post;

public class PostDAO {
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

	public boolean nextPage(int pageNumber) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Object> postList = null;
		try {
			postList = sqlSession.selectList("org.mybatis.persistence.PostMapper.listPost",
					new BoardRequest(pageNumber * 10, null));
			if (!postList.isEmpty()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			return false;
		} finally {
			sqlSession.close();
		}
	}

	public List<Object> listPost(BoardRequest boardRequest) { // date_format(POSTINGDATE,'%Y-%m-%d') as
		// POSTINGDATE 으로
		// 간단하게 뽑을
		// 수도있다.
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Object> postList = null;
		try {
			postList = sqlSession.selectList("org.mybatis.persistence.PostMapper.listPost", boardRequest);
			return postList;
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			return postList;
		} finally {
			sqlSession.close();
		}
	}

//댓글까지 포함된 게시글 정보 받아온다.
	public Post selectPostInfo(Post pPost) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Post post = null;
		try {
			post = sqlSession.selectOne("org.mybatis.persistence.PostMapper.infoPost", pPost);
			return post;
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			return post;
		} finally {
			sqlSession.close();
		}
	}

	public Post selectPost(Post pPost) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Post post = null;
		try {
			post = sqlSession.selectOne("org.mybatis.persistence.PostMapper.selectPost", pPost);
			return post;
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			return post;
		} finally {
			sqlSession.close();
		}
	}

	public int deletePost(Post pPost) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int success = 0;
		try {
			success = sqlSession.delete("org.mybatis.persistence.PostMapper.deletePost", pPost);
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

	// title , content, post_no
	public int updatePost(Post pPost) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int success = 0;
		try {
			success = sqlSession.update("org.mybatis.persistence.PostMapper.updatePost", pPost);
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

	public int getPostNo() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int postNo = 0;
		try {
			postNo = sqlSession.selectOne("org.mybatis.persistence.PostMapper.selectMaxPostNo");
			return postNo;
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			return postNo;
		} finally {
			sqlSession.close();
		}
	}

	// postNo , title, sid , content
	public int insertPost(Post pPost) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int success = 0;
		try {
			success = sqlSession.insert("org.mybatis.persistence.PostMapper.insertPost", pPost);
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

}
