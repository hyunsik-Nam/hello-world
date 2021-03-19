package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.Reply;

public interface ReplyMapper {

	@Select("select ifnull(MAX(no),0) from reply")
	int maxnum();

	@Insert("insert into reply"
			+ " (no, content,rdate,nick,btype,num)"
			+ "values (#{no},#{content},now(),#{nick},#{btype},"
			+"#{num})")
	void insert(Reply reply);

	@Select({"<script>",
		"select * from reply",
		"<if test='num != null and btype != null'>where num=#{num} and btype=#{btype}</if>",
		"<if test='num == null and btype != null'> where btype=#{btype}</if>",
		 "<if test='no != null'>order by no desc </if>",
		"</script>"})
List<Reply> select(Map<String, Object> map);

	@Update(" update board set readcnt = (readcnt+1) where num = #{value}")
	Object readcntAdd(int num);

	@Update(" update board set grpstep = grpstep + 1" + "where grp = #{grp} and grpstep > #{grpstep}")
	void grpStepAdd(@Param("grp")int grp, @Param("grpstep")int grpstep);

	@Update(" update reply set content=#{content} where num =#{num} and btype =#{btype} and no=#{no}")
	void update(Reply reply);

	@Delete(" delete from reply where no = #{value}")
	void delete(int no);
	
	@Select({"<script>",
		"select count(*) from reply",
		"<if test='num != null and btype != null'>where num=#{num} and btype=#{btype}</if>",
		"<if test='num == null and btype != null'> where btype=#{btype}</if>",
		"</script>"})
	int replycount(Map<String, Object> map);


}
