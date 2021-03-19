package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.StudentMapper;

/*
 * Mybatis를 인터페이스 방식으로 사용하기
 */
public class Main4 {
	private final static String NS = "mapper.StudentMapper.";
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
		 System.out.println("모든 학생 정보 조회하기");
		 List<Student> list = session.getMapper
				 (StudentMapper.class).select(null);
		 for(Student s : list) System.out.println(s);
		 
		 System.out.println("1학년 학생 정보 조회하기");
		 Map<String,Object> map = new HashMap<>();
		 map.put("grade", 1);
		 list = session.getMapper(StudentMapper.class).select(null);
		 for(Student s : list) System.out.println(s);
		 
		 System.out.println("981213 학번 학생 정보 조회하기");
		 list = session.getMapper(StudentMapper.class).select(map);
		 for(Student s : list) System.out.println(s);
		 
		 System.out.println("김삿갓 학생 추가하기");
		 Student st = new Student();
		 st.setStudno(1002);
		 st.setName("김삿갓");
		 st.setJumin("1234562345678");
		 st.setId("kimsk");
		 int result = session.getMapper(StudentMapper.class)
				 				.insert(st);
		 System.out.println("김삿갓 학생 조회하기");
		 map.clear();
		 map.put("name","김삿갓");
		 list = session.getMapper(StudentMapper.class).select(map);
		 for(Student s : list) System.out.println(s);
		 System.out.println("김삿갓 학생의 학년:1, 몸무게:80, 키:175 변경하기");
		 st.setGrade(1);
		 st.setWeight(80);
		 st.setHeight(175);
		 result = session.getMapper(StudentMapper.class).update(st);
		 System.out.println(result + "건 수정");
		 System.out.println("김삿갓 학생 조회하기");
		 map.clear();
		 map.put("name","김삿갓");
		 list = session.getMapper(StudentMapper.class).select(map);
		 for(Student s : list) System.out.println(s);
		 
		 System.out.println("1002번 학생 삭제하기");
		 result = session.getMapper(StudentMapper.class).delete(1002);
		 System.out.println(result + "건 삭제");
		 list = session.getMapper(StudentMapper.class).select(map);
		 for(Student s : list) System.out.println(s);
		 System.out.println("101번 학과 학생중 1학년 학생 조회하기");
		 list = session.getMapper(StudentMapper.class).select2(101,1);
		 for(Student s : list) System.out.println(s);
		 


	}

}
