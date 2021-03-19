package action.member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class PwAction implements Action {
   
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      //2.db에서 id,email, tel을 이용하여 pw값을 리턴
      String id = request.getParameter("id");
      String email = request.getParameter("email");
      String tel = request.getParameter("tel");
      
      MemberDao dao = new MemberDao();
      //2.db에서 id,email, tel을 이용하여 pw값을 리턴
      String pw = dao.pwSearch(id, email, tel);
      if(pw != null) {
         request.setAttribute("pw", pw);
         return new ActionForward();

      }else {
      String msg = "정보에 맞는 pw를 찾을 수 없습니다.";
      String url = "pwForm.me";
      
      request.setAttribute("url", url);
      request.setAttribute("msg", msg);
      return new ActionForward(false,"../alert.jsp");
      }
   }
}