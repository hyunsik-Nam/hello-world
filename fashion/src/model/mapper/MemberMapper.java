package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;
 
public interface MemberMapper {

	@Insert("insert into mem"
	 +" (id,pass,name,nick,email,picture)"
	 +" value (#{id},#{pass},#{name},#{nick},"
	 + "#{email},#{picture})")
	int insert(Member mem);

	@Select({"<script>",
		"select * from mem ",
		"<if test ='id != null'>where binary id = #{id}</if>",
		"</script>"})
	List<Member> select(Map<String, Object> map);

	@Update("update mem set name=#{name}," //update�� ���� �����Ҽ��ִ°�.��й�ȣ ���� �Ұ�-> ��ġ�ؾ� ������ �����ϱ� ����
            +"email=#{email}, nick=#{nick}, picture=#{picture} where id=#{id}")
	int update(Member m);

	@Delete("delete from mem where id=#{value}")
	int delete(String id);

	@Update("update mem set pass=#{pass} where id=#{id}")
	int updatePass(@Param("id")String id, @Param("pass")String pass);

	@Select("select id from mem where email = #{email} and name = #{name}")
	String idSearch(@Param("email")String email, @Param("name")String name);

	@Select("select pass from mem where id =#{id} and email =#{email} and name = #{name}")
	String passSearch(@Param("id")String id,@Param("email")String email, @Param("name")String name);


	
	

}
