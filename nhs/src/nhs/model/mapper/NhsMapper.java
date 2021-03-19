package nhs.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import nhs.model.Nhs;



public interface NhsMapper {
	
	@Select({"<script>",
		"select count(*) from professor",
		"<if test='col1 != null'> where ${col1} like '%${find}%'</if>",
		"<if test='col2 != null'> or ${col2} like '%${find}%'</if>",
		"</script>"})
int recordcnt(Map<String,Object> map);
	
	@Select({"<script>",
		"select * from professor",
		"<if test='col1 != null'> where ${col1} like '%${find}%'</if>",
		"<if test='col2 != null'> or ${col2} like '%${find}%'</if>",
		"</script>"})
List<Nhs> select(Map<String, Object> map);
}
