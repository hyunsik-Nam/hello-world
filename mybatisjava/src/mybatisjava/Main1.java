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




public class Main1 {
 public static void main(String[]args) {
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
    x = (Integer)session.selectOne("member.count");
    System.out.println("member 테이블의 레코드 갯수:" + x);
    
    System.out.println("member 테이블의 정보==========");
    //selectList : select 구문의 결과가 여러개인 경우 List로 리턴
    List<Member> list = session.selectList("member.list");
    for(Member m : list) System.out.println(m);
    System.out.println("member    테이블의 admin 정보 ========");
    Member mem = session.selectOne("member.selectid","admin");
    System.out.println(mem);
    System.out.println("member 테이블에서 이름이 '트'이름가진 정보======");
    list = session.selectList("member.selectname","%트%");
    for(Member m : list) System.out.println(m);
    System.out.println("member 테이블에서 이름이 '트'이름가진 정보======");
    list = session.selectList("member.selectname2","트");
    for(Member m : list) System.out.println(m);
    //두개 이상의 파라미터 전달
    System.out.println("이름정보와 성별로 조회하기");
    System.out.println("member 테이블에서 이름이 '트'이름가진 여자 정보======");
    Map<String,Object> map = new HashMap<>();
    map.put("name", "%트");
    map.put("gender", 2);
    list = session.selectList("member.selectnamegender",map);
    for(Member m : list) System.out.println(m);
 }
}