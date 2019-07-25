<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<store>
	<c:set var="sdto" value="${dto}"/>
		<data>
			<idx>${sdto.idx}</idx>
			<name>${sdto.name}</name>
			<phone>${sdto.phone}</phone>
			<ohours>${sdto.ohours}</ohours>
			<service>${sdto.service}</service>
			<xpoint>${sdto.xpoint}</xpoint>
			<ypoint>${sdto.ypoint}</ypoint>
			<addr>${sdto.addr}</addr>
			<photo>${sdto.photo}</photo>
		</data>
</store>