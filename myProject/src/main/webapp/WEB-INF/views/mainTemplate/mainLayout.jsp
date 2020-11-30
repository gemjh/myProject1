<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">

</head>
<body>
<div id="main">
	<div id="main_header">
		<tiles:insertAttribute name="mainHeader"/>
	</div>
	<div id="main_body">
		<tiles:insertAttribute name="mainBody"/>
	</div>
	<div id="main_footer">
		<tiles:insertAttribute name="mainFooter"/>
	</div>
</div>
</body>
</html>







