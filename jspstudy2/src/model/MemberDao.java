package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.Session;
import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;

public class MemberDao {
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public int insert(Member mem) {
		SqlSession session = MyBatisConnection.getConnection();
		// 문장을 준비하는 객체
		String sql = "insert into member" + " (id,pass,name,gender,email,tel,picture)" + " value (?,?,?,?,?,?,?)";
		try {
			return session.getMapper(cls).insert(mem);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	// id : 화면에서 입력된 id값
	public Member selectOne(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		String sql = "select * from member where id = ?";

		try {
			map.clear();
			map.put("id", id);
			return session.getMapper(cls).select(map).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	// m : 화면에 입력된 정보 저장하고 있는 객체
	public int update(Member m) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).update(m); // 변경된 레코드의 갯수 리턴
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<Member> list() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).select(null);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int delete(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int updatePass(String id, String pass) {
		SqlSession session = MyBatisConnection.getConnection();
		String sql = "update member set pass=? where id=?";
		try {
			return session.getMapper(cls).updatePass(id, pass);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public String idSearch(String email, String tel) {
		SqlSession session = MyBatisConnection.getConnection();
		String sql = "select id from member where email = ? and tel = ?";
		try {
			return session.getMapper(cls).idSearch(email,tel);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public String pwSearch(String id, String email, String tel) {
		SqlSession session = MyBatisConnection.getConnection();
		String sql = "select id from member where id =? and email = ? and tel = ?";
		try {
			
			return session.getMapper(cls).passSearch(id,email,tel);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
}