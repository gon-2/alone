package com.kh.alone.vo;

public class ReferenceVo {
	private int rno;
	private String rtitle;
	private String rwriter;
	private String recommend;
	private int hits;
	private String reference_date;
	private String reference_time;
	private String r_fail;
	
	public ReferenceVo() {
		super();
	}
	
	public ReferenceVo(int rno, String rtitle, String rwriter, String recommend, int hits, String reference_date,
			String reference_time, String r_fail) {
		super();
		this.rno = rno;
		this.rtitle = rtitle;
		this.rwriter = rwriter;
		this.recommend = recommend;
		this.hits = hits;
		this.reference_date = reference_date;
		this.reference_time = reference_time;
		this.r_fail = r_fail;
	}
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getReference_date() {
		return reference_date;
	}
	public void setReference_date(String reference_date) {
		this.reference_date = reference_date;
	}
	public String getReference_time() {
		return reference_time;
	}
	public void setReference_time(String reference_time) {
		this.reference_time = reference_time;
	}
	public String getFail() {
		return r_fail;
	}
	public void setFail(String r_fail) {
		this.r_fail = r_fail;
	}

	@Override
	public String toString() {
		return "ReferenceVo [rno=" + rno + ", rtitle=" + rtitle + ", rwriter=" + rwriter + ", recommend=" + recommend
				+ ", hits=" + hits + ", reference_date=" + reference_date + ", reference_time=" + reference_time
				+ ", r_fail=" + r_fail + "]";
	}
}
