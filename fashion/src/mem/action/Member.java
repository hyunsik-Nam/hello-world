package mem.action;

public class Member {
	private String id;
	private String pass;
	private String nickname;
	private int height;
	private int weight;
	private int footsize;
	private String picture;
	@Override
	public String toString() {
		return "Member [id=" + id + ", pass=" + pass + ", nickname=" + nickname + ", height=" + height + ", weight="
				+ weight + ", footsize=" + footsize + ", picture=" + picture + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getFootsize() {
		return footsize;
	}
	public void setFootsize(int footsize) {
		this.footsize = footsize;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
}
