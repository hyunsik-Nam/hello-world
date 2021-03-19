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
		    SqlSession session = sqlMap.openSession(); //����
		    //selectOne : ���ڵ� �Ѱ� ��ȸ
		    //member.count : select ���� ����
		    x = (Integer)session.selectOne("student.count");
		    System.out.println("student ���̺��� ���ڵ� ����:"+x);
		    
		    //2.�л����̺��� ���� ���
		    System.out.println("���̺� ���� =========");
		    List<Student> list = session.selectList("student.list");
		    for(Student s : list) System.out.println(s);
		    
		    //3.�л����̺��� ��ϵ� ���ڵ��� 1�г� �л��� ������ ���
		    System.out.println("1�г� �л��� ����=======");
		    list = session.selectList("student.grade","1");
		    for(Student s : list) System.out.println(s);
		    
		    //4. �л����̺��� ��ϵ� ���ڵ��� �̸��� ������ �л��� ������ ���
		    System.out.println("�̸��� ������ �л��� ���� =========");
		    list = session.selectList("student.twoname");
		    for(Student s : list) System.out.println(s);
		    
		    //5. �л����̺��� ��ϵ� ���ڵ��� 2�г� �л� �� �ֹι�ȣ ���� ���л� ������ ���
		    System.out.println("�л� ���̺��� ��ϵ� ���ڵ��� 3�г� �л� �� �ֹι�ȣ ���� ���л� ����====");
		    list = session.selectList("student.jumin");
		    for(Student s : list) System.out.println(s);
		    

	}

}
