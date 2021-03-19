package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.ReplyMapper;

public class ReplyDao {
private Class<ReplyMapper> cls = ReplyMapper.class;
private Map<String, Object> map = new HashMap<>();
	
public int maxnum() {
	SqlSession session = MyBatisConnection.getConnection();
	
	try {
		return session.getMapper(cls).maxnum();
		// rs.next 한뒤 rs.getint or rs.getString 사용가능
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		MyBatisConnection.close(session);
	}
	return 0;
}
public int replyCount(int num,int btype) {
	SqlSession session = MyBatisConnection.getConnection();
	try {
		map.clear();
		map.put("num", num);
		map.put("btype",btype);
		return session.getMapper(cls).replycount(map);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		MyBatisConnection.close(session);
	}
	return 0;
}

	public boolean insert(Reply reply) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).insert(reply);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	
	
	public List<Reply> rlist1(int num,int btype){
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("btype",btype);
			map.put("num", num);
			return session.getMapper(cls).select(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	public Reply selectOne(int num,int btype) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			map.put("btype",btype);
			return session.getMapper(cls).select(map).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	public boolean update(Reply reply) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).update(reply);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	
	public boolean delete(int no) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).delete(no);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
}
