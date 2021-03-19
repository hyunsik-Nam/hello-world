package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;

public interface BoardMapper {

	@Select("select ifnull(MAX(num),0) from fboard")
	int maxnum();

	@Insert("insert into fboard"
			+ " (num,btype,nick,subject,content,picture,bdate,"
			+ " readcnt) "
			+ "values (#{num},#{btype},#{nick},#{subject},#{content},"
			+"#{picture},now(),0)")
	void insert(Board board);

	@Select({"<script>",
			"select count(*) from fboard",
			"<if test='btype != null'>where btype=#{btype}</if>",
			"<if test='col1 != null'> and ${col1} like '%${find}%'</if>",
			"<if test='col2 != null'> or ${col2} like '%${find}%'</if>",
			"<if test='col3 != null'> or ${col3} like '%${find}%'</if>",
			"</script>"})
	int boardcount(Map<String,Object> map);

	@Select({"<script>",
			"select * from fboard",
			"<if test='num != null and btype != null'>where num=#{num} and btype=#{btype}</if>",
			"<if test='num == null and btype != null'> where btype=#{btype}</if>",
			"<if test='col1 != null'> and ${col1} like '%${find}%'</if>",
			"<if test='col2 != null'> or ${col2} like '%${find}%'</if>",
			"<if test='col3 != null'> or ${col3} like '%${find}%'</if>",
			 "<if test='start != null'>order by num desc"
						+" limit #{start},#{limit}</if>",
			"</script>"})
	List<Board> select(Map<String, Object> map);

	@Update(" update fboard set readcnt = (readcnt+1) where num = #{num}")
	void readcntAdd(@Param("num") int num);


	@Update(" update fboard set nick=#{nick},subject=#{subject},content=#{content},picture=#{picture} where num =#{num} and btype=#{btype}")
	void update(Board board);

	@Delete(" delete from fboard where num = #{value}")
	void delete(int id);

	@Select({"<script>",
			"select * from fboard",
			"<if test='num != null and btype != null'>where num=#{num} and btype=#{btype}</if>",
			"<if test='num == null and btype != null'> where btype=#{btype}</if>",
			"<if test='start != null'>order by num desc"
					+" limit #{start},#{limit}</if>",
			"</script>"})
	List<Board> select1(Map<String, Object> map);


}
