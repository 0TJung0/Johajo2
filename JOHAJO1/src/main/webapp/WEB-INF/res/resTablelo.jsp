<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<tablelo>
	<c:forEach var="tdto" items="${list}">
		<data>
			<idx>${tdto.idx}</idx>
			<tbname>${tdto.tbname}</tbname>
			<toplo>${tdto.toplo}</toplo>
			<leftlo>${tdto.leftlo}</leftlo>
			<maxres>${tdto.maxres}</maxres>
		</data>
	</c:forEach>
</tablelo>