<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />

<div class="side-content">

    <h2 class="side-menu-title" onclick='javascript:location.href="${app}/cs/main"' style="cursor:pointer;">고객센터
    </h2>
    <div class="side-menu-list">
        <ul>
            <li><a href="#" onClick="window.open('${app}/cs/qnaInsPopUp','1:1 문의하기','width=756,height=700')">1:1 문의하기</a></li>

            <li><a href="#" onclick='javascript:location.href="${app}/cs/qna"'>내 상담내역 조회</a></li>

            <li><a class="#" href="${app}/cs/faq">자주 묻는 질문</a></li>

            <li><a href="${app}/cs/noticeList">공지사항</a></li>

        </ul>
    </div>
</div>
