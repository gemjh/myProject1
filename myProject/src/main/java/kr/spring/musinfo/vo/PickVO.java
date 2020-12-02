package kr.spring.musinfo.vo;

//import javax.validation.constraints.NotEmpty;

public class PickVO {
	private int pick_num;
	private int mem_num;
	private int rev_num;
	

	public int getPick_num() {
		return pick_num;
	}
	public void setPick_num(int pick_num) {
		this.pick_num = pick_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}

	
	
	@Override
	public String toString() {
		return "PickVO [pick_num=" + pick_num + ", mem_num=" + mem_num + ", rev_num=" + rev_num + ", pick_check=" + "]";
	}
	
	
}
