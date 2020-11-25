package kr.spring.musinfo.vo;

import java.sql.Date;

public class ContentsVO {
	private int mus_num;
	private String mus_name;
	private int gen_num;
	private int mus_age;
	private String mus_actor;
	private int mus_time;
	private String mus_video;
	private int mus_rate;
	private String mus_post;
	private String mus_detail;
	private String mus_summary;
	private Date mus_regdate;
	
	
	
	public int getMus_num() {
		return mus_num;
	}
	public void setMus_num(int mus_num) {
		this.mus_num = mus_num;
	}
	public String getMus_name() {
		return mus_name;
	}
	public void setMus_name(String mus_name) {
		this.mus_name = mus_name;
	}
	public int getGen_num() {
		return gen_num;
	}
	public void setGen_num(int gen_num) {
		this.gen_num = gen_num;
	}
	public int getMus_age() {
		return mus_age;
	}
	public void setMus_age(int mus_age) {
		this.mus_age = mus_age;
	}
	public String getMus_actor() {
		return mus_actor;
	}
	public void setMus_actor(String mus_actor) {
		this.mus_actor = mus_actor;
	}
	public int getMus_time() {
		return mus_time;
	}
	public void setMus_time(int mus_time) {
		this.mus_time = mus_time;
	}
	public String getMus_video() {
		return mus_video;
	}
	public void setMus_video(String mus_video) {
		this.mus_video = mus_video;
	}
	public int getMus_rate() {
		return mus_rate;
	}
	public void setMus_rate(int mus_rate) {
		this.mus_rate = mus_rate;
	}
	public String getMus_post() {
		return mus_post;
	}
	public void setMus_post(String mus_post) {
		this.mus_post = mus_post;
	}
	public String getMus_detail() {
		return mus_detail;
	}
	public void setMus_detail(String mus_detail) {
		this.mus_detail = mus_detail;
	}
	public String getMus_summary() {
		return mus_summary;
	}
	public void setMus_summary(String mus_summary) {
		this.mus_summary = mus_summary;
	}
	public Date getMus_regdate() {
		return mus_regdate;
	}
	public void setMus_regdate(Date mus_regdate) {
		this.mus_regdate = mus_regdate;
	}
	@Override
	public String toString() {
		return "ContentsVO [mus_num=" + mus_num + ", mus_name=" + mus_name + ", gen_num=" + gen_num + ", mus_age="
				+ mus_age + ", mus_actor=" + mus_actor + ", mus_time=" + mus_time + ", mus_video=" + mus_video
				+ ", mus_rate=" + mus_rate + ", mus_post=" + mus_post + ", mus_detail=" + mus_detail + ", mus_summary="
				+ mus_summary + ", mus_regdate=" + mus_regdate + "]";
	}
}
