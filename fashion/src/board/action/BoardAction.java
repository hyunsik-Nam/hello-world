package board.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;
import model.Reply;
import model.ReplyDao;

public class BoardAction {
	BoardDao dao = new BoardDao();
	ReplyDao rdao = new ReplyDao();
	/*
	 * 1. �Ķ���� ���� model.Board ��ü ����. MultipartRequest ��ü ���. 2. �Խù� ��ȣ num ���� ��ϵ�
	 * num�� �ִ밪�� ��ȸ. �ִ밪+1 ��ϵ� �Խù��� ��ȣ. db���� maxnum �� ���ؼ� +1 ������ num �����ϱ� 3. board
	 * ������ db�� ������ �̵� ��ϼ��� : list.don ������ �̵� ��Ͻ��� : �޼��� ���. writeForm.do ������ �̵�
	 */

	public ActionForward write(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "board/file/";
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			Board board = new Board();
			board.setBtype(Integer.parseInt(multi.getParameter("btype")));
			board.setNick(multi.getParameter("nick"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setPicture(multi.getFilesystemName("picture"));
			BoardDao dao = new BoardDao();

			// board table���� num �÷��� �ִ밪 ����. �ִ밪�� ���� ��� 0���� ����
			int num = dao.maxnum();
			board.setNum(++num);
			if (dao.insert(board)) {
				return new ActionForward(true, "list.do?btype="+board.getBtype());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", "�Խù� ��� ����");
		request.setAttribute("url", "writeForm.jsp");
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward reply(HttpServletRequest request, HttpServletResponse response) {
		Reply r = new Reply();
		r.setNum(Integer.parseInt(request.getParameter("num")));
		r.setBtype(Integer.parseInt(request.getParameter("btype")));
		r.setNick(request.getParameter("nick"));
		r.setContent(request.getParameter("content"));
		
		
		int num = rdao.maxnum();// �ִ� num�� ��ȸ
		String msg = "�亯��Ͻ� �����߻�";
		String url = "info.do?num="+r.getNum()+"&btype="+r.getBtype();
		r.setNo(++num);
		if (rdao.insert(r)) {
			msg = "��۵�� �Ϸ�";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	/*
	 * 1.�� ������ �� 10���� �Խù��� ����ϱ�. pageNum �Ķ���Ͱ��� ���� => ���� ���� 1�� �����ϱ�. 2. �ֱ� ��ϵ� �Խù���
	 * ���� ������ ��ġ��. 3. db���� �ش� �������� ��µ� ������ ��ȸ�Ͽ� ȭ�鿡 ���. �Խù��� ��ºκ�. ������ ���� ��� �κ�
	 * 
	 * 20201123 ���� 1. ÷�������� �ִ� ��� @ǥ���ϱ� 2. ���� ��ϵ� �Խù��� �� :��:�ʷ� ����ϰ� ���� ��ϵ� �Խù��� �ƴ�
	 * ���� ��-��-�� ��:�� ���� ��� 3. ����� ��� �鿩����. ������-6 4. �������� ��ȸ��ȣ�� ��µǵ��� �����ϱ�
	 */
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
		int limit = 10;
		int btype=Integer.parseInt(request.getParameter("btype"));
		int boardcount = dao.boardCount(column,find,btype);
		List<Board> list = dao.list(pageNum, limit,column,find,btype);
		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		int boardnum = boardcount - (pageNum - 1) * limit;
			
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sf.format(new Date());
			request.setAttribute("boardcount", boardcount);
			request.setAttribute("list", list);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("maxpage", maxpage);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			request.setAttribute("boardnum", boardnum);
			request.setAttribute("today", today);
		
		return new ActionForward();
	}
	
	public ActionForward list1(HttpServletRequest request, HttpServletResponse response) {
		int pageNum1 = 1;
		int pageNum2 = 1;
		int pageNum3 = 1;
		try {
			pageNum1 = Integer.parseInt(request.getParameter("pageNum1"));
			pageNum2 = Integer.parseInt(request.getParameter("pageNum2"));
		} catch (NumberFormatException e) {
		}
		int limit = 10;
		int boardcount1 = dao.list1Count(1);
		int boardcount2	= dao.list1Count(2);
		int boardcount3	= dao.list1Count(3);
		List<Board> list1 = dao.list1(pageNum1,limit,1); //�������� ���
		List<Board> list2 = dao.list1(pageNum2,limit,2); //�Խ��� ���
		List<Board> list3 = dao.list1(pageNum3,limit,3); //�Խ��� ���
		int maxpage1 = (int) ((double) boardcount1 / limit + 0.95);
		int maxpage2 = (int) ((double) boardcount2 / limit + 0.95);
		int maxpage3 = (int) ((double) boardcount3 / limit + 0.95);
		int startpage1 = ((int) (pageNum1 / 10.0 + 0.9) - 1) * 10 + 1;
		int startpage2 = ((int) (pageNum2 / 10.0 + 0.9) - 1) * 10 + 1;
		int startpage3 = ((int) (pageNum3 / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage1 = startpage1 + 9;
		int endpage2 = startpage2 + 9;
		int endpage3 = startpage3 + 9;
		if (endpage1 > maxpage1)
			endpage1 = maxpage1;
		
		if (endpage2 > maxpage2)
			endpage2 = maxpage2;
		
		if (endpage3 > maxpage3)
			endpage3 = maxpage3;
		
		int boardnum1 = boardcount1 - (pageNum1 - 1) * limit;
		int boardnum2 = boardcount2 - (pageNum2 - 1) * limit;
		int boardnum3 = boardcount3 - (pageNum3 - 1) * limit;
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		request.setAttribute("boardcount1", boardcount1);
		request.setAttribute("boardcount2", boardcount2);
		request.setAttribute("boardcount3", boardcount3);
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("pageNum1", pageNum1);
		request.setAttribute("pageNum2", pageNum2);
		request.setAttribute("pageNum3", pageNum3);
		request.setAttribute("maxpage1", maxpage1);
		request.setAttribute("maxpage2", maxpage2);
		request.setAttribute("maxpage3", maxpage3);
		request.setAttribute("startpage1", startpage1);
		request.setAttribute("startpage2", startpage2);
		request.setAttribute("startpage3", startpage3);
		request.setAttribute("endpage1", endpage1);
		request.setAttribute("endpage2", endpage2);
		request.setAttribute("endpage3", endpage3);
		request.setAttribute("boardnum1", boardnum1);
		request.setAttribute("boardnum2", boardnum2);
		request.setAttribute("boardnum3", boardnum3);
		request.setAttribute("today", today);
		return new ActionForward();
	}
	

	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		int btype = Integer.parseInt(request.getParameter("btype"));
		List<Reply> rlist1 = rdao.rlist1(num,btype); //�������� ���
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		request.setAttribute("rlist1", rlist1);
		request.setAttribute("today", today);
		Board b = dao.selectOne(num,btype);
		dao.readcntAdd(num);
		request.setAttribute("b", b);
		return new ActionForward();
	}
	public ActionForward replyForm(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt((request.getParameter("num")));
		int btype = Integer.parseInt((request.getParameter("btype")));
		Board b = dao.selectOne(num,btype);
		request.setAttribute("b", b);
		return new ActionForward();
	}

	

	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		String msg = null;
		String url = null;
		try {
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			board.setNum(Integer.parseInt(multi.getParameter("num")));
			board.setBtype(Integer.parseInt(multi.getParameter("btype")));
			board.setNick(multi.getParameter("nick"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setPicture(multi.getFilesystemName("picture"));
			BoardDao dao = new BoardDao();
			Board dbboard = dao.selectOne(board.getNum(),board.getBtype());
			url = "updateForm.do?num=" + board.getNum()+"&btype="+board.getBtype();
			
				if (dao.update(board)) {
					msg = "�Խù� ���� �Ϸ�";
					url = "info.do?num=" + board.getNum()+"&btype="+board.getBtype();
				} else {
					msg = "�Խù� ���� ����";
				}

		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward rupdate(HttpServletRequest request, HttpServletResponse response) {
		Reply r = new Reply();
		String msg = null;
		r.setNum(Integer.parseInt(request.getParameter("num")));
		r.setBtype(Integer.parseInt(request.getParameter("btype")));
		r.setNo(Integer.parseInt(request.getParameter("no")));
		r.setNick(request.getParameter("nick"));
		r.setContent(request.getParameter("content"));
		String url = "info.do?num="+r.getNum()+"&btype="+r.getBtype();
			ReplyDao dao = new ReplyDao();
			Reply dbreply = rdao.selectOne(r.getNum(),r.getBtype());
			
			
			if (dao.update(r)) {
				msg = "��� ���� �Ϸ�";
			} else {
				msg = "��� ���� ����";
			}
			
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
	      int num = Integer.parseInt(request.getParameter("num"));
	      int btype = Integer.parseInt(request.getParameter("btype"));  
	      BoardDao dao = new BoardDao();
	      Board dbBoard = dao.selectOne(num,btype);
	      String msg = null;
	      String url = "deleteForm.jsp?num="+ num+"&btype="+btype;
	      try {
	      // �Խù��� ��й�ȣ�� Ʋ���� ���
	      if (dbBoard == null) {// deleteForm�� pass�Ķ���� ���� db�� �Ķ���Ͱ��� ��
	         msg = "���� �Խñ� �Դϴ�.";
	         url = "list.do?btype="+btype;
	      } else {
	        
	            if (dao.delete(num)) {
	               msg = "�Խñ� ���� ����.";
	               url = "list.do?btype="+btype;
	            } else {
	               msg = "�Խñ� ���� ����.";
	               url = "info.do?num" + num;
	            }
	         
	      }
       }catch(Exception e) {
	    	  e.printStackTrace();
	      }
	      request.setAttribute("msg", msg);
	      request.setAttribute("url", url);
	      return new ActionForward(false, "../alert.jsp");
	   }
	public ActionForward rdelete(HttpServletRequest request, HttpServletResponse response) {
	      int num = Integer.parseInt(request.getParameter("num"));
	      int btype = Integer.parseInt(request.getParameter("btype"));
	      int no = Integer.parseInt(request.getParameter("no"));
	      ReplyDao dao = new ReplyDao();
	      Reply dbReply = rdao.selectOne(num,btype);
	      String msg = null;
	      String url = "info.do?num="+num+"&btype="+btype;
	      try {
	      // �Խù��� ��й�ȣ�� Ʋ���� ���
	      if (dbReply == null) {// deleteForm�� pass�Ķ���� ���� db�� �Ķ���Ͱ��� ��
	         msg = "���� �Խñ� �Դϴ�.";
	      } else {
	        
	            if (dao.delete(no)) {
	               msg = "��� ���� ����.";
	            } else {
	               msg = "��� ���� ����.";
	            }
	         
	      }
     }catch(Exception e) {
	    	  e.printStackTrace();
	      }
	      request.setAttribute("msg", msg);
	      request.setAttribute("url", url);
	      return new ActionForward(false, "../alert.jsp");
	   }
	
	public ActionForward imgupload
	(HttpServletRequest request, HttpServletResponse response) 
				throws IOException{
		String path = request.getServletContext().getRealPath("/")
									+"board/imgfile/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		MultipartRequest multi = new MultipartRequest
				(request, path, 10 * 1024 * 1024,"euc-kr");
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum",request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false,"ckeditor.jsp");
	}
}