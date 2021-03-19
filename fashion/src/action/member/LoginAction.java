package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;

/*
 * 1.�Ķ���Ͱ� ����
2.db�� ������ �о (Member MemberDao.selectOne(id)), 
    ���̵�� ��й�ȣ�� ��.
3.���̵� ���� ���.
     ���̵� �����ϴ�. �޼��� ����� loginForm.jsp������ �̵�
   ��й�ȣ�� Ʋ�� ���
     ��й�ȣ�� Ʋ���ϴ�. �޼��� ����� loginForm.jsp ������ �̵�
   ���̵�,��й�ȣ ��ġ
        session��ü�� �α��� ��������
       -�̸����� �α��� �߽��ϴ�. �޼��� �����, main.jsp������ �̵�
 */
public class LoginAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id= request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = new MemberDao().selectOne(id);
		
		if(mem == null) {
			request.setAttribute("msg", "���̵� Ȯ���ϼ���");
			request.setAttribute("url", "loginForm.me");
		} else {
			if(pass.equals(mem.getPass())) {
				request.getSession().setAttribute("login", id);
				request.getSession().setAttribute("nick", mem.getNick());	
				request.getSession().setAttribute("picture", mem.getPicture());
				request.setAttribute("msg", mem.getNick()+"���� �α��� �߽��ϴ�.");
				request.setAttribute("url", "../board/main.do");
			}else {
				request.setAttribute("msg", "��й�ȣ�� Ʋ���ϴ�.");
				request.setAttribute("url", "loginForm.me");
				
			}
		}
		return new ActionForward(false,"../alert.jsp");
	}

}
