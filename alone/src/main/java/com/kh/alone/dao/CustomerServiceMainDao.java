/*
 * 2021-01-12
 * Author : 이정훈
 * code Explanation : 메인 홈페이지 Dao
 */

package com.kh.alone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.InquiryBoardVo;
import com.kh.alone.vo.RegistBoardVo;

@Repository
public class CustomerServiceMainDao {
	
	private static final String NAMESPACE = "com.kh.alone.mappers.customer.";
	
	@Inject
	private SqlSession session;
	
	// 	메인홈페이지의 수강신청 - 최신 게시글 3개만 조회 ( 고객센터 메인 홈페이지에 보일 것! ) 
	public List<RegistBoardVo> classRecent(){
		List<RegistBoardVo> countlist = session.selectList(NAMESPACE + "classRecent");
		System.out.println("ClassRegistBoardDao, countThree, countlist: " + countlist);
		return countlist;
	}
	
	//	메인홈페이지의 자주 묻는 질문 - 수강신청 , 최신 자주묻는 질문 3개의 글만 조회 ( 조회수는 10 이상 ) 
	public List<RegistBoardVo> classRegThird(){
		List<RegistBoardVo> thirdlist = session.selectList(NAMESPACE + "classRegThird");
		System.out.println("ClassRegistBoardDao , classRegThird, thirdlist: " + thirdlist);
		return thirdlist;
	}
	
	//  메인홈페이지의 건의사항 - 건의사항 게시판의 3개의 최신 게시글 조회
	public List<InquiryBoardVo> inquiryThird(){
		List<InquiryBoardVo> inquiryThirdList = session.selectList(NAMESPACE + "inquiryThird");
		System.out.println("ClassRegistBoardDao , inquiryThird , inquiryThirdList: " + inquiryThirdList);
		return inquiryThirdList;
	}
	
	//	메인홈페이지의 자주 묻는 질문 - 건의사항 , 최신 자주묻는 질문 3개의 글만 조회 ( 조회수는 10 이상 )
	public List<InquiryBoardVo> inquiryRecent(){
		List<InquiryBoardVo> inquiryRecentList = session.selectList(NAMESPACE + "inquiryRecent");
		return inquiryRecentList;
	}

}
