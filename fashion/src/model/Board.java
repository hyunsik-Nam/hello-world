package model;

import java.util.Date;

//Bean Å¬·¡½º
public class Board {
   private int num;
   private int btype;
   private String subject;
   private String content;
   private String picture;
   private Date bdate;
   private int readcnt;
   private String nick;
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public int getBtype() {
	return btype;
}
public void setBtype(int btype) {
	this.btype = btype;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getPicture() {
	return picture;
}
public void setPicture(String picture) {
	this.picture = picture;
}
public Date getBdate() {
	return bdate;
}
public void setBdate(Date bdate) {
	this.bdate = bdate;
}
public int getReadcnt() {
	return readcnt;
}
public void setReadcnt(int readcnt) {
	this.readcnt = readcnt;
}
public String getNick() {
	return nick;
}
public void setNick(String nick) {
	this.nick = nick;
}
@Override
public String toString() {
	return "Board [num=" + num + ", btype=" + btype + ", subject=" + subject + ", content=" + content + ", picture="
			+ picture + ", bdate=" + bdate + ", readcnt=" + readcnt + ", nick=" + nick + "]";
}  
   
}