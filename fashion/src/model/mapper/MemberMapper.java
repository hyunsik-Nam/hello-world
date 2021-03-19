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

	@Update("update mem set name=#{name}," //update에 내가 수정할수있는것.비밀번호 수정 불가-> 일치해야 수정이 가능하기 때문
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
