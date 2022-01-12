<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="frmPaging" action="/employ/referenceRoomList" method="get">
	<input type="hidden" name="page" value="${pagingVo.page}">
	<input type="hidden" name="perPage" value="${pagingVo.perPage}">
	<input type="hidden" name="rno">
</form>