<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <%@include file="head.jsp" %>
</head>
<body>
<header class="header--form-page">
    <%@include file="header_logged.jsp" %>
    <div class="slogan container container--90">
        <h2>
            Dziękujemy za przesłanie formularza Na maila prześlemy wszelkie
            informacje o odbiorze.
        </h2>
    </div>
</header>
<%@include file="footer.jsp"%>
<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
