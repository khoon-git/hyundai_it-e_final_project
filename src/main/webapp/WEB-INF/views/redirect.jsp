<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<html>
<head>
    <title>알림창</title>
</head>
<body>
<script>
function isUrl(l) {
	let url;
	console.log(l);
	if (l.charAt(0) == '/') {
		url = '<c:out value="${pageContext.request.contextPath}"/>' + l;
	}
	else if (l == 'window.close()') {
		window.close();
	}
	else {
		url = l;
	}
	return url;
}

    alert('${msg}');
    location.href=isUrl('${url}');
</script>
</body>
</html>