package spring.data;

import java.sql.Timestamp;

public class QnaDto {
	private int idx;
	private int anw; //질문 0, 답변0
	private String selection; //질문카테고리
	private String title;
	private String content;
	private int mem_f; //글쓴idx
	private Timestamp writeday;
	private int grp;
	private int stp;
	private int lv;
	
	private String content2;
	private Timestamp anwday;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getAnw() {
		return anw;
	}
	public void setAnw(int anw) {
		this.anw = anw;
	}
	
	public String getSelection() {
		return selection;
	}
	public void setSelection(String selection) {
		this.selection = selection;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public int getMem_f() {
		return mem_f;
	}
	public void setMem_f(int mem_f) {
		this.mem_f = mem_f;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public int getGrp() {
		return grp;
	}
	public void setGrp(int grp) {
		this.grp = grp;
	}
	public int getStp() {
		return stp;
	}
	public void setStp(int stp) {
		this.stp = stp;
	}
	public int getLv() {
		return lv;
	}
	public void setLv(int lv) {
		this.lv = lv;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public Timestamp getAnwday() {
		return anwday;
	}
	public void setAnwday(Timestamp anwday) {
		this.anwday = anwday;
	}
	
	
	
	
	
}
