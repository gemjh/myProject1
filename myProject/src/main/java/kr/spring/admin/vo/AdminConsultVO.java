package kr.spring.admin.vo;

import java.sql.Date;

public class AdminConsultVO {
	private int con_num;
	private int mem_num;
	private String con_title;
	private String con_content;
	private String con_answer;
	private int con_completed;
	private Date con_regdate;
	private Date con_answer_regdate;
	public int getCon_num() {
		return con_num;
	}
	public void setCon_num(int con_num) {
		this.con_num = con_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getCon_title() {
		return con_title;
	}
	public void setCon_title(String con_title) {
		this.con_title = con_title;
	}
	public String getCon_content() {
		return con_content;
	}
	public void setCon_content(String con_content) {
		this.con_content = con_content;
	}
	public String getCon_answer() {
		return con_answer;
	}
	public void setCon_answer(String con_answer) {
		this.con_answer = con_answer;
	}
	public int getCon_completed() {
		return con_completed;
	}
	public void setCon_completed(int con_completed) {
		this.con_completed = con_completed;
	}
	public Date getCon_regdate() {
		return con_regdate;
	}
	public void setCon_regdate(Date con_regdate) {
		this.con_regdate = con_regdate;
	}
	public Date getCon_answer_regdate() {
		return con_answer_regdate;
	}
	public void setCon_answer_regdate(Date con_answer_regdate) {
		this.con_answer_regdate = con_answer_regdate;
	}
	@Override
	public String toString() {
		return "AdminConsultVO [con_num=" + con_num + ", mem_num=" + mem_num + ", con_title=" + con_title
				+ ", con_content=" + con_content + ", con_answer=" + con_answer + ", con_completed=" + con_completed
				+ ", con_regdate=" + con_regdate + ", con_answer_regdate=" + con_answer_regdate + "]";
	}
	
	
	
	

}
