<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>

<head>
	<title>건의사항 검색 결과</title>
</head>

<c:forEach items="${findList}" var="InquiryBoardVo">
	<div>
		<h2>제목 : <a href="/inquiry/getBoard?inquiry_title=${InquiryBoardVo.inquiry_title}">${InquiryBoardVo.inquiry_title}</a></h2>
		<h2>내용 : ${InquiryBoardVo.inquiry_content}</h2>
		<h2>게시자 : ${InquiryBoardVo.inquiry_userid}</h2>
		<h2>게시 날짜 : <fmt:formatDate value="${InquiryBoardVo.inquiry_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></h2>
		<h2>조회수 : ${InquiryBoardVo.inquiry_viewcnt}</h2>
		<h2>=======================================================================================================</h2>
	</div>
</c:forEach>

<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>