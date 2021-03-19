package nhs.model;

import java.util.Date;

public class Nhs {
	private int no;
	private String name;
	private String id;
	private int salary;
	private Date hiredate;
	private String position;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "Nhs [no=" + no + ", name=" + name + ", id=" + id + ", salary=" + salary + ", hiredate=" + hiredate
				+ ", position=" + position + "]";
	}
	
}
