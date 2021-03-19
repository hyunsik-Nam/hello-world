package mybatisjava;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class test {

	public static void main(String[] args) {
		 SqlSessionFactory sqlMap = null;
		    Reader reader = null;
		    try {
		       reader =Resources.getResourceAsReader
		             ("mapper/mybatis-config.xml");
		       sqlMap = new SqlSessionFactoryBuilder().build(reader);
		    }catch(IOException e) {e.printStackTrace(); }
		    int x = 0;
		    SqlSession session = sqlMap.openSession(); //연결
		    //selectOne : 레코드 한건 조회
		    //member.count : select 구문 실행
		    x = (Integer)session.selectOne("professor.count");
		    System.out.println("professor 테이블의 레코드 갯수:"+x);
		    
		    // 2. 교수테이블에 등록된 모든 정보를 출력
		    System.out.println("2. 교수테이블에 등록된 모든 정보====");
		    List<Professor> list = session.selectList("professor.info");
		    for(Professor p : list) System.out.println(p);
		    
		    // 3. 교수중 101번 학과의 교수 정보를 출력하기
		    System.out.println("3. 교수중 101번 학과의 교수 정보=====");
		    list = session.selectList("professor.info101",101);
		    for(Professor p : list) System.out.println(p);
		    
		    // 4. 교수중 성이 김씨인 시간강사 정보를 출력
		    System.out.println("교수중 성이 김씨인 시간강사 정보=====");
		   Map<String,Object> map = new HashMap<>();
		   map.put("name", "김");
		   map.put("position","시간강사");
		   list = session.selectList("professor.selectnameposition",map);
		   for(Professor p : list) System.out.println(p);
		    
		    

	}

}
