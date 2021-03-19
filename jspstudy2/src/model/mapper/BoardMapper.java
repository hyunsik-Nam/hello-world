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

	@Select("select ifnull(MAX(num),0) from board")
	int maxnum();

	@Insert("insert into board"
			+ " (num, name,pass,subject,content,file1,regdate,"
			+ " readcnt, grp,grplevel,grpstep) "
			+ "values (#{num},#{name},#{pass},#{subject},#{content},"
			+"#{file1},now(),0,#{grp},#{grplevel},#{grpstep})")
	void insert(Board board);

	@Select({"<script>",
			"select count(*) from board",
			"<if test='col1 != null'> where ${col1} like '%${find}%'</if>",
			"<if test='col2 != null'> or ${col2} like '%${find}%'</if>",
			"<if test='col3 != null'> or ${col3} like '%${find}%'</if>",
			"</script>"})
	int boardcount(Map<String,Object> map);

	@Select({"<script>",
			"select * from board",
			"<if test='col1 != null'> where ${col1} like '%${find}%'</if>",
			"<if test='col2 != null'> or ${col2} like '%${find}%'</if>",
			"<if test='col3 != null'> or ${col3} like '%${find}%'</if>",
			 "<if test='num != null'>where num =#{num}</if>",
			 "<if test='start != null'>order by grp desc,grpstep"
			+" limit #{start},#{limit}</if>",
			"</script>"})
	List<Board> select(Map<String, Object> map);

	@Update(" update board set readcnt = (readcnt+1) where num = #{value}")
	Object readcntAdd(int num);

	@Update(" update board set grpstep = grpstep + 1" + "where grp = #{grp} and grpstep > #{grpstep}")
	void grpStepAdd(@Param("grp")int grp, @Param("grpstep")int grpstep);

	@Update(" update board set name=#{name},subject=#{subject},content=#{content},file1=#{file1} where num =#{num}")
	void update(Board board);

	@Delete(" delete from board where num = #{value}")
	void delete(int id);

	/*
	  name : 홍길동, cnt: 5
	  name : 테스트, cnt: 4
	 */
	 @Select("select name, count(*) cnt from board group by name "
		      + "having count(*) > 1 order by cnt desc" )
		   List<Map<String, Object>> graph();

}
