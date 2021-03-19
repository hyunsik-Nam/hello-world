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
		    SqlSession session = sqlMap.openSession(); //����
		    //selectOne : ���ڵ� �Ѱ� ��ȸ
		    //member.count : select ���� ����
		    x = (Integer)session.selectOne("professor.count");
		    System.out.println("professor ���̺��� ���ڵ� ����:"+x);
		    
		    // 2. �������̺� ��ϵ� ��� ������ ���
		    System.out.println("2. �������̺� ��ϵ� ��� ����====");
		    List<Professor> list = session.selectList("professor.info");
		    for(Professor p : list) System.out.println(p);
		    
		    // 3. ������ 101�� �а��� ���� ������ ����ϱ�
		    System.out.println("3. ������ 101�� �а��� ���� ����=====");
		    list = session.selectList("professor.info101",101);
		    for(Professor p : list) System.out.println(p);
		    
		    // 4. ������ ���� �达�� �ð����� ������ ���
		    System.out.println("������ ���� �达�� �ð����� ����=====");
		   Map<String,Object> map = new HashMap<>();
		   map.put("name", "��");
		   map.put("position","�ð�����");
		   list = session.selectList("professor.selectnameposition",map);
		   for(Professor p : list) System.out.println(p);
		    
		    

	}

}
