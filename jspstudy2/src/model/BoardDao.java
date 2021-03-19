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

import model.mapper.BoardMapper;

public class BoardDao {
	private Class<BoardMapper> cls = BoardMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public int maxnum() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum();
			// rs.next �ѵ� rs.getint or rs.getString ��밡��
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public boolean insert(Board board) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).insert(board);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public int boardCount(String column, String find) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			if(column != null) {
				String[] cols = column.split(",");
				map.put("col1", cols[0]);
				switch(cols.length) {
				case 3 : map.put("col3", cols[2]);
				case 2 : map.put("col2", cols[1]);
				case 1 : map.put("col1", cols[0]);
				}
				map.put("find", find);
			}
			return session.getMapper(cls).boardcount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<Board> list(int pageNum,int limit,String column, String find){
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("start", (pageNum-1) * limit);
			map.put("limit", limit);
			if(column != null) {
				String[] cols = column.split(",");
				switch(cols.length) {
				case 3 : map.put("col3", cols[2]);
				case 2 : map.put("col2", cols[1]);
				case 1 : map.put("col1", cols[0]);
				}
				map.put("find", find);
			}
			return session.getMapper(cls).select(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public Board selectOne(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			return session.getMapper(cls).select(map).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public void readcntAdd(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).readcntAdd(num);
		} catch (Exception e) {		
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}

	//�亯�� ���, ���� ��ϵ� �亯���� ������ �ϳ� �ڷ� �о� �ֱ����� grpstep ����
	public void grpStepAdd(int grp, int grpstep) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).grpStepAdd(grp,grpstep);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}

	public boolean update(Board board) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).update(board);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public boolean delete(int id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).delete(id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public List<Map<String, Object>> boardgraph() {
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String,Object>> list = null;
		try {
			list = session.getMapper(cls).graph();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return list;
	}
}
