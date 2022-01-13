<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>

<head>
	<title>수강신청 검색 결과</title>
</head>

<c:forEach items="${findList}" var="RegistBoardVo">
	<div>
		<h2>제목 : <a href="/class_board/getBoard?class_board_title=${RegistBoardVo.class_board_title}">${RegistBoardVo.class_board_title}</a></h2>
		<h2>내용 : ${RegistBoardVo.class_board_content}</h2>
		<h2>수강과정 : ${RegistBoardVo.class_board_enroll}</h2>
		<h2>게시자 : ${RegistBoardVo.class_board_userid}</h2>
		<h2>게시 날짜 : <fmt:formatDate value="${RegistBoardVo.class_board_postdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></h2>
		<h2>조회수 : ${RegistBoardVo.class_board_viewcnt}</h2>
		<h2>=======================================================================================================</h2>
	</div>
</c:forEach>

<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>