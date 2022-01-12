<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<form id="frmPaging" action="/inquiry/listall">
	<input type="hidden" name="page" value="${dto.page}">
	<input type="hidden" name="perPage" value="${dto.perPage}">
	<input type="hidden" name="searchType" value="${dto.searchType}">
	<input type="hidden" name="keyword" value="${dto.keyword}">
	<input type="hidden" name="bno">			
</form>
