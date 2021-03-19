package mybatisjava;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Exam {
	public static void main(String[] args) {
		 SqlSessionFactory sqlMap = null;
		    Reader reader = null;
		    try {
		       reader =Resources.getResourceAsReader
		             ("mapper/mybatis-config.xml");
		       sqlMap = new SqlSe
		    		   ssionFactoryBuilder().build(reader);
		    }catch(IOException e) {e.printStackTrace(); }
		    int x = 0;
		    SqlSession session = sqlMap.openSession(); //연결
		    //selectOne : 레코드 한건 조회
		    //member.count : select 구문 실행
		    x = (Integer)session.selectOne("student.count");
		    System.out.println("student 테이블의 레코드 갯수:"+x);
		    
		    //2.학생테이블의 정보 출력
		    System.out.println("테이블 정보 =========");
		    List<Student> list = session.selectList("student.list");
		    for(Student s : list) System.out.println(s);
		    
		    //3.학생테이블의 등록된 레코드의 1학년 학생의 정보를 출력
		    System.out.println("1학년 학생의 정보=======");
		    list = session.selectList("student.grade","1");
		    for(Student s : list) System.out.println(s);
		    
		    //4. 학생테이블의 등록된 레코드의 이름이 두자인 학생의 정보를 출력
		    System.out.println("이름이 두자인 학생의 정보 =========");
		    list = session.selectList("student.twoname");
		    for(Student s : list) System.out.println(s);
		    
		    //5. 학생테이블의 등록된 레코드의 2학년 학생 중 주민번호 기준 여학생 정보를 출력
		    System.out.println("학생 테이블의 등록된 레코드의 3학년 학생 중 주민번호 기준 여학생 정보====");
		    list = session.selectList("student.jumin");
		    for(Student s : list) System.out.println(s);
		    

	}

}
