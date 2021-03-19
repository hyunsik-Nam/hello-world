package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

/*
 * 1. �α׾ƿ� ����: �α����� �ʿ��մϴ� �޽��� ���, loginForm.me ������ �̵�
 * 2. �α��� ����: �Ϲ� ����� - �����ڸ� ������ �ŷ��Դϴ� �޽��� ���, main.me ������ �̵�
 * 3. ������ �α��� ����: doExecute() �޼ҵ� ȣ��
 */

public abstract class AdminLoginAction implements Action {
   protected String login;
   protected String nick;
   protected String picture;

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      login = (String) request.getSession().getAttribute("login");
      nick = (String) request.getSession().getAttribute("nick");
      picture = (String) request.getSession().getAttribute("picture");
      if (login == null) {
         request.setAttribute("msg", "�α����� �ʿ��մϴ�.");
         request.setAttribute("url", "loginForm.me");
         return new ActionForward(false, "../alert.jsp");
      } else if (!login.contentEquals("admin")) {
         request.setAttribute("msg", "�����ڸ� ������ �ŷ��Դϴ�.");
         request.setAttribute("url", "../board/main.do");
         return new ActionForward(false, "../alert.jsp");
      } else // �����ڷ� �α���
         return doExecute(request, response);
   }
   protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response);
}