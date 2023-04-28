<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	request.setCharacterEncoding("UTF-8");

	String sessionId = (String) session.getAttribute("sessionId");
	String adult = request.getParameter("adult");
	String child = request.getParameter("child");
	String title = request.getParameter("title");

%>

<sql:setDataSource var="dataSource"
	url="jdbc:log4jdbc:oracle:thin:@localhost:1521:XE"
	driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy" user="culture" password="culture" />

<sql:update dataSource="${dataSource}" var="resultSet">
    INSERT INTO BUY (ID, ADULT, CHILD, TITLE) VALUES(?, ?, ?, ?)
    <sql:param value="<%=sessionId%>"/>
    <sql:param value="<%=adult%>"/>
    <sql:param value="<%=child%>"/>
    <sql:param value="<%=title%>"/>
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultbuy.jsp?msg=0" />
</c:if>