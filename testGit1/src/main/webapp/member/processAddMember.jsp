<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameterValues("mail2")[0];
	String mail = mail1 + "@" + mail2;
	String nickname = request.getParameter("nickname");

%>

<sql:setDataSource var="dataSource"
	url="jdbc:log4jdbc:oracle:thin:@localhost:1521:XE"
	driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy" user="culture" password="culture" />

<sql:update dataSource="${dataSource}" var="resultSet">
   	INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?)
    <sql:param value="<%=id%>"/>
	<sql:param value="<%=password%>"/>
	<sql:param value="<%=name%>"/>
	<sql:param value="<%=mail%>"/>
	<sql:param value="<%=nickname%>"/>
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultMember.jsp?msg=1" />
</c:if>