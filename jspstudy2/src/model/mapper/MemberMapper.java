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

	@Insert("insert into member"
	 +" (id,pass,name,gender,email,tel,picture)"
	 +" value (#{id},#{pass},#{name},#{gender},"
	 + "#{email},#{tel},#{picture})")
	int insert(Member mem);

	@Select({"<script>",
		"select * from member ",
		"<if test ='id != null'>where binary id = #{id}</if>",
		"</script>"})
	List<Member> select(Map<String, Object> map);

	@Update("update member set name=#{name}," //update�� ���� �����Ҽ��ִ°�.��й�ȣ ���� �Ұ�-> ��ġ�ؾ� ������ �����ϱ� ����
            +"gender=#{gender}, email=#{email}, tel=#{tel}, picture=#{picture} where id=#{id}")
	int update(Member m);

	@Delete("delete from member where id=#{value}")
	int delete(String id);

	@Update("update member set pass=#{pass} where id=#{id}")
	int updatePass(@Param("id")String id, @Param("pass")String pass);

	@Select("select id from member where email = #{email} and tel = #{tel}")
	String idSearch(@Param("email")String email, @Param("tel")String tel);

	@Select("select pass from member where id =#{id} and email =#{email} and tel = #{tel}")
	String passSearch(@Param("id")String id,@Param("email")String email, @Param("tel")String tel);


	
	

}
