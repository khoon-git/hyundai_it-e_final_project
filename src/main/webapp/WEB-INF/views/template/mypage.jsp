<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		 <link rel="stylesheet" type="text/css" href="${app}/resources/css/mypage.css">
		 <link rel="shortcut icon" type="image/x-icon" href="${app}/resources/images/favicon.png">
		 <title>마이페이지</title>
	</head>
		<style>
	    div#bannerWrap {
            background: rgb(240, 246, 234);
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 5px;
        }

        p.quickmenu {
            font-size: 20px;
            font-weight: bold;
            margin-left: 15px;
        }

        .quickbtn_group {

            display: inline-flex;
            justify-content: flex-start;
            width: 100%;
            margin-left: 10px;
            align-items: center;
        }

        .quick_btn {
            border: 1px solid #ddd;
            padding: 2px 14px 4px 14px;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            border-radius: 5px;
            background: #fff;
            margin-right: 5px;
        }

        p.quickmenu {
            margin-right: 50px;
        }
        
        img.ic_img {
    	width: 30px;
    	}
    	span.headerspan {
    font-size: 12px;
    letter-spacing: -0.025em;
    font-weight: 400;
    color: #fff;
}
    	
		</style>
	<body>
		<tiles:insertAttribute name="header" />
		<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
        <div class="container">
            <div class="gird-l2x">
				<tiles:insertAttribute name="leftsidebar" />
		        <div class="contents">
		            <div class="mypage-order-wrap">
		            <tiles:insertAttribute name="quickmenu" />
				<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</body>
</html>