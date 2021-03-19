package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class IdAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      //1.�Ķ���� ����.   
      String email = request.getParameter("email");
      String tel = request.getParameter("tel");
      //2.db���� email�� tel�� �̿��Ͽ� id���� ����
      //   id = MemberDao.idSearch(email,tel)
      MemberDao dao = new MemberDao();
      String id = dao.idSearch(email,tel);
      if(id != null) {
         request.setAttribute("id", id);
         return new ActionForward();
      }else {
         String msg = "������ �´� id�� ã�� �� �����ϴ�.";
         String url = "idForm.jsp";
         
         request.setAttribute("url", url);
         request.setAttribute("msg", msg);
         return new ActionForward(false,"../alert.jsp");
      }
   }
   
}