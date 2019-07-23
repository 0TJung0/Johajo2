package spring.data;

public class TableDto {
	private int idx;
	private String tbname;
	private int toplo;
	private int leftlo;
	private int maxres;
	private int f;//store테이블 지점을 참조하는 변수
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getTbname() {
		return tbname;
	}
	public void setTbname(String tbname) {
		this.tbname = tbname;
	}
	public int getToplo() {
		return toplo;
	}
	public void setToplo(int toplo) {
		this.toplo = toplo;
	}
	public int getLeftlo() {
		return leftlo;
	}
	public void setLeftlo(int leftlo) {
		this.leftlo = leftlo;
	}
	public int getMaxres() {
		return maxres;
	}
	public void setMaxres(int maxres) {
		this.maxres = maxres;
	}
	public int getF() {
		return f;
	}
	public void setF(int f) {
		this.f = f;
	}
	
	
	
}
