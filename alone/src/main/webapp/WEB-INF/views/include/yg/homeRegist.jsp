<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="homeRegist" action="/classInfo/homeRegist" method="get">
	<input type="hidden" name="time_code" value="${ClassInfoVo.time_code}">
	<input type="hidden" name="c_title" value="${ClassInfoVo.c_title}">
	<input type="hidden" name="cate_code" value="${ClassInfoVo.cate_code}">
</form>