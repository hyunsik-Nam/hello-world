package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;



public abstract class UserLoginAction implements Action{
	protected String login;
	protected String id;
	protected String picture;
	protected String nick;
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		login = (String)request.getSession().getAttribute("login");
		picture = (String)request.getSession().getAttribute("picture");
		nick = (String)request.getSession().getAttribute("nick");
		id = request.getParameter("id");
		if(login == null) {
			request.setAttribute("msg", "로그인 후 거래하세요");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false,"../alert.jsp");
		}
		if(id != null && !id.equals(login) && !login.equals("admin")) {
			request.setAttribute("msg", "본인만 거래 가능합니다.");
			request.setAttribute("url", "../board/main.do");
			return new ActionForward(false,"../alert.jsp");
		}
		return doExecute(request,response);
	}
	public abstract ActionForward doExecute(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
