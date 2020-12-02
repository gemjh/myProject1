package kr.spring.musinfo.vo;

import java.sql.Date;

public class InfoPageVO {
	private int rev_num;
	private int mem_num;
	private int mus_num; 
	private byte[] mem_image;
	private double rev_rate;
	private String review;
	private String nickname;
	private Date rev_regdate;
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getMus_num() {
		return mus_num;
	}
	public void setMus_num(int mus_num) {
		this.mus_num = mus_num;
	}
	public byte[] getMem_image() {
		return mem_image;
	}
	public void setMem_image(byte[] mem_image) {
		this.mem_image = mem_image;
	}
	public double getRev_rate() {
		return rev_rate;
	}
	public void setRev_rate(double rev_rate) {
		this.rev_rate = rev_rate;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getRev_regdate() {
		return rev_regdate;
	}
	public void setRev_regdate(Date rev_regdate) {
		this.rev_regdate = rev_regdate;
	}
	@Override
	public String toString() {
		return "InfoPageVO [rev_num=" + rev_num + ", mem_num=" + mem_num + ", mus_num=" + mus_num + ", rev_rate="
				+ rev_rate + ", review=" + review + ", nickname=" + nickname + ", rev_regdate=" + rev_regdate + "]";
	}
}
