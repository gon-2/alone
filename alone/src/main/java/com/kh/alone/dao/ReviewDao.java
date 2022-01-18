package com.kh.alone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.ReviewVo;

@Repository
public class ReviewDao {
	
	private static final String NAMESPACE = "com.kh.alone.mappers.class.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 후기 전체조회
	public List<ReviewVo> selectReviewList(){
		List<ReviewVo> list = sqlSession.selectList(NAMESPACE + "selectReviewList");
		return list;
	}
	
	// 수업과정별 나누기
	public List<ClassInfoVo> selectReviewListByCateCode(int cate_code){
		List<ClassInfoVo> cate_list = sqlSession.selectList(NAMESPACE + "selectReviewListByCateCode", cate_code);
		return cate_list;
	}
	
	// 후기 상세보기
	public ReviewVo getReview(int review_number) {
		ReviewVo vo = sqlSession.selectOne(NAMESPACE + "getReview", review_number);
		return vo;
	}
	
	// 조회수
	public void updateViewcnt(int review_number) {
		sqlSession.update(NAMESPACE + "updateViewcnt", review_number);
	}
	
	// 리뷰 작성하기
	public void insertReview(ReviewVo vo) {
		sqlSession.insert(NAMESPACE + "insertReview", vo);
	}
	
	public int getReviewNextVal() {
		int review_number = sqlSession.selectOne(NAMESPACE + "getReviewNextVal");
		return review_number;
	}
	
	// 후기 수정하기
	public void modifyReview(ReviewVo vo) {
		sqlSession.update(NAMESPACE + "modifyReview", vo);
	}
	
	// 후기 삭제하기
	public void reviewDelete(int review_number) {
		System.out.println("다오 리뷰넘버: " + review_number);
		sqlSession.delete(NAMESPACE + "reviewDelete", review_number);
		System.out.println("다오 삭제후");
	}
}
