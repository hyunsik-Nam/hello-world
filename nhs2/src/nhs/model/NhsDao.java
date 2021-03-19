package nhs.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import nhs.model.mapper.NhsMapper;



public class NhsDao {
	private Class<NhsMapper> cls = NhsMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public int recordcnt(String column, String find) {
		SqlSession session = NhsConnection.getConnection();
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
			return session.getMapper(cls).recordcnt(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			NhsConnection.close(session);
		}
		return 0;
	}
	
	public List<Nhs> list(String column, String find){
		SqlSession session = NhsConnection.getConnection();
		try {
			map.clear();
			
			if(column != null) {
				String[] cols = column.split(",");
				switch(cols.length) {
				case 2 : map.put("col2", cols[1]);
				case 1 : map.put("col1", cols[0]);
				}
				map.put("find", find);
			}
			return session.getMapper(cls).select(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			NhsConnection.close(session);
		}
		return null;
	}
}
