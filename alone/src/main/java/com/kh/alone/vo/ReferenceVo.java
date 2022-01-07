package com.kh.alone.vo;

public class ReferenceVo {
	private int rno;
	private String rtitle;
	private String rwriter;
	private int recommend;
	private int hits;
	private String reference_date;
	private String reference_time;
	private String r_fail;
	private String r_images;
	private String r_content;
	private int re_group;
	private int re_seq;
	private int re_level;
	
	public ReferenceVo() {
		super();
	}

	public ReferenceVo(int rno, String rtitle, String rwriter, int recommend, int hits, String reference_date,
			String reference_time, String r_fail, String r_images, String r_content, int re_group, int re_seq,
			int re_level) {
		super();
		this.rno = rno;
		this.rtitle = rtitle;
		this.rwriter = rwriter;
		this.recommend = recommend;
		this.hits = hits;
		this.reference_date = reference_date;
		this.reference_time = reference_time;
		this.r_fail = r_fail;
		this.r_images = r_images;
		this.r_content = r_content;
		this.re_group = re_group;
		this.re_seq = re_seq;
		this.re_level = re_level;
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

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
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

	public String getR_fail() {
		return r_fail;
	}

	public void setR_fail(String r_fail) {
		this.r_fail = r_fail;
	}

	public String getR_images() {
		return r_images;
	}

	public void setR_images(String r_images) {
		this.r_images = r_images;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public int getRe_group() {
		return re_group;
	}

	public void setRe_group(int re_group) {
		this.re_group = re_group;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	@Override
	public String toString() {
		return "ReferenceVo [rno=" + rno + ", rtitle=" + rtitle + ", rwriter=" + rwriter + ", recommend=" + recommend
				+ ", hits=" + hits + ", reference_date=" + reference_date + ", reference_time=" + reference_time
				+ ", r_fail=" + r_fail + ", r_images=" + r_images + ", r_content=" + r_content + ", re_group="
				+ re_group + ", re_seq=" + re_seq + ", re_level=" + re_level + "]";
	}
}
