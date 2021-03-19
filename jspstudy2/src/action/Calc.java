package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Calc implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num1=Integer.parseInt(request.getParameter("num1"));
		String op = request.getParameter("op");
		int num2=Integer.parseInt(request.getParameter("num2"));
		switch(op) {
		case "+":request.setAttribute("result", num1+num2);break;
		case "-":request.setAttribute("result", num1-num2);break;
		case "*":request.setAttribute("result", num1*num2);break;
		case "/":request.setAttribute("result", num1/num2);break;
		}
		
		return new ActionForward(false,"calc.jsp");
	}

}
