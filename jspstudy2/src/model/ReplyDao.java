package model;

import org.apache.ibatis.session.SqlSession;

import model.mapper.ReplyMapper;

public class ReplyDao {
	private Class<ReplyMapper> cls = ReplyMapper.class;
	
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
}
