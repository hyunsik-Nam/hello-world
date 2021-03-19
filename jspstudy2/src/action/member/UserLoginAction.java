package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

/*
 * �α��� �� ��� : doExecute ȣ��
 * �α׾ƿ� �� ��� : �α��� �ϼ���.
 * id �Ķ���Ͱ� �����ϴ� ��� : �α��� ����, �Ķ���� ������ ���Ͽ�
 * 						�����ڰ� �ƴϸ鼭, �ٸ� ���
 * 						���������� �ŷ����� �޼��� ���, main.me ������ �̵�.
 */

public abstract class UserLoginAction implements Action{
	protected String login;
	protected String id;
	protected String picture;
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		login = (String)request.getSession().getAttribute("login");
		id = request.getParameter("id");
		picture = (String)request.getSession().getAttribute("picture");
		if(login == null) {
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false,"../alert.jsp");
		}
		if(id != null && !id.equals(login) && !login.equals("admin")) {
			request.setAttribute("msg", "���θ� �ŷ� �����մϴ�.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"../alert.jsp");
		}
		return doExecute(request,response);
	}
	public abstract ActionForward doExecute(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
