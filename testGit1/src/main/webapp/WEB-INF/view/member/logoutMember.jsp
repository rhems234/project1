﻿<%@ page contentType="text/html; charset=utf-8"%>

<%
	session.invalidate();
	response.sendRedirect("/TeamProject/home.jsp");
%>