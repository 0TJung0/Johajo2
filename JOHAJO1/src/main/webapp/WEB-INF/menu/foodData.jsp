<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<menu>
	<c:forEach var="dto" items="${list}">
		<data>
			<idx>${dto.idx}</idx>
			<aname>${dto.aname}</aname>
			<f>${dto.f}</f>
		</data>
	</c:forEach>
</menu>