<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<faq>
	<c:set var="KindCount" value="${KindCount }"/>
	<c:forEach var="dto" items="${list}" varStatus="index">	
		<data>
			<KindCount>${KindCount}</KindCount>
			<index>${index.index }</index>
			<count>${index.count }</count>
			<idx>${dto.idx}</idx>
			<title>${dto.title }</title>
			<contents>${dto.contents }</contents>
			<writeday><fmt:formatDate value="${dto.writeday }"/></writeday>
			<hide>${dto.hide }</hide>
		</data>
	</c:forEach>
</faq>

