package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.Test2Mapper;

/*
 * 1. ��� ���� ���� ��ȸ�ϱ�

2. 101 �а� ���� ���� ��ȸ�ϱ�

3. ���� ��ȣ�� 1001���� ���� ���� ��ȸ�ϱ�

4. 101 �а��� ������ ���� ��ȸ�ϱ�

5. ������ ���� ��ȸ�ϱ�

6. 101,201 �а� ���� ���� ��ȸ�ϱ�

7. 101,201 �а� �� ���� ���� ��ȸ�ϱ�
 */
public class Test2 {
	private final static String NS = "mapper.Test2Mapper.";
	private static SqlSessionFactory sqlMap;
	static {
		InputStream input = null;
		try{
			input = Resources.getResourceAsStream
					("mapper/mybatis-config.xml");
		}catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();
		//��� ���� ����
		System.out.println("1. ��� ���� ���� ��ȸ�ϱ�");
		List<Professor> list = session.getMapper(Test2Mapper.class).select(null);
		for(Professor p : list) System.out.println(p);
		
		//101�а� ��������
		System.out.println("2. 101 �а� ���� ���� ��ȸ�ϱ�");
		Map<String,Object> map = new HashMap<>();
		map.put("deptno",101);
		list = session.getMapper(Test2Mapper.class).select(map);
		for(Professor p : list) System.out.println(p);
		
		//3. ���� ��ȣ�� 1001���� ���� ���� ��ȸ�ϱ�
		System.out.println("3. ���� ��ȣ�� 1001���� ���� ���� ��ȸ�ϱ�");
		map.clear();
		map.put("no", 1001);
		list = session.getMapper(Test2Mapper.class).select(map);
		for(Professor p : list) System.out.println(p);
		
		//4. 101 �а��� ������ ���� ��ȸ�ϱ�
		System.out.println("4. 101 �а��� ������ ���� ��ȸ�ϱ�");
		map.clear();
		map.put("deptno", 101);
		map.put("position", "������");
		list = session.getMapper(Test2Mapper.class).select(map);
		for(Professor p : list) System.out.println(p);
		
		//5. ������ ���� ��ȸ�ϱ�
		System.out.println("5. ������ ���� ��ȸ�ϱ�");
		map.clear();
		map.put("position", "������");
		list = session.getMapper(Test2Mapper.class).select(map);
		for(Professor p : list) System.out.println(p);
		
		//6. 101,201 �а� ���� ���� ��ȸ�ϱ�
		System.out.println("6. 101,201 �а� ���� ���� ��ȸ�ϱ�");
		List<Integer> mlist =Arrays.asList(101,201);
		map.clear();
		map.put("column", "deptno");
		map.put("datas", mlist);
		list = session.getMapper(Test2Mapper.class).select(map);
		for(Professor p : list) System.out.println(p);
		
		//7. 101,201 �а� �� ���� ���� ��ȸ�ϱ�
		System.out.println("7. 101,201 �а� �� ���� ���� ��ȸ�ϱ�");
		map.put("position", "������");
		list = session.getMapper(Test2Mapper.class).select(map);
		for(Professor p : list) System.out.println(p);
		
		
		
		

	}

}
