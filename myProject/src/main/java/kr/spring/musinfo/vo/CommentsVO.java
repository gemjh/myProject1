package kr.spring.musinfo.vo;

import java.sql.Date;

public class CommentsVO {
	private int mem_num;
	private String mem_name;
	private int email;
	private int nickname;
	private String passwd;
	private Date birth;
	private String phone;
	private Date mem_regdate;
	private Date mem_modifydate;
	private int Auth;
	private int rev_num;
	private String review;
	private Date rev_regDate;
	
	
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getEmail() {
		return email;
	}
	public void setEmail(int email) {
		this.email = email;
	}
	public int getNickname() {
		return nickname;
	}
	public void setNickname(int nickname) {
		this.nickname = nickname;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(Date mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	public Date getMem_modifydate() {
		return mem_modifydate;
	}
	public void setMem_modifydate(Date mem_modifydate) {
		this.mem_modifydate = mem_modifydate;
	}
	public int getAuth() {
		return Auth;
	}
	public void setAuth(int auth) {
		Auth = auth;
	}
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Date getRev_regDate() {
		return rev_regDate;
	}
	public void setRev_regDate(Date rev_regDate) {
		this.rev_regDate = rev_regDate;
	}
}
