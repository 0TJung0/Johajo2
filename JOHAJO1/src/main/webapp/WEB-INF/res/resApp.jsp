<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<food>
	<c:forEach var="fdto" items="${list}">
		<data>
			<idx>${fdto.idx}</idx>
			<fname>${fdto.fname}</fname>
			<calorie>${fdto.calorie}</calorie>
			<imgname>${fdto.imgname}</imgname>
			<count>${fdto.count}</count>
			<price>${fdto.price}</price>
		</data>
	</c:forEach>
</food>