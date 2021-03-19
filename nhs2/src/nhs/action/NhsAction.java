package nhs.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import nhs.model.Nhs;
import nhs.model.NhsDao;

public class NhsAction {
	NhsDao dao = new NhsDao();
	
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column == null || column.trim().equals("")) {
			column = null;
			find = null;
		}
		if(find == null || find.trim().equals("")) {
			column = null;
			find = null;
		}
		int recordcnt = dao.recordcnt(column,find);
		List<Nhs> list = dao.list(column,find);
		request.setAttribute("recordcnt", recordcnt);
		request.setAttribute("list", list);
		return new ActionForward();
	}
}
