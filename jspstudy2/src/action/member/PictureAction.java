package action.member;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.Action;
import action.ActionForward;

/*
 *  1. �̹������� ���ε�. request ��ü ��� �Ұ�
 *  	�̹������� ���ε��� ��ġ: ���� ����/picture ������ ����
 *  2. �̹��������� 3����1 ũ���� �������̹��� ����. �̸��� sm_�����̸����� ����
 */
public class PictureAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("")+"model2/member/picture/";
	      String fname = null;
	      File f = new File(path);
	      //path�� ������ ������ ���� ��� ���� ����
	      if (!f.exists()) {f.mkdirs();}
	      //request : ������ ���� �̸� �� �������.
	      MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "EUC-KR");
	      //���ε�� ������ �̸�
	      fname = multi.getFilesystemName("picture");//�Ķ���� �̸��� ���ƾ���.
	      //new File(path+fname) : ���ε�� ���� �̹��� ����
	      //bi : �޸𸮿� �̹��� ����
	      BufferedImage bi = ImageIO.read(new File(path + fname));
	      int width = bi.getWidth() / 3;
	      int height = bi.getHeight() / 3;
	      //������ �̹����� �׸��� ���� ��ȭ��
	      BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	      //g : �׸��� ����
	      Graphics2D g = thumb.createGraphics();
	      g.drawImage(bi, 0, 0, width, height, null);
	      //f : ������ �̹��� ������ ���� ���� ����
	      f = new File(path + "sm_" + fname);
	      ImageIO.write(thumb, "jpg", f); //thumb�̹����� f���Ϸ� ����
	      request.setAttribute("fname", fname);
		return new ActionForward();
	}
	
}
