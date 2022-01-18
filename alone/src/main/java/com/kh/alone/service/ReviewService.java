package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.alone.dao.ReviewDao;
import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.ReviewVo;

@Service
public class ReviewService {
	
	@Inject
	private ReviewDao dao;
	
	// 리뷰 전체조회
	public List<ReviewVo> selectReviewList(){
		List<ReviewVo> list = dao.selectReviewList();
		return list;
	}
	
	// 수업과정별 나누기
		public List<ClassInfoVo> selectReviewListByCateCode(int cate_code){
			List<ClassInfoVo> cate_list = dao.selectReviewListByCateCode(cate_code);
			return cate_list;
		}
	
	// 후기 상세보기
	public ReviewVo getReview(int review_number) {
		dao.updateViewcnt(review_number);
		ReviewVo vo = dao.getReview(review_number);
		return vo;
	}
	
	// 후기작성하기
	public void insertReview(ReviewVo vo) {
		int review_number = dao.getReviewNextVal();
		vo.setReview_number(review_number);
		dao.insertReview(vo);
	}
	
	// 후기 수정하기
	public void modifyReview(ReviewVo vo) {
		dao.modifyReview(vo);
	}
	
	// 후기 삭제하기
	public void reviewDelete(int review_number) {
		System.out.println("서비스 리뷰넘버: " + review_number);
		dao.reviewDelete(review_number);
		System.out.println("서비스 삭제후");
	}
}
